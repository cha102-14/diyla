package com.cha102.diyla.diyreservemodel;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class MailService {

    // 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
    public void sendMail(String to, String memName, String action) {

        try {
            // 設定使用SSL連線至 Gmail smtp Server
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
            // ●1) 登入你的Gmail的:
            // ●2) 點選【管理你的 Google 帳戶】
            // ●3) 點選左側的【安全性】

            // ●4) 完成【兩步驟驗證】的所有要求如下:
            //     ●4-1) (請自行依照步驟要求操作之.....)

            // ●5) 完成【應用程式密碼】的所有要求如下:
            //     ●5-1) 下拉式選單【選取應用程式】--> 選取【郵件】
            //     ●5-2) 下拉式選單【選取裝置】--> 選取【Windows 電腦】
            //     ●5-3) 最後按【產生】密碼
            final String myGmail = " tibame515@gmail.com";
            final String myGmail_password = "lovhtejsmiwtymkq";
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(myGmail, myGmail_password);
                }
            });
            // 寄信的前置
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myGmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // 定义邮件主题
            String subject = "DIYLA!預約訂位成功通知";

            // 定义邮件内容，使用 HTML 格式
            String messageText = "<html><body style='background-color: #FFD700;'>";
            messageText += "<p>" + memName + "先生/小姐，你好:</p>";
            messageText += "<p>您在DIYLA上的訂位已成立，若有任何疑問請聯繫我們!</p>";
            messageText += "</body></html>";

            // 設定信中的主旨
            message.setSubject(subject);
            // 設定信中的内容，以 HTML 格式
            message.setContent(messageText, "text/html; charset=utf-8");

            // 发送邮件
            Transport.send(message);
            System.out.println("傳送成功!");
        } catch (MessagingException e) {
            System.out.println("傳送失敗!");
            e.printStackTrace();
        }
    }
}
