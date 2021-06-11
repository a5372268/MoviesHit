<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.comment.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.movie.model.*"%>

<%-- <jsp:useBean id="listComments_ByMovieno" scope="request" type="java.util.Set<CommentVO>" /> <!-- ��EL����i�ٲ� --> --%>
<jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" />
<jsp:useBean id="commentSvc" scope="page" class="com.comment.model.CommentService" />
<% 
	MovieVO movieVO = (MovieVO) request.getAttribute("movieVO");
%>


<html>
<head><title>�������u - listComments_ByMovieno.jsp</title>

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
	width: 800px;
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
		 <h3>�q�v���� - listComments_ByMovieno.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/movie/select_movie_page.jsp"><img src="<%=request.getContextPath()%>/images/movie_images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>���׽s��</th>
		<th>�|���s��</th>
		<th>�q�v</th>
		<th>���פ��e</th>
		<th>�إ߮ɶ�</th>
		<th>�ק�ɶ�</th>
		<th>���ת��A</th>
		<th>�ק�</th>
		<th>�R�� </th>
	</tr>
	
	
<%-- 	<c:forEach var="commentVO" items="${listComments_ByMovieno}" > --%>
	<c:forEach var="commentVO" items="${commentSvc.getOneMovieComment(movieVO.getMovieno())}" >
<%-- 		<tr ${(commentVO.commentno==param.commentno) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����--> --%>
			<td>${commentVO.commentno}</td>
			<td>${commentVO.memberno}</td>
			<td>
				<c:forEach var="movieVO" items="${movieSvc.all}">
                    <c:if test="${commentVO.movieno==movieVO.movieno}">
	                   <font color=orange>${movieVO.movieno}</font>�i${movieVO.moviename}�j
                    </c:if>
                </c:forEach>
            </td>
			<td>${commentVO.content}</td>
			<td><fmt:formatDate value="${commentVO.creatdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${commentVO.modifydate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<c:choose>
				<c:when test="${commentVO.status.equals('0')}">
					<td>���`�o�G</td>
				</c:when>
				<c:when test="${commentVO.status.equals('1')}">
					<td>�Ȧs����</td>
				</c:when>
				<c:when test="${commentVO.status.equals('2')}">
					<td>�w�U�[</td>
				</c:when>
				<c:otherwise>
					<td>�L�Ī��A</td>
				</c:otherwise>
			</c:choose>	
					
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/comment/comment.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="commentno"      value="${commentVO.commentno}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/comment/comment.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="commentno"      value="${commentVO.commentno}">
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