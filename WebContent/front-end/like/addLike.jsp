<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.like.model.*"%>

<%
		LikeVO likeVO = (LikeVO) request.getAttribute("likeVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<%-- 	<%= likeVO==null %>--${LikeVO.articleno} --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�峹��Ʒs�W - addReport_Article.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>���u��Ʒs�W - addReport_Article.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/like/select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/like/images/tomcat.png" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/like/like.do" name="form1">

<table>
	<tr>
		<td>�峹�s��:</td>
		<td><input type="TEXT" name="articleno" size="45" 
			 value="<%= (likeVO==null)? "1" : likeVO.getArticleno()%>" /></td>
	</tr>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="memberno" size="45" 
			 value="<%= (likeVO==null)? "1" : likeVO.getMemberno()%>" /></td>
	</tr>


<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.article.model.ArticleService" /> --%>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>