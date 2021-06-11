<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.reply.model.*"%>
<%@ page import="java.util.*"%>

<%
// 	Set<ReplyVO> listReplys_ByArticleno = (Set<ReplyVO>)request.getAttribute("listReplys_ByArticleno");
%>

<jsp:useBean id="listReplys_ByArticleno" scope="request" type="java.util.Set<ReplyVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />


<html>
<head><title>�峹�^�� - listReplys_ByArticleno.jsp</title>

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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-2">
	<tr><td>
		 <h3>�峹�^�� - listReplys_ByArticleno.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/article/select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/article/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>�^�_�s��</th>
		<th>�峹�s��</th>
		<th>�|���s��</th>
		<th>�^�_���e</th>
		<th>�s�W�^�_�ɶ�</th>
		<th>��s�^�_�ɶ�</th>
		<th>�^�_���A</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	
	<c:forEach var="replyVO" items="${listReplys_ByArticleno}" >		
		<tr ${(replyVO.reply_no==param.reply_no) ? 'bgcolor = blue':''}><!--�N�ק諸���@���[�J����Ӥw-->
			
			<td>${replyVO.reply_no}</td>			
			<td><c:forEach var="articleVO" items="${articleSvc.all}">
                    <c:if test="${replyVO.article_no==articleVO.articleno}">
	                    ${articleVO.articleno}�i<font color=orange>${articleVO.memberno}</font> - ${articleVO.content}�j
                    </c:if>
                </c:forEach>
			</td>	
			<td>${replyVO.member_no}</td>			
			<td>${replyVO.content}</td>
			<td><fmt:formatDate value="${replyVO.crt_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${replyVO.modify_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${replyVO.status}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="reply_no"   value="${replyVO.reply_no}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="reply_no"   value="${replyVO.reply_no}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"     value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

</body>
</html>