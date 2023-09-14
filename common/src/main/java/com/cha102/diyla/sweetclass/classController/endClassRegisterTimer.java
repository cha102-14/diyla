package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class endClassRegisterTimer implements ServletContextListener{
    private Timer timer;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("啟動課程註冊結束timer。");
        timer = new Timer();
        //設置每天零時的calendar
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        //設置timer
        Date midnight = calendar.getTime();
        long dailyInterval = 24 * 60 * 60 * 1000;
        timer.scheduleAtFixedRate(new Task(), midnight, dailyInterval);

    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("關閉課程註冊結束timer。");
        if(timer != null) {
            timer.cancel();
        }
        AbandonedConnectionCleanupThread.uncheckedShutdown();
    }
    private class Task extends TimerTask {
        public void run() {
            ClassService classService = new ClassService();
            String updateResult = classService.updateRegEndClass();
            System.out.println(updateResult);
        }
    }
}
