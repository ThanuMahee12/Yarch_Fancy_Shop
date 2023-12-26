package com.Model.Order;

import com.Dao.Dao;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;

public abstract  class ProductAction {
    public final String performAction(int productid,int count,HttpServletRequest request,HttpServletResponse response) {
        if(checkAvailability(productid,count,request)){
            performSpecificAction(productid,count,response,request);
            return displayConfirmation();
        }
        else{
            return displayFailMessage();
        }
    }

    protected abstract boolean checkAvailability(int productid,int count,HttpServletRequest request);
    protected abstract String displayFailMessage();
    protected abstract String displayConfirmation() ;

     protected abstract void performSpecificAction(int productid, int count, HttpServletResponse response, HttpServletRequest request);
}
