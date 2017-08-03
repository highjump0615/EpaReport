package com.highjump.epareport.beans;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class LoginLog extends BaseModel {

    private Timestamp time;
    private String ip;
    private User user;

    public Timestamp getTime() {
        return time;
    }

    public String getIp() {
        return ip;
    }

    public User getUser() {
        return user;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /**
     * 获取时间
     * @return
     */
    public String getTimeFormatted() {
        String strTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time);
        return strTime;
    }
}
