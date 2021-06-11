<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.movie.model.*"%>

<%-- �U�νƦX�d��-�i�ѫȤ��select_page.jsp�H�N�W�����Q�d�ߪ���� --%>
<%-- �����u�@���ƦX�d�߮ɤ����G�m�ߡA�i���ݭn�A�W�[�����B�e�X�ק�B�R�����\��--%>

<jsp:useBean id="listMovies_ByCompositeQuery" scope="request"
	type="java.util.List<MovieVO>" />
<!-- ��EL����i�ٲ� -->
<%-- <jsp:useBean id="RatingSvc" scope="page" class="com.rating.model.RatingService" /> --%>


<html>
<head>
<title>�ƦX�d�� - listMovies_ByCompositeQuery.jsp</title>

<style>
tr td a>img {
	width: 150px;
	height: 150px;
}

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

	<h4>
		���U�νƦX�d�� - �i�ѫȤ�� select_movie_page.jsp �H�N�W�����Q�d�ߪ����<br>
		�������@���ƦX�d�߮ɤ����G�m�ߡA<font color=red>�w�W�[�����B�e�X�ק�B�R�����\��</font>
	</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ����u��� - listAllMovie.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front-end/movie/select_movie_page.jsp">
						<img
						src="<%=request.getContextPath()%>/images/movie_images/back1.gif"
						width="100" height="32" border="0">�^����
					</a>
				</h4>
			</td>
		</tr>
	</table>


	<table>
		<tr>
			<th>�q�v�s��</th>
			<th>�q�v�W��</th>
			<th>�q�v�Ӥ�</th>
			<th>�ɺt</th>
			<th>�t��</th>
			<th>�q�v����</th>
			<th>�q�v����</th>
			<th>�q�v���A</th>
			<th>�W�M���</th>
			<th>�U�ɤ��</th>
			<th>�w�i��</th>
			<th>�q�v����</th>
			<th>����</th>
			<th>���ݫ�</th>
			<th>�ק�</th>
			<th>�R��</th>
		</tr>
		<%@ include file="pages/page1_ByCompositeQuery.file"%>
		<c:forEach var="movieVO" items="${listMovies_ByCompositeQuery}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr align='center' valign='middle'
				${(movieVO.movieno==param.movieno) ? 'bgcolor=#CCCCFF':''}>
				<!--�N�ק諸���@���[�J����Ӥw-->
				<td><FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/comment/comment.do"
						style="margin-bottom: 0px;">
						<input type="submit" name="thisMovieComments"
							value="${movieVO.movieno}" style="border: none;"> <input
							type="hidden" name="action" value="getThisMovieComment">
				</FORM></td>
				<td>${movieVO.moviename}</td>
				<td><a href="${movieVO.trailor}">
				<img
						src="${pageContext.request.contextPath}/movie/DBGifReader1.do?movieno=${movieVO.movieno}">
				</a></td>
				<td>${movieVO.director}</td>
				<td>${movieVO.actor}</td>
				<td>${movieVO.category}</td>
				<c:choose>
					<c:when test="${((movieVO.length)/60)<1}">
						<td>${movieVO.length}����</td>
					</c:when>
					<c:when test="${((movieVO.length)/60)==1}">
						<td><fmt:formatNumber type="number"
								value="${((movieVO.length)-(movieVO.length%60))/60}" />�p��</td>
					</c:when>
					<c:when test="${((movieVO.length)/60)>1}">
						<td><fmt:formatNumber type="number"
								value="${((movieVO.length)-(movieVO.length%60))/60}" />�p��<fmt:formatNumber
								type="number" value="${movieVO.length%60}" />����</td>
					</c:when>
					<c:otherwise>
						<td>�L�Įɶ�</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${movieVO.status.equals('0')}">
						<td>�W�M��</td>
					</c:when>
					<c:when test="${movieVO.status.equals('1')}">
						<td>���W�M</td>
					</c:when>
					<c:when test="${movieVO.status.equals('2')}">
						<td>�w�U��</td>
					</c:when>
					<c:otherwise>
						<td>�L�Ī��A</td>
					</c:otherwise>
				</c:choose>
				<td><fmt:formatDate value="${movieVO.premiredate}"
						pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${movieVO.offdate}"
						pattern="yyyy-MM-dd" /></td>
				<td><a href="${movieVO.trailor}">${movieVO.moviename}</a></td>
				<c:choose>
					<c:when test="${movieVO.grade.equals('0')}">
						<td>���M��</td>
					</c:when>
					<c:when test="${movieVO.grade.equals('1')}">
						<td>�O�@��</td>
					</c:when>
					<c:when test="${movieVO.grade.equals('2')}">
						<td>���ɯ�</td>
					</c:when>
					<c:when test="${movieVO.grade.equals('3')}">
						<td>�����</td>
					</c:when>
					<c:otherwise>
						<td>�|������</td>
					</c:otherwise>
				</c:choose>
				<td>${movieVO.rating}</td>
				<td>${movieVO.expectation}</td>
			<td>
			  <FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/movie/movie.do"
						style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="movieno" value="${movieVO.movieno}">
			     <input type="hidden" name="requestURL"
							value="<%=request.getServletPath()%>">
						<!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage" value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
			</td>
			<td>
			  <FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/movie/movie.do"
						style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="movieno" value="${movieVO.movieno}">
			     <input type="hidden" name="requestURL"
							value="<%=request.getServletPath()%>">
						<!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage" value="<%=whichPage%>">  <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action" value="delete">
					</FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2_ByCompositeQuery.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

</body>
</html>