package com.Model.Account;

import com.Dao.Dao;
import com.Model.Account.Auth.AdminAuth;
import com.Model.Account.Auth.AuthTemplete;
import com.Model.Account.Auth.UserAuth;
import com.Model.Account.Manage.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserAccount {
    private String Role;

    public UserAccount() {
    }

    public UserAccount(String role) {
        Role = role;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    public String  Register(String username, String password, String mobile, Dao dao){
         DriveAccountTemplate driveAccountTemplate;
        if(Role.equalsIgnoreCase("admin")){
            driveAccountTemplate=new AdminDriveAccount();
        }else{
            driveAccountTemplate=new UserDriveAccount();
        }
        return driveAccountTemplate.createAccount(username,password,dao);
    }
    public void login(HttpServletRequest request, HttpServletResponse response){
        String Role=request.getParameter("role");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        boolean islogin=Boolean.parseBoolean(request.getParameter("islogin"));
        AuthTemplete authTemplete;
        if(Role.equalsIgnoreCase("admin")){
            authTemplete=new AdminAuth();
        }else{
            authTemplete=new UserAuth();
        }
        if(islogin){
           authTemplete.login(username,password,request,response);
        }else{
            authTemplete.logout(request,response);
        }
    }
}
