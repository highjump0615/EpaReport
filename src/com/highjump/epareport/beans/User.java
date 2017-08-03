package com.highjump.epareport.beans;

public class User extends BaseModel {

    private String userName;
    private String password;
    private String name;

    // 角色
    private Role role;
    // 单位
    private Unit unit;

    // get/set
    public String getName() {
        return name;
    }
    public String getUserName() {
        return userName;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Role getRole() {
        return role;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }
}
