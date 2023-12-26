<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.Model.Order.Booking" %>
<%@ page import="com.Model.Order.ProductAction" %>
<%@include file="../bean.jsp"%>
<%

    if(request!=null) {
        int id = Integer.parseInt(request.getParameter("id"));
        int count = Integer.parseInt(request.getParameter("quantity"));
        if(id!=0 && count!=0){
            ProductAction booking=new Booking();
            String result=booking.performAction(id,count,request,response);
            response.sendRedirect(result);
        }
    }

%>
