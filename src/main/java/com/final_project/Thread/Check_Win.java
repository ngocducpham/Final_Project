package com.final_project.Thread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Check_Win implements ServletContextListener {
    private ScheduledExecutorService scheduler = null;

    public void contextInitialized(ServletContextEvent sce) {
        if ((scheduler == null) || (!scheduler.isTerminated())) {
            scheduler = Executors.newSingleThreadScheduledExecutor();
            scheduler.scheduleAtFixedRate(new ScheduledTask(), 0, 60, TimeUnit.SECONDS);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        try {
            System.out.println("Scheduler Shutting down successfully " + new Date());
            scheduler.shutdown();
        } catch (Exception ex) {

        }
    }
}

class ScheduledTask extends TimerTask {
    public void run() {
        // xu ly
        System.out.println(new Date());

    }
}
