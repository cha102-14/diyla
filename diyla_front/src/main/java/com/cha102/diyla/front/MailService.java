package com.cha102.diyla.front;

import ch.qos.logback.core.net.SyslogOutputStream;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;



public class MailService {


//    private JavaMailSender javaMailSender;
//
//    public MailService(JavaMailSender javaMailSender) {
//        this.javaMailSender = javaMailSender;
//    }
//
//    public void sendEmail(String to,String title,String context){
//        SimpleMailMessage mail = new SimpleMailMessage();
//        mail.setTo(to);
//        mail.setSubject(title);
//        mail.setText(context);
//        javaMailSender.send(mail);
//
//    }
    public static void sendEmail(String to,String title,String context){
        Properties props = new Properties();
        String host = "smtp.gmail.com";
//        String emailFrom = "feal1221@gmail.com";
//        String pw = "pgktgjhqndsinxci";

        String emailFrom = "shihshih.vivi@gmail.com";
        String pw ="afklxhhvhqcconbk";

        //支援TLS
//        props.put("mail.smtp.starttls.enable","true");
        //要連接的伺服器
        props.put("mail.smtp.host",host);
//        props.put("mail.smtp.user",emailFrom);
//        props.put("mail.smtp.password",pw);
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        //要連接伺服器埠號
        props.put("mail.smtp.port","465");
        //用AUTH命令對用戶進行身分驗證
        props.put("mail.smtp.auth","true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailFrom,pw);
            }
        });
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(emailFrom));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
            message.setSubject(title);
            message.setText(context);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }


    }


//    public static void main(String[] args){
////        String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
////        String code="";
////        for (int r = 1; r <= 10; r++) {
////            code = String.valueOf(s.charAt((int) (Math.random() * 61)));
////            System.out.print(code);
////        }
//        MailService mail = new MailService();
//        mail.sendEmail("vivi821221@yahoo.com.tw","歡迎加入會員","請點選以下認證信");
//
//    }
}

