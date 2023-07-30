package com.cha102.diyla.commodityModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CommodityDaoImpl implements CommodityDao{
    public static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }
    public static final String INSERT_SQL = "INSERT INTO COMMODITY (COM_CLASS_NO,COM_NAME,COM_PIC,COM_DES,COM_PRI,COM_QUA,COM_STATE) VALUES (?,?,?,?,?,?,?);";

    public int insert(CommodityVO commodity) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL);) {
            conn.setAutoCommit(false);
            ps.setInt(1, commodity.getComClassNo());
            ps.setString(2,commodity.getComNAME());
            ps.setBytes(3,commodity.getComPic());
            ps.setString(4,commodity.getComDes());
            ps.setDouble(5,commodity.getComPri());
            ps.setInt(6,commodity.getComQua());
            ps.setInt(7,commodity.getComState());
            int i = ps.executeUpdate();
            if (i > 0) {
                conn.commit();
                return i;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


}
