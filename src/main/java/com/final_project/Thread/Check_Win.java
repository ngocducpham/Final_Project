package com.final_project.Thread;

import com.final_project.beans.Winner_Bean;
import com.final_project.models.Check_Win_Model;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
        List<Winner_Bean> Result = Check_Win_Model.Get_Result_of_Product_Auction();
        if (Result.size() > 0) {
            for (Winner_Bean wb : Result) {
                if (wb.getWinner_name() == null) {
                    // ko co ng dau gia
                } else {
                    // gui toi chu san pham

                    // gui toi nguoi thang

                    // sua status san pham thanh 0
                }
            }
        }
    }
}
