package com.Model.Order;

import com.Dao.Dao;
import com.mysql.cj.Session;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class Booking extends  ProductAction{
    @Override
    protected boolean checkAvailability(int productid, int count, HttpServletRequest request) {
        boolean res=false;
        try{
            HttpSession session=request.getSession();
            Dao dao=(Dao)session.getAttribute("dao");
            Connection connection=dao.getConnection();
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery("select number_of_product from products where id="+productid);
            int num=0;
            while (rs.next()){
                num=rs.getInt("number_of_product");
            }
           res=num>=count;
            return res;
        }catch (Exception exception){
            exception.printStackTrace();
        }
        return res;
    }

    @Override
    protected String displayFailMessage() {
       return "../Vechile.jsp?mes='Not Product avialable'";
    }

    @Override
    protected String displayConfirmation() {
        return "../Booking.jsp?mes='Product Added'";
    }

    @Override
    protected void performSpecificAction(int productid,int count, HttpServletResponse response,HttpServletRequest request) {
        try{
            HttpSession session=request.getSession();
            Dao dao=(Dao)session.getAttribute("dao");
            Connection connection=dao.getConnection();
            String user=(String)session.getAttribute("uid");
            PreparedStatement ps=connection.prepareStatement("INSERT INTO `booking` (`productid`, `Booking date`, `user`, `numberofProduct`) VALUES (?,?,?,?)");
            ps.setInt(1,productid);
            Date d=new Date();
            ps.setDate(2,new java.sql.Date(d.getYear(),d.getMonth(),d.getDate()));
            ps.setString(3,user);
            ps.setInt(4,count);
            ps.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
