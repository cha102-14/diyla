
package com.cha102.diyla.sweetclass.classModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ClassOrderDAOImpl implements ClassOrderDAO {

    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }
    @Override
    public List<ClassOrderDTO> findById(Integer memID){

        String sql = "select c.CLASS_ID,STATUS,CLASS_PIC,CLASS_NAME,CLASS_DATE,TOTAL_PRICE from DIYLA.class c join diyla.class_reserve cr on c.CLASS_ID = cr.CLASS_ID where mem_id=?";
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        List<ClassOrderDTO> classOrderList = new ArrayList<>();
        ClassOrderDTO classOrderDTO = null;
        try {
            con = ds.getConnection();
            pre = con.prepareStatement(sql);
            pre.setInt(1, memID);
            rs = pre.executeQuery();
            while (rs.next()) {
                classOrderDTO = new ClassOrderDTO();
                classOrderDTO.setClassId(rs.getInt("classId"));
                classOrderDTO.setStatus(rs.getByte("status"));
                classOrderDTO.setClassPic(rs.getBytes("classPic"));
                classOrderDTO.setClassName(rs.getString("className"));
                classOrderDTO.setClassDate(rs.getDate("classDate"));
                classOrderDTO.setTotalPrice(rs.getInt("totalPrice"));
                classOrderList.add(classOrderDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pre != null) {
                try {
                    pre.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }

        return classOrderList;

    }
}
