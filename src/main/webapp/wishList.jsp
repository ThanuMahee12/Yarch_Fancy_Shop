<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays" %><%--
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
<section class="w-100">
    <div class="container">
        <div class="row">
            <%
                HttpSession session2=request.getSession();
                Dao dao1=(Dao) session2.getAttribute("dao");
                try{
                    Connection connection=dao1.getConnection();
                    Statement st=connection.createStatement();
                    Cookie c[]=request.getCookies();
                    for (Cookie ck:c) {
                        if(ck.getName().equals("wish")){
                            String wish= ck.getValue();
                            ResultSet rs=st.executeQuery("select * from products where id in ("+wish+")");
                            while (rs.next()){

            %>
            <div class="col-md-3 mb-4">
                <div class="card">
                    <img src="<%= rs.getString("image")%>" class="card-img-top" alt="Bike 1">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("name")%></h5>
                        <p class="card-text"><%= rs.getString("des")%></p>
                        <div class="d-flex justify-content-center align-items-center">
                            <button class="btn btn-primary mb-0 mx-2">Cart</button>
                            <a href="OneProduct.jsp?id=<%=rs.getString("id")%>" class="btn btn-info mb-0 mx-2">Order</a>
                            <button class="btn btn-danger mb-0 mx-2">Remove</button>
                        </div>

                    </div>
                </div>
            </div>



            <%
                            }
                        }

                    }
                }catch (Exception e){
                    e.printStackTrace();
                }

            %>
        </div>
    </div>
</section>
<%@include file="Footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
