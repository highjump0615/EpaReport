package com.highjump.epareport.utils;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by high on 2017/7/27.
 */
public class ConnectionUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {

        // Here I using Oracle Database.
        Connection conn = OracleConnUtils.getOracleConnection();
        conn.setAutoCommit(false);

        return conn;
    }

    public static void closeQuietly(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void rollbackQuietly(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
        }
    }
}
