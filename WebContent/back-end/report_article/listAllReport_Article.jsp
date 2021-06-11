<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.report_article.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	Report_ArticleService report_articleSvc = new Report_ArticleService();
    List<Report_ArticleVO> list = report_articleSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ����u��� - listAllReport_Article.jsp</title>

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
	width: 1300px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����u��� - listAllReport_Article.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/report_article/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="report_articleVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${report_articleVO.reportno}</td>
			<td>${report_articleVO.articleno}</td>
			<td>${report_articleVO.content}</td>	
			<td><fmt:formatDate value="${report_articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
			<td>${report_articleVO.memberno}</td>
			<td><fmt:formatDate value="${report_articleVO.executedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
			<td>${report_articleVO.status}</td>
			<td>${report_articleVO.desc}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_article/report_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="reportno"  value="${report_articleVO.reportno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_article/report_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="reportno"  value="${report_articleVO.reportno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>