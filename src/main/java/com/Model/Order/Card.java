package com.Model.Order;

import com.Dao.Dao;
import com.mysql.cj.Session;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.http.HttpResponse;

public class Card extends ProductAction{
    @Override
    protected boolean checkAvailability(int productid, int count, HttpServletRequest request) {
        return false;
    }

    @Override
    protected String displayFailMessage() {
        return "../Vechile.jsp?mes='Not Product avialable'";
    }

    @Override
    protected String displayConfirmation() {
        return "../Vechile.jsp?mes=' Product added'";
    }

    @Override
    protected void performSpecificAction(int productid, int count, HttpServletResponse response,HttpServletRequest request) {
        Cookie[] cookie=request.getCookies();
        String wishlist="";
        for (Cookie c:cookie) {
            if(c.getName().equals("card")){
                wishlist=c.getValue();
                wishlist.concat(","+productid);
                c.setValue(wishlist);
            }
        }
        try {
            response.sendRedirect("../Card.jsp?card="+wishlist);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


}
