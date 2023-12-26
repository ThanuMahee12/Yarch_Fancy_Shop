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
<div class="container d-flex vh-100 align-items-center">
    <h1 class="text-center w-100">
        <%
            HttpSession session12=request.getSession();
            String username11=(String)session12.getAttribute("user");
            String role=(String) session12.getAttribute("role");
            if(username11!=null){
        %>
        <%=username11%>
        <a href="controller/log.jsp?islogin=false&username=<%=username11%>&password=<%=""%>&role=<%=role%>">LogOut</a>
        <% } else{ %>
        Hi
        <a href="controller/log.jsp?islogin=false&username=<%=username11%>&password=<%=""%>&role=<%=role%>">LogOut</a>
        <%}%>
    </h1>

</div>
<%@include file="Footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
