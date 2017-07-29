package com.highjump.epareport.beans;

/**
 * Created by high on 2017/7/28.
 */
public class User extends BaseModel {

    private String userName;
    private String password;
    private String name;

    private Role role;

    // get/set
    public String getName() {
        return name;
    }
    public String getPassword() {
        return password;
    }
    public String getUserName() {
        return userName;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setPassword(String password) {
        this.password = password;
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
}
