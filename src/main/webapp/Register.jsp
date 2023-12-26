 Created by IntelliJ IDEA.
  User: thanu
  Date: 7/27/2023
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="bean.jsp"%>

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

<section class="vh-100 d-flex align-items-center justify-content-center">
<div class="container h-100">
    <div class="row align-items-center h-100">
        <div class="col-md-6 mx-auto">
            <h3 class="text-center">Sign Up</h3>
            <%
                if(request!=null){
                String mes=request.getParameter("mes");
                String mess=request.getParameter("mess");
                if(mes!=null && !mes.isEmpty()){
            %>
            <div class="alert alert-danger text-center" role="alert">
                <%= mes%>
            </div>
            <%
                }
                if(mess!=null && !mess.isEmpty()){ %>
            <div class="alert alert-success" role="alert">
                <%= mess%>
            </div>
            <%
                    } }
            %>

            <form id="registrationForm" action="./controller/reg.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" required>
                </div>
                <div class="form-group">
                    <label for="selectOption">Role:</label>
                    <select class="form-control" id="selectOption" name="role">
                        <option value="">Role.</option>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
            <p>Already have an account? <a href="login.jsp">Go to login page</a></p>
        </div>
    </div>
</div>
</section>
<%@include file="Footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
