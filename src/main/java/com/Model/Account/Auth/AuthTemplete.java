package com.Model.Account.Auth;

import com.Dao.Dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

public abstract class AuthTemplete {
    private String username, password;
    protected String uid;

    public final void login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        setInput(username, password);
        String result="";
        if (validate()) {
            if (querychecked(username, password, request,response)) {
               result=correctAction();
            } else {
                result=wrongAction();
            }
            try {
                response.sendRedirect(result);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public final void logout(HttpServletRequest request,HttpServletResponse response) {
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("uid");
        session.removeAttribute("role");
        try {
            response.sendRedirect("../login.jsp?mess='logout'");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void setInput(String username, String password) {
        this.username = username;
        this.password = password;
    }

    private boolean validate() {
        if (!username.isEmpty() && !username.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }

    protected abstract String wrongAction();

    protected abstract String correctAction();
    protected abstract boolean querychecked(String username, String password, HttpServletRequest request,HttpServletResponse response);


}
