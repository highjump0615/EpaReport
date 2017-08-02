package com.highjump.epareport.utils;

import java.sql.*;
import java.util.function.Function;

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

    /**
     * 查询
     * @param strSql
     * @param setResult
     * @return
     * @throws SQLException
     */
    public boolean executeSql(String strSql, Function<ResultSet, Boolean> setResult) throws SQLException {

        Statement stmt = null;
        ResultSet rset = null;

        if (mConnection == null) {
            setConnection();
        }
        stmt = mConnection.createStatement();

        rset = stmt.executeQuery(strSql);

        boolean bResult = setResult.apply(rset);

        rset.close();
        rset = null;
        stmt.close();
        stmt = null;

        return bResult;
    }

    /**
     * 添加、更新、删除
     * @param strSql
     * @throws SQLException
     */
    public boolean executeUpdateSql(String strSql) throws SQLException {
        if (mConnection == null) {
            setConnection();
        }
        Statement stmt = mConnection.createStatement();
        int nRow = stmt.executeUpdate(strSql);
        mConnection.commit();

        return nRow > 0;
    }

}
