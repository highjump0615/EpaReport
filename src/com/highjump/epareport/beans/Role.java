package com.highjump.epareport.beans;

/**
 * Created by high on 2017/7/29.
 */
public class Role extends BaseModel {

    private String name;
    private String desc;

    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
