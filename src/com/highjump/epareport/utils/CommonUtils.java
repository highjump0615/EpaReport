package com.highjump.epareport.utils;

import com.highjump.epareport.beans.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

public class CommonUtils {
    public static void storeCurrentUser(HttpSession session, User user) {
        session.setAttribute("currentUser", user);
    }

    public static User getCurrentUser(HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        return currentUser;
    }
}
