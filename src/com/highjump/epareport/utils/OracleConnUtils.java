package com.highjump.epareport.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnUtils {

    public static Connection getOracleConnection() throws ClassNotFoundException, SQLException {

        // Note: Change the connection parameters accordingly.
        String hostName = "192.168.0.22";
        String sid = "orcl";
        String userName = "scott";
        String password = "root";

        return getOracleConnection(hostName, sid, userName, password);
    }

    public static Connection getOracleConnection(String hostName, String sid,
                                                 String userName, String password) throws ClassNotFoundException, SQLException {

        // Declare the class Driver for ORACLE DB
        // This is necessary with Java 5 (or older)
        // Java6 (or newer) automatically find the appropriate driver.
        // If you use Java> 5, then this line is not needed.
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // URL Connection for Oracle
        // Example: jdbc:oracle:thin:@localhost:1521:db11g
        String connectionURL = "jdbc:oracle:thin:@" + hostName + ":1521:" + sid;

        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }

}
