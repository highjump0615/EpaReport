package com.highjump.epareport.utils;

import java.sql.*;
import java.util.Vector;

/**
 * Created by high on 2017/7/27.
 */
public class DBUtils {

    private static DBUtils mInstance = null;
    private Connection mConnection;

    public static DBUtils getInstance() {
        if (mInstance == null) {
            mInstance = new DBUtils();
            mInstance.setConnection();
        }

        return mInstance;
    }

    /**
     * get / set
     */
    public void setConnection() {
        try {
            mConnection = ConnectionUtils.getConnection();
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Vector executeSql(String strSql) throws SQLException {

        Statement stmt = null;
        ResultSet rset = null;

        Vector vctReturn = new Vector();
        Vector vctRow = null;

        String strContent = null;
        stmt = mConnection.createStatement();

        rset = stmt.executeQuery(strSql);
        ResultSetMetaData rsmd = rset.getMetaData();
        int nColumnCount = rsmd.getColumnCount();

        while(rset.next()) {
            vctRow = new Vector();

            for(int i = 1; i <= nColumnCount; ++i) {
                String strtemp = rset.getString(i);
                if(strtemp == null) {
                    strContent = null;
                } else {
                    strContent = strtemp;
                }

                vctRow.add(strContent);
            }

            vctReturn.add(vctRow);
        }

        rset.close();
        rset = null;
        stmt.close();
        stmt = null;

        return vctReturn;
    }

}
