package com.cha102.diyla.commodityClassModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommodityClassDaoImpl implements CommodityClassDao {
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private final String INSERT_SQL = "INSERT INTO COMMODITY_CLASS (COM_CLASS_NAME) VALUES (?);";

    public final String GET_ALL = "SELECT * FROM COMMODITY_CLASS ;";

    public static final String FIND_BY_ID = "SELECT * FROM commodity_class where COM_CLASS_NO=?";


    @Override
    public int insert(CommodityClassVO commodityClass) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL);) {
            conn.setAutoCommit(false);
            ps.setString(1, commodityClass.getComClassName());
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
    public List<CommodityClassVO> getAll() {

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL);) {
            ResultSet resultSet = ps.executeQuery();
            List<CommodityClassVO> commodityClasses = new ArrayList<>();
            while (resultSet.next()) {
                CommodityClassVO commodityClass = new CommodityClassVO();
                buildCommodityClass(commodityClass, resultSet);
                commodityClasses.add(commodityClass);
            }
            resultSet.close();
            return commodityClasses;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public CommodityClassVO findByID(Integer comClassNo) {
        try (Connection conn = ds.getConnection();
        PreparedStatement pstt = conn.prepareStatement(FIND_BY_ID)){
            pstt.setInt(1,comClassNo);
            ResultSet resultSet = pstt.executeQuery();
            if (resultSet.next()) {
                CommodityClassVO commodityClassVO = new CommodityClassVO();
                buildCommodityClass(commodityClassVO,resultSet);
                resultSet.close();
                return commodityClassVO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static void buildCommodityClass(CommodityClassVO commodityClass, ResultSet resultSet) throws SQLException {
        commodityClass.setComClassNo(resultSet.getInt(1));
        commodityClass.setComClassName(resultSet.getString(2));
        commodityClass.setUpdateTime(resultSet.getTimestamp(3));
    }
}