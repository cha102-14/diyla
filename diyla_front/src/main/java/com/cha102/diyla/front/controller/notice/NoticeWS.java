package com.cha102.diyla.front.controller.notice;

import com.cha102.diyla.util.JedisNotice;
import com.google.gson.Gson;

import javax.websocket.*;
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
        //一連線先執行一次
        List<String> data = JedisNotice.getJedisNotice(memId);
        Collection<Session> memIdSessions = sessionMap.values();
        for (Session session : memIdSessions){
            if(session.isOpen()){
                session.getAsyncRemote().sendText(gson.toJson(data));
            }
        }

        //排程器 定時取出redis 送到前端
        timer = new Timer();
        timer.schedule(new Task(),3000,5000);
    }


    @OnMessage //當收到前端訊息時移除redis
    public void onMessage(Session memIdSession,String message){

        Set<Integer> memIds = sessionMap.keySet();
        for (Integer memId : memIds){
            System.out.println("get"+memId);
            JedisNotice.delJedisNotice(memId);
            System.out.println("delete");
        }
        System.out.println(message);


    }
    @OnClose
    public void onClose(){
        timer.cancel();
        timer.purge();
    }
    @OnError
    public void onError(Session memIdSession,Throwable e){
        System.out.println("Error");
    }

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
                    System.out.println("send"+data);
                }
            }

//            onMessage(memIdSession,memId);
            //裡面放onmessage方法
            //裡面放取出redis 丟到前端 onmessage移除redis的值?
//            onopen連線

//一連線先取得ID 取出redis 丟到前端

        }
    }

}
