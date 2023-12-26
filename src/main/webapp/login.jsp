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
<section id="login">
    <div class="container mt-5">
        <div class="row d-flex w-100 justify-content-center align-item-center" >
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header">Login</div>
                    <div class="card-body">
                        <form id="loginForm" method="post" action="./controller/log.jsp" novalidate>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                                <div class="invalid-feedback">Please enter your username.</div>
                            </div>
                            <input type="hidden" name="islogin" value=true>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                                <div class="invalid-feedback">Please enter your password.</div>
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                            <a href="#" class="btn btn-link">Forgot Password?</a>
                            <a href="Register.jsp" class="btn btn-link">Register</a>
                            <div class="d-flex justify-content-start mx-3">
                                <div class="form-check">
                                    <input class="form-check-input btn-primary" type="radio" name="role" value="user" id="flexRadioDefault1" checked>
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        User
                                    </label>
                                </div>
                                <div class="form-check mx-3">
                                    <input class="form-check-input btn-primary" type="radio" value="admin" name="role" id="flexRadioDefault2" >
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Admin
                                    </label>
                                </div>
                            </div>
                        </form>

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

                    </div>
                </div>
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
