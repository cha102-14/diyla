package com.common.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ArtPhotoInsert {
    public static void main(String[] args) throws IOException {
        String URL = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei&useSSL=false";
        String USER = "root";
        String PASSWORD = "123456";

        for (int i = 1; i <= 2; i++) {
            File file = new File("C:/Image/1 (" + i + ").jpg");
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement("UPDATE latestnews SET ANN_PIC = ? WHERE NEWS_NO = ?")) {
                ps.setBinaryStream(1, bis);
                ps.setInt(2, i);
                ps.executeUpdate();
                System.out.println("最新消息新增成功");
            } catch (SQLException e) {
                e.printStackTrace();

            }finally {
                bis.close();
            }
        }

        for (int i = 3; i <= 12; i++) {
            File file = new File("C:/Image/1 (" + i + ").jpg");
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement("UPDATE article SET ART_PIC = ? WHERE ART_NO = ? ")) {
                ps.setBinaryStream(1, bis);
                ps.setInt(2, (i-2));
                ps.executeUpdate();
                System.out.println("論壇新增成功");
            } catch (SQLException e) {
                e.printStackTrace();

            }finally {
                bis.close();
            }
        }
    }
}
