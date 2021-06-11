<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.report_article.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	Report_ArticleVO report_articleVO = (Report_ArticleVO) request.getAttribute("report_articleVO"); //ArticleServlet.java(Concroller), �s�Jreq��ArticleVO����
%>

<html>
<head>
<title>���u��� - listOneReport_ArticleVO.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneReport_Article.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/report_article/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/report_article/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���|�s��</th>
		<th>�峹�s��</th>
		<th>���|���e</th>
		<th>�s�W���|�ɶ�</th>
		<th>�|���s��</th>
		<th>��s���|�ɶ�</th>
		<th>���|���A</th>
		<th>�Ƶ�</th>
	</tr>
	<tr>
		<td><%=report_articleVO.getReportno()%></td>
		<td><%=report_articleVO.getArticleno()%></td>
		<td><%=report_articleVO.getContent()%></td>	
		<td><fmt:formatDate value="${report_articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
		<td><%=report_articleVO.getMemberno()%></td>
		<td><fmt:formatDate value="${report_articleVO.executedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
		<td><%=report_articleVO.getStatus()%></td>
		<td><%=report_articleVO.getDesc()%></td>

	</tr>
</table>

</body>
</html>