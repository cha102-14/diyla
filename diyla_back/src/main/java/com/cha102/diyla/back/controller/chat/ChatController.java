package com.cha102.diyla.back.controller.chat;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.cha102.diyla.chatModel.ChatMessage;
import com.cha102.diyla.chatModel.State;
import com.cha102.diyla.util.JedisHandleMessage;
import com.google.gson.Gson;


@ServerEndpoint("/chat/{empId}")
public class ChatController {
    private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
    Gson gson = new Gson();
    private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @OnOpen
    public void onOpen(@PathParam("empId") String userName, Session userSession) throws IOException {

        /* save the new user in the map */
        sessionsMap.put(userName, userSession);
        /* Sends all the connected users to the new user */
        Set<String> userNames = sessionsMap.keySet();
        State stateMessage = new State("open", userName, userNames, SIMPLE_DATE_FORMAT.format(new Date()));
        String stateMessageJson = gson.toJson(stateMessage);
        Collection<Session> sessions = sessionsMap.values();
        for (Session session : sessions) {
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(stateMessageJson);
            }
        }

        String text = String.format("Session ID = %s, connected; userName = %s%nusers: %s", userSession.getId(),
                userName, userNames);
        System.out.println(text);
    }

    @OnMessage
    public void onMessage(Session userSession, String message) {
        ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
        String sender = chatMessage.getSender();
        String receiver = chatMessage.getReceiver();


        if ("history".equals(chatMessage.getType())) {
            List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
            String historyMsg = gson.toJson(historyData);
            ChatMessage cmHistory = new ChatMessage("history", sender, receiver, historyMsg);
            if (userSession != null && userSession.isOpen()) {
                userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
                System.out.println("history = " + gson.toJson(cmHistory));
                return;
            }
        }


        Session receiverSession = sessionsMap.get(receiver);
        if (receiverSession != null && receiverSession.isOpen()) {
            receiverSession.getAsyncRemote().sendText(message);
            userSession.getAsyncRemote().sendText(message);
            JedisHandleMessage.saveChatMessage(sender, receiver, message);
        }
        System.out.println("Message received: " + message);
    }

    @OnError
    public void onError(Session userSession, Throwable e) {
        System.out.println("Error: " + e.toString());
    }

    @OnClose
    public void onClose(Session userSession, CloseReason reason) {
        String userNameClose = null;
        Set<String> userNames = sessionsMap.keySet();
        for (String userName : userNames) {
            if (sessionsMap.get(userName).equals(userSession)) {
                userNameClose = userName;
                sessionsMap.remove(userName);
                break;
            }
        }

        if (userNameClose != null) {
            State stateMessage = new State("close", userNameClose, userNames, SIMPLE_DATE_FORMAT.format(new Date()));
            String stateMessageJson = gson.toJson(stateMessage);
            Collection<Session> sessions = sessionsMap.values();
            for (Session session : sessions) {
                session.getAsyncRemote().sendText(stateMessageJson);
            }
        }

        String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
                reason.getCloseCode().getCode(), userNames);
        System.out.println(text);
    }
}