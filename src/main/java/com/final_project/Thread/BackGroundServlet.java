package com.final_project.Thread;

import com.final_project.beans.Winner_Bean;
import com.final_project.models.Check_Win_Model;
import com.final_project.models.ManagerModel;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "BackGroundServlet")

public class BackGroundServlet extends HttpServlet implements Runnable {
    private static final long serialVersionUID = 1L;

    public void init() {
        try {
            Thread thread = new Thread(this);
            thread.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void run() {
        while (true) {
            try {
                System.out.println("startcheck");
                List<Winner_Bean> Result = Check_Win_Model.Get_Result_of_Product_Auction();
                if (Result.size() > 0) {
                    for (Winner_Bean wb : Result) {
                        if (wb.getWinner_name() == null) {
                            // khong co ai dau gia
                            String header = "Product Aucion Result";

                            String content = "Hello " + wb.getOwner_name() + "\n" +
                                    "Your Product: " + wb.getPname() + " has no bid on it and was end at " + wb.getEnd_Time();

                            String mail_to = wb.getOwner_email();

                            ServletUtils.send_mail_to_owner_when_no_one_bid(mail_to, header, content);
                        } else {
                            // gui toi chu san pham
                            String header = "Product Aucion Result";

                            String content_to_owner = "Hello " + wb.getOwner_name() + "\n" +
                                    "The winner of your product: " + wb.getPname() + " is: " + wb.getWinner_name() + "" +
                                    "\nwith price :" + wb.getWinner_price() + " after " + wb.getTotal_bid() + " bid at " + wb.getEnd_Time();

                            String mail_to_owner = wb.getOwner_email();
                            ServletUtils.send_mail_to_owner_when_somebody_win(mail_to_owner, header, content_to_owner);

                            // gui toi nguoi thang
                            String content_to_winner = "Congratulation " + wb.getWinner_name() + "\n" +
                                    "You are the winner of product: " + wb.getPname() + " with price: " + wb.getWinner_price() + " after " + wb.getTotal_bid() + " bids" + "\n" +
                                    "at " + wb.getEnd_Time();

                            String mail_to_winner = wb.getWinner_email();
                            ServletUtils.send_mail_to_winner(mail_to_winner, header, content_to_winner);

                            // sua status san pham thanh 0
                            ManagerModel.blockProduct(wb.getPro_id());

                            // them id nguoi thang va id san pham vao win_list
                            UserModel.add_To_win_list(wb.getPro_Auc_ID(), wb.getWinner_id());
                        }
                    }
                }
                Thread.sleep(30000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
