<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.articleCollection.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    ArticleCollectionService artcolSvc = new ArticleCollectionService();
    List<ArticleCollectionVO> list = artcolSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��|����� - listAllMem.jsp</title>

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

  table {
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

  tr td img{
  	width:150px;
  	height:150px;
  }
  img {  
	max-width:600px;
	myimg:expression(onload=function(){
	this.style.width=(this.offsetWidth > 600)?"600px":"auto"});
  }
</style>

</head>
<body bgcolor='white'>
<%@ include file="page1.file" %> 

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����u��� - listAllRating.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/mem/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>Member_NO</th>
	</tr>
	
	<c:forEach var="artcolVO" items="${list}">
		
		<tr>
			<td>${artcolVO.member_no}</td>
			<td>
				<a href='<%=request.getContextPath()%>/back-end/artcol/addArtCol.jsp'>Add</a>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ArticleCollectionServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="list_Artcol">
			     <input type="hidden" name="member_no"  value="${artcolVO.member_no}">
			     <input type="hidden" name="action"	value="list_artcol_by_memno"></FORM>
			</td>
		
		</tr>

	</c:forEach>
	
	
</table>

<%@ include file="page2.file" %> 
</body>
</html>