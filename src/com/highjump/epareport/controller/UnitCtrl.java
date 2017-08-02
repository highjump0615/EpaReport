package com.highjump.epareport.controller;

import com.highjump.epareport.beans.Unit;
import com.highjump.epareport.utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.function.Function;

/**
 * Created by high on 2017/8/2.
 */
public class UnitCtrl {
    private static UnitCtrl ourInstance = new UnitCtrl();

    public static UnitCtrl getInstance() {
        return ourInstance;
    }

    private UnitCtrl() {
    }

    /**
     * 获取单位列表
     * @return
     */
    public ArrayList<Unit> getUnits(int id) {
        ArrayList<Unit> lstRest = new ArrayList<Unit>();

        String strSql = "select * from dept ";
        if (id > 0) {
            strSql += "where deptno = " + id;
        }

        try {
            boolean bResult = DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                @Override
                public Boolean apply(ResultSet resultSet) {

                    try {
                        while (resultSet.next()) {
                            Unit unit = new Unit();
                            unit.setId(resultSet.getInt("deptno"));
                            unit.setName(resultSet.getString("name"));
                            unit.setNumber(resultSet.getString("epanumber"));
                            unit.setContact(resultSet.getString("contact"));

                            lstRest.add(unit);
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    return true;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lstRest;
    }
}
