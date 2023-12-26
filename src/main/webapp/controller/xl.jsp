<%@ page import="com.Dao.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.Model.Report.ReportGenerator" %>
<%@ page import="com.Model.Report.PDFReportGenerator" %>
<%@ page import="com.Model.Report.ExcelReportGenerator" %>
<%@include file="../bean.jsp"%>
<%
  HttpSession session1=request.getSession();
  Dao daoi=(Dao) session1.getAttribute("dao");
  Connection connection=daoi.getConnection();
  ReportGenerator reportGenerator=new ExcelReportGenerator();
  String bid=request.getParameter("bid");
  reportGenerator.generateReport(bid,daoi);
  response.sendRedirect("../Booking.jsp");
%>