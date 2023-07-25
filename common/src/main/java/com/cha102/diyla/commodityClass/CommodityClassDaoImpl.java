package com.cha102.diyla.commodityClass;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommodityClassDaoImpl implements CommodityClassDao{
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public CommodityClassVO insret(CommodityClassVO commodityClass) {
        return null;
    }
}
