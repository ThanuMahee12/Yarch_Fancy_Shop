package com.Model.Order;

import com.Dao.Dao;
import com.mysql.cj.Session;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class WishList extends  ProductAction{
    @Override
    protected boolean checkAvailability(int productid, int count, HttpServletRequest request) {
        boolean res=false;
        HttpSession session=request.getSession();
        if(session.getAttribute("uid")!=null) {
            Dao dao3 = (Dao) session.getAttribute("dao");
            try {
                Connection connection = dao3.getConnection();
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery("select number_of_product from products where id=" + productid);
                int num = 0;
                while (rs.next()) {
                    num = rs.getInt("number_of_product");
                }
                res = num >= 1;
            }catch (Exception e){
                e.printStackTrace();
                res=false;
            }
        }else {
            res=false;
        }

        return res;
    }

    @Override
    protected String displayFailMessage() {

        return "../Vechile.jsp?mes='Not Product avialable'";
    }

    @Override
    protected String displayConfirmation() {
        return  "../wishList.jsp?mes='Product added'";
    }

    @Override
    protected void performSpecificAction(int productid, int count, HttpServletResponse response,HttpServletRequest request) {
        Cookie[] cookie=request.getCookies();
        Cookie cookie1=null;
        for (Cookie c:cookie) {
            if(c.getName().equals("wish")){
                cookie1=c;
            }
        }
        if(cookie1==null){
            cookie1=new Cookie("wish",String.format("%d,",productid));
            cookie1.setMaxAge(10*24*60*60*1000);
        }else {
            String wish=cookie1.getValue()+String.valueOf(productid);
            cookie1.setValue(wish);
            response.addCookie(cookie1);
            cookie1.setMaxAge(10*24*60*60*1000);
        }


    }


}
