package com.Model.Account.Auth;

import com.Dao.Dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminAuth extends AuthTemplete {

    @Override
    protected String wrongAction() {

            return "../login.jsp?mes='invalid login'";

    }

    @Override
    protected String correctAction() {
            return "../admin.jsp?mes='scessful'";
    }

    @Override
    protected boolean querychecked(String username, String password, HttpServletRequest request, HttpServletResponse response) {

        try{
            HttpSession session=request.getSession();
            Dao dao=(Dao)session.getAttribute("dao");
            Connection connection=dao.getConnection();
            PreparedStatement ps= connection.prepareStatement("select * from admin where username=? && password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                uid=rs.getString("userid");
            }
            session.setAttribute("uid",uid);
            session.setAttribute("user",username);
            return rs.isBeforeFirst();
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
}
