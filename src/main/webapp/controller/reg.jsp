<%@ page import="com.Dao.Dao" %>
<%@ page import="com.Model.Account.UserAccount" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="../bean.jsp"%>
<%
  String Role=request.getParameter("role");
  if(!Role.isEmpty()){
    HttpSession session1=request.getSession();
    Dao daoO=(Dao)session1.getAttribute("dao");
    UserAccount userAccount=new UserAccount(Role);
    String user=request.getParameter("username");
    String password=request.getParameter("password");
    String mobile=request.getParameter("mobile");
     Connection co=daoO.getConnection();
    String result=userAccount.Register(user,password,mobile,daoO);
    response.sendRedirect(result);
  }else{
    response.sendRedirect("../Register.jsp?mes='Must Seleted role'");
  }

%>

