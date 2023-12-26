<%--
  Created by IntelliJ IDEA.
  User: thanu
  Date: 7/27/2023
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg bg-dark fixed-top ">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="index.jsp">
            <img src="https://play-lh.googleusercontent.com/CREutRdiqPKVgUaFWMEpOwErmBrMK1dbnDuz32usgwo0gvXCNtQRVIE6zBhsWijSaoA" alt="Logo" width="30" height="24" class="d-inline-block align-text-top rounded-circle">
           AGPT
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="Vechile.jsp">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="AboutUs.jsp" >
                        AboutUS
                    </a>
                </li>
                <%
                    HttpSession session1=request.getSession();
                    String uid=(String) session1.getAttribute("uid");
                    String username1=(String) session1.getAttribute("user");
                    if(uid!=null && username1!=null){
                        String username=(String) session1.getAttribute("user");
                        %>
                <li class="nav-item">
                    <a class="nav-link text-white" href="Booking.jsp">Booking</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="Logout.jsp"><%=username%></a>
                </li>

                <%
                    }else{
                        %>
                <li class="nav-item">
                    <a class="nav-link text-white" href="login.jsp">Account</a>
                </li>
                <%
                    }
                %>

            </ul>
            <form class="d-flex" role="search" style="margin-left: auto">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>