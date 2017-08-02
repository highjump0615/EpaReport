package com.highjump.epareport.beans;

public class Category extends BaseModel {

    public static int LEVEL_CATEGORY = 1;
    public static int LEVEL_SUBCATEGORY = 2;
    public static int LEVEL_PRODUCT = 3;

    private String name;
    private Category parent;
    private String version;
    private String formFile;
    private int level;

    // get/set
    public String getName() {
        return name;
    }

    public Category getParent() {
        return parent;
    }

    public String getVersion() {
        return version;
    }

    public String getFormFile() {
        return formFile;
    }

    public int getLevel() {
        return level;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public void setFormFile(String formFile) {
        this.formFile = formFile;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * 获取上级分类
     * @param level 级别
     * @return
     */
    public Category getParentCategory(int level) {

        Category catRes = this;

        // 级别小，直接退出
        if (catRes.getLevel() < level) {
            return null;
        }

        while (catRes.getLevel() > level) {
            catRes = catRes.getParent();
        }

        return catRes;
    }
}
