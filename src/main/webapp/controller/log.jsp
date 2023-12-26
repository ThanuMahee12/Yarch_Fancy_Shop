<%@ page import="com.Model.Account.UserAccount" %>
<%@include file="../bean.jsp"%>
<%
    if(request!=null) {
            UserAccount userAccount=new UserAccount();
            userAccount.login(request,response);
    }else{
        throw new Exception("it is wrong");
    }
%>

