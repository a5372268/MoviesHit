<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%-- <%@ page import="com.article.model.*"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	//ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO"); //ArticleServlet.java(Concroller), �s�Jreq��ArticleVO����
%>

<html>
<head>
<title>���u��� - listOneArticle.jsp</title>

<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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
	width: 100%;
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
<table id="table-2">
	<tr><td>
		 <h3>���u��� - ListOneArticle.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/article/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�峹�s��</th>
		<th>�|���m�W</th>
		<th>�峹����</th>
		<th>�峹���e</th>
		<th>�峹���D</th>
		<th>�s�W�峹�ɶ�</th>
		<th>��s�峹�ɶ�</th>
		<th>�峹���A</th>
		<th>�I�g��</th>
	</tr>
	<tr>
<%-- 		<td><%=articleVO.getArticleno()%></td>	 --%>
<%-- 		<td><%=articleVO.getMemberno()%></td> --%>
<%-- 		<td><%=articleVO.getArticletype()%></td> --%>
<%-- 		<td><%=articleVO.getContent()%></td> --%>
<%-- 		<td><%=articleVO.getArticleheadline()%></td> --%>
		<td>${articleVO.articleno}</td>	
		<td>${articleVO.memberno}</td>
		<td>${articleVO.articletype}</td>
		<td>${articleVO.content}</td>
		<td>${articleVO.articleheadline}</td>
<%-- 		<td><%=articleVO.getCrtdt()%></td> --%>
		<td><fmt:formatDate value="${articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<%-- 		<td><%=articleVO.getUpdatedt()%></td> --%>
		<td><fmt:formatDate value="${articleVO.updatedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>${articleVO.status}</td>	
		<td>${articleVO.likecount}</td>	
		
<%-- 		<td><%=articleVO.getStatus()%></td> --%>
<%-- 		<td><%=articleVO.getLikecount()%></td> --%>
		
	</tr>
</table>

</body>
</html>