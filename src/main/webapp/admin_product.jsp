<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: thanu
  Date: 7/29/2023
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="bean.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>One Page App with Scroll Spy</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="row vh-100">
    <%@include file="adminSide.jsp"%>
        <div class="col-md-9 col-lg-10">
            <h2>Product Details</h2>

            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                <tr>
                    <th>Product</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Available Count</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    HttpSession s=request.getSession();
                    Dao doo=(Dao)s.getAttribute("dao");
                    Connection con=doo.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from products");
                    while (rs.next()){
                %>
                <tr>
                    <td>
                        <img src="<%=rs.getString("image")%>" alt="Product 1" width="40">
                        <%=rs.getString("name")%>
                    </td>
                    <td><%=rs.getString("des")%></td>
                    <td>Rs<%=rs.getString("price")%></td>
                    <td><%=rs.getString("number_of_product")%></td>
                    <td>
                        <button class="btn btn-danger btn-sm">Delete</button>
                        <button class="btn btn-info btn-sm">Edit</button>
                    </td>
                </tr>
                <%

                    }%>
                <!-- Add more rows for other products -->
                </tbody>
            </table>
        </div>

</div>
<%@include file="Footer.jsp"%>
<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
