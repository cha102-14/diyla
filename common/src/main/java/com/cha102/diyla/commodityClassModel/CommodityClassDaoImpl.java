package com.cha102.diyla.commodityClassModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

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

    public static final String INSERT_SQL = "INSERT INTO COMMODITY_CLASS (COM_CLASS_NAME) VALUES (?);";

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
    public CommodityClassVO insret(CommodityClassVO commodityClass) {
        return null;
    }
}
