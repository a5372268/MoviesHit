<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.topic.model.*"%>

<%
	TopicVO topicVO = (TopicVO) request.getAttribute("topicVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
	<%= topicVO==null %>--${topicVO.topicno}
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�峹��Ʒs�W - addArticle.jsp</title>

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
		 <h3>���u��Ʒs�W - addTopic.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/topic/select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/like/images/tomcat.png" width="100" height="32" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/topic/topic.do" name="form1">
<table>

	<tr>
		<td>�Q�ץD�D:</td>
		
		<td><input type="TEXT" name="topic" size="45" 
			 value="<%= (topicVO==null)? "�а�" : topicVO.getTopic()%>" /></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.article.model.ArticleService" /> --%>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>