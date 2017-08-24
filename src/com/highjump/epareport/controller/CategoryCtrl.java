package com.highjump.epareport.controller;

import com.highjump.epareport.beans.Category;
import com.highjump.epareport.utils.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

/**
 * Created by high on 2017/8/2.
 */
public class CategoryCtrl {
    private static CategoryCtrl ourInstance = new CategoryCtrl();

    public static CategoryCtrl getInstance() {
        return ourInstance;
    }

    private CategoryCtrl() {
    }

    /**
     * 获取分类
     * @return 列表
     */
    public ArrayList<Category> getCategories(int level, int parent) {
        ArrayList<Category> lstRest = new ArrayList<Category>();

        ArrayList<Category> lstTemp = new ArrayList<Category>();

        String strSql = "select * from category ";
        if (level > 0) {
            strSql += "where categorylevel < " + level;
        }

        try {
            boolean bResult = DBUtils.getInstance().executeSql(strSql, new Function<ResultSet, Boolean>() {
                @Override
                public Boolean apply(ResultSet resultSet) {

                    try {
                        while (resultSet.next()) {
                            Category category = new Category();
                            category.setId(resultSet.getInt("categoryno"));
                            category.setName(resultSet.getString("name"));
                            category.setVersion(resultSet.getString("version"));
                            category.setFormFile(resultSet.getString("dataform"));
                            category.setLevel(resultSet.getInt("categorylevel"));

                            int nParentId = resultSet.getInt("parentno");

                            // 查询上级
                            if (nParentId > 0) {
                                for (Category cat : lstTemp) {
                                    if (cat.getId() == nParentId) {
                                        category.setParent(cat);
                                        break;
                                    }
                                }
                            }

                            lstTemp.add(category);
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

        // 整理
        for (Category cat : lstTemp) {
            boolean bAdd = false;

            if (level == 0 && cat.getFormFile() != null) {
                bAdd = true;
            }
            else if (level > 0) {
                if (cat.getLevel() == level - 1) {
                    if (parent == 0) {
                        bAdd = true;
                    }
                    if (parent > 0 && cat.getParent().getId() == parent) {
                        bAdd = true;
                    }
                }
                else {
                    bAdd = true;
                }
            }

            if (bAdd) {
                lstRest.add(cat);
            }
        }

        return lstRest;
    }
}
