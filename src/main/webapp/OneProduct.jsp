<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: thanu
  Date: 7/27/2023
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@include file="bean.jsp"%>
<%@include file="header.jsp"%>
<%
    HttpSession session2=request.getSession();
    Dao dao1=(Dao) session2.getAttribute("dao");
    try{
        Connection connection=dao1.getConnection();
        Statement st=connection.createStatement();
        String id=request.getParameter("id");
        ResultSet rs=st.executeQuery("select * from products where id="+id);
        while (rs.next()){
%>
<div class="container mt-5">
    <div class="row vh-100">
        <div class="col-md-6">
            <img src="<%= rs.getString("image")%>" alt="Product Image" class="img-fluid">
        </div>
        <div class="col-md-6 mt-5">
            <h2><%= rs.getString("name")%></h2>
            <p><%= rs.getString("des")%></p>
            <p>Price: Rs.<%= rs.getString("price")%></p>
            <form action="controller/book.jsp" method="post">
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" name="quantity" class="form-control" value="1" min="1">
                <input type="hidden" name="id" class="form-control" value="<%= rs.getString("id")%>" >
            </div>
            <button type="submit" class="btn btn-primary">Buy</button>
        </div>
        </form>
    </div>
</div>
<%
        }
    }catch (Exception e){
        e.printStackTrace();
    }

%>
<%@include file="Footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
