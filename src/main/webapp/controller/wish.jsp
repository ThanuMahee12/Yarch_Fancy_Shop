<%@ page import="com.Model.Order.ProductAction" %>
<%@ page import="com.Model.Order.WishList" %><%

if(request!=null){
    ProductAction wishaction=new WishList();
    int id=Integer.parseInt(request.getParameter("id"));
    String result=wishaction.performAction(id,1,request,response);
    response.sendRedirect(result);
}
%>