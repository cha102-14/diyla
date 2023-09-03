package com.cha102.diyla.front.controller.notice;

import com.google.gson.Gson;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collection;
import java.util.Map;
import java.util.Stack;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/NoticeWS/{memId}")
public class NoticeWS {
    private  static Map<Integer,Session> sessionMap = new ConcurrentHashMap<>();
    Gson gson = new Gson();

    @OnOpen
    public void onOpen(@PathParam("memId")Integer memId,Session memIdSession )throws IOException {
        sessionMap.put(memId,memIdSession);
        Collection<Session> sessions = sessionMap.values();
        for(Session session:sessions){
            if(session.isOpen()){
                session.getAsyncRemote().sendText("Hello");
            }
        }
        String text = String.format("12345",memIdSession.getId());
        System.out.println(text);



    }

}
