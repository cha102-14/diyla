package com.cha102.diyla.commodityModel;

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

public class CommodityDaoImpl implements CommodityDao {
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public static final String GET_ALL_SQL = "SELECT * FROM COMMODITY";
    public static final String INSERT_SQL = "INSERT INTO COMMODITY (COM_CLASS_NO,COM_NAME,COM_PIC,COM_DES,COM_PRI,COM_QUA,COM_STATE) VALUES (?,?,?,?,?,?,?);";

    public int insert(CommodityVO commodity) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL);) {
            conn.setAutoCommit(false);
            ps.setInt(1, commodity.getComClassNo());
            ps.setString(2, commodity.getComNAME());
            ps.setBytes(3, commodity.getComPic());
            ps.setString(4, commodity.getComDes());
            ps.setDouble(5, commodity.getComPri());
            ps.setInt(6, commodity.getComQua());
            ps.setInt(7, commodity.getComState());
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

    @Override
    public List<CommodityVO> getAll() {
        List<CommodityVO> commodities = new ArrayList<>();
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_SQL)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommodityVO commodity = new CommodityVO();
                commodity.setComNO(rs.getInt(1));
                commodity.setComClassNo(rs.getInt(2));
                commodity.setComNAME(rs.getString(3));
                commodity.setComPic(rs.getBytes(4));
                commodity.setComDes(rs.getString(5));
                commodity.setComPri(rs.getInt(6));
                commodity.setComQua(rs.getInt(7));
                commodity.setComState(rs.getInt(8));
                commodity.setCommentTotal(rs.getInt(9));
                commodity.setRatingSum(rs.getInt(10));
                commodity.setUpdateTime(rs.getTimestamp(11));

                commodities.add(commodity);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
