<%--
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

<!-- About Us Section -->
<section id="about-us" class="py-5">
  <div class="container">
    <div class="row">
      <div class="col text-center">
        <h2 class="text-center">About Us</h2>
        <p class="lead">Learn more about our amazing team!</p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3">
        <img src="https://unitedthemes.com/wp-content/uploads/2018/09/team1.jpg" alt="Team Member 1" class="img-fluid rounded-circle mb-3">
        <h4 class="text-center">Thanu Mahee</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed lacinia felis.</p>
      </div>
      <div class="col-md-3">
        <img src="https://www.alhaya-medical.com/wp-content/uploads/2017/11/team-member.jpg" alt="Team Member 1" class="img-fluid rounded-circle mb-3">
        <h4 class="text-center">Pinthu</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed lacinia felis.</p>
      </div>
      <div class="col-md-3">
        <img src="https://powerpackelements.com/wp-content/uploads/2017/11/Team-memeber-01.png" alt="Team Member 2" class="img-fluid rounded-circle mb-3">
        <h4 class="text-center">Gowsi</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed lacinia felis.</p>
      </div>
      <div class="col-md-3">
        <img src="https://www.sexymedia.co.uk/wp-content/uploads/2019/08/team-member-02.jpg" alt="Team Member 3" class="img-fluid rounded-circle mb-3">
        <h4>Saayu</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed lacinia felis.</p>
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
