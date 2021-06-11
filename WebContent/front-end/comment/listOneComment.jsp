<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.comment.model.*"%>
<%@ page import="com.movie.model.*"%>

<%-- ���X Concroller CommentServlet.java�w�s�Jrequest��CommentVO����--%>
<%CommentVO commentVO = (CommentVO) request.getAttribute("commentVO");%>

<%-- ���X ������MovieVO����--%>
<%
  MovieService movieSvc = new MovieService();
  MovieVO movieVO = movieSvc.getOneMovie(commentVO.getMovieno());
  request.setAttribute("movieVO", movieVO);
%>

<html>
<head>
<title>���׸�� - listOneComment.jsp</title>

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
	width: 600px;
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
		<tr>
			<td>
				<h3>���׸�� - ListOneComment.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front-end/comment/select_comment_page.jsp"><img
						src="<%=request.getContextPath()%>/images/comment_images/back1.gif"
						width="100" height="32" border="0">�^����</a>
						<a
						href="<%=request.getContextPath()%>/front-end/movie/select_movie_page.jsp"><img
						src="<%=request.getContextPath()%>/images/movie_images/movie.jpg"
						width="80" height="80" border="0">�^�q�v����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>���׽s��</th>
			<th>�|���s��</th>
			<th>�q�v</th>
			<th>���פ��e</th>
			<th>�إ߮ɶ�</th>
			<th>�ק�ɶ�</th>
			<th>���ת��A</th>
		</tr>
			<tr>
				<td>${commentVO.commentno}</td>
				<td>${commentVO.memberno}</td>
				<td>${commentVO.movieno}�i${movieVO.moviename}�j</td>
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
			</tr>
	</table>

</body>
</html>