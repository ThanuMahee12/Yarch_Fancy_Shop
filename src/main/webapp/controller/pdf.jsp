<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.Model.Report.ReportGenerator" %>
<%@ page import="com.Model.Report.PDFReportGenerator" %>
<%@include file="../bean.jsp"%>
<%
HttpSession session1=request.getSession();
    Dao daoi=(Dao) session1.getAttribute("dao");
    ReportGenerator reportGenerator=new PDFReportGenerator();
    String bid=request.getParameter("bid");
    reportGenerator.generateReport(bid,daoi);
    response.sendRedirect("../Booking.jsp");
%>