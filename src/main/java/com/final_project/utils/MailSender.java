package com.final_project.utils;

import com.final_project.beans.User;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class MailSender {

    public static String getCode() {
        Random r = new Random();
        int n = r.nextInt(9999);
        return String.format("%06d", n);
    }

    public static boolean sendMail_to_Active_Account(User user) {
        boolean success = false;

        String mail_to = user.getEmail();
        String fromServer = "", password = "";

        try {
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromServer, password);
                }
            });
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromServer));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail_to));
            message.setSubject("Subject");
            message.setText("Use this code to verify your Account: "+user.getCode());
            Transport.send(message);
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
