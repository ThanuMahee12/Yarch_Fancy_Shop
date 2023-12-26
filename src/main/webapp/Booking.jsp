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
<%@include file="header.jsp"%>
<%@include file="bean.jsp"%>
<div class="container vh-100 mt-5">
  <div class="row mt-5">
    <table class="table table-striped table-hover mt-5">
      <thead>
      <tr>
        <th scope="col">Product</th>
        <th scope="col">BookDate</th>
        <th scope="col">ProductName</th>
        <th scope="col">Count</th>
        <th scope="col">Action</th>
      </tr>
      </thead>
      <tbody>
      <%
      HttpSession session4=request.getSession();
        Dao dao5=(Dao) session4.getAttribute("dao");
        Connection connection=dao5.getConnection();
        Statement st=connection.createStatement();
        session4.setAttribute("uid","U-1690644757932");
        String userid=(String) session4.getAttribute("uid");
        ResultSet rs=st.executeQuery(String.format("select * from book where user='%s'",userid));
        while (rs.next()){
          %>
      <tr>
        <td><img src="<%= rs.getString("image")%>" class="img-thumbnail rounded img-thumbnail" width="100px" height="100px" alt="..."></td>
        <td><%= rs.getString("date")%></td>
        <td><%= rs.getString("name")%></td>
        <td><%= rs.getString("count")%></td>
        <td>
          <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <a href="controller/pdf.jsp?bid=<%= rs.getString("bookid")%>" class="btn btn-danger">Pdf</a>
            <a href="controller/xl.jsp?bid=<%= rs.getString("bookid")%>" class="btn btn-success">Excel</a>
          </div>
        </td>
      </tr>
      <%
        }
      %>

      </tbody>
    </table>
  </div>

</div>


<%@include file="Footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
