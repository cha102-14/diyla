package com.cha102.diyla.front.controller.notice;

import com.cha102.diyla.util.JedisNotice;
import com.google.gson.Gson;

import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;


@ServerEndpoint("/NoticeWS/{memId}")
public class NoticeWS {
    private static Map<Integer,Session> sessionMap = new ConcurrentHashMap<>();  //與websocket連線的session
    Gson gson = new Gson();
    private Timer timer;


    @OnOpen
    public void onOpen(@PathParam("memId")Integer memId,Session memIdSession )throws IOException {
        sessionMap.put(memId,memIdSession);
//        String idJson = gson.toJson(memId);
//            if(memIdSession.isOpen()){
//                memIdSession.getAsyncRemote().sendText(idJson);
//            }
//        System.out.println(memId);
        timer = new Timer();
        timer.schedule(new Task(),5000);
    }


    @OnMessage //當有新的個人通知觸發  or 當有狀態改變(黑名單狀態/檢舉新增/留言新增/代幣新增)時觸發
    public void onMessage(Session memIdSession,String message){
        Set<Integer> memIds = sessionMap.keySet();
        List<String> data = null;
        for (Integer memId : memIds){
            System.out.println(memId);
            JedisNotice.delJedisNotice(memId);
        }
        System.out.println(message);
        System.out.println("delete");


    }
    @OnError
    public void onError(Session memIdSession,Throwable e){
        System.out.println("Error");
    }
//    @OnClose
//    public void onClose(Session memIdSession){
//
//    }
    public class Task extends TimerTask implements Runnable{
        public void run(){
            Set<Integer> memIds = sessionMap.keySet();
            List<String> data = null;
            for (Integer memId : memIds){
                data = JedisNotice.getJedisNotice(memId);

            }

            Collection<Session> memIdSessions = sessionMap.values();
            for (Session session : memIdSessions){
                if(session.isOpen()){
                   session.getAsyncRemote().sendText(gson.toJson(data));
                }

            }

//            onMessage(memIdSession,memId);
            //裡面放onmessage方法
            //裡面放取出redis 丟到前端 onmessage移除redis的值?
//



        }
}

}
