<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.movie.model.*"%>
<%@ page import="com.comment.model.*"%>
<%
	MovieService movieSvc = new MovieService();
	List<MovieVO> list = movieSvc.getTopTen();
	pageContext.setAttribute("listTopTen", list);
%>
<!DOCTYPE html>
<html>
<head>
<title>List Top Movies</title>
<!-- <!-- for-mobile-apps -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<!-- <meta name="keywords" content="Movies Pro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,  -->
<!-- Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" /> -->
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); -->
<!-- 		function hideURLbar(){ window.scrollTo(0,1); } </script> -->
<!-- <!-- //for-mobile-apps --> -->
<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" /> -->
<!-- <!-- pop-up --> -->
<!-- <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" /> -->
<!-- <!-- //pop-up --> -->
<!-- <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/> -->
<!-- <link rel="stylesheet" type="text/css" href="css/zoomslider.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="css/style.css" /> -->
<!-- <link href="css/font-awesome.css" rel="stylesheet">  -->
<!-- <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script> -->
<!-- <!--/web-fonts--> -->
<!-- <link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'> -->
<!-- <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet"> -->
<!-- <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
<!-- <!--//web-fonts--> -->

<style>
div>div>div>div>a>img{
width:10px;
height:10px;
}

tr td a>img {
	width: 150px;
	height: 150px;
}

tr td h4 a>img {
	width: 100px;
	height: 32px;
}

table#table-1 {
	background-color: orange;
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
	height: 200px;
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	/* 	word-wrap: break-word; */
	/*    	table-layout: fixed; */
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
		<tr>
			<td>
				<h3>�Ҧ��q�v��� - listAllMovie.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/index.jsp"><img
						src="<%=request.getContextPath()%>/images/movie_images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

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
			<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
			<th>�d�߹q�v����</th>
		</tr>
		<%@ include file="pages/page1.file"%>
		<c:forEach var="movieVO" items="${listTopTen}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr ${(movieVO.movieno==param.movieno) ? 'bgcolor=#CCCCFF':''}>
<!-- 				<td><FORM METHOD="post" -->
<%-- 						ACTION="<%=request.getContextPath()%>/comment/comment.do" --%>
<!-- 						style="margin-bottom: 0px;"> -->
<!-- 						<input type="submit" name="thisMovieComments" -->
<%-- 							value="${movieVO.movieno}" style="border: none;"> <input --%>
<!-- 							type="hidden" name="action" value="getThisMovieComment"> -->
<!-- 					</FORM></td> -->
				<td>${movieVO.movieno}</td>
				<td>${movieVO.moviename}</td>
				<!-- �ΦѮv�d�ҵ��U�h��ܹϤ�,�åB�ϥε��U��/movie/DBGifReader1.do? �s�����u�|���A��Whttp://localhost:8081,�n�[�W${pageContext.request.contextPath}�N��CEA103G3�~�O���T���|-->
				<td><a href="${movieVO.trailor}"> <img
						src="${pageContext.request.contextPath}/movie/DBGifReader1.do?movieno=${movieVO.movieno}"></a></td>
				<!-- ��MovieServlet��action=getPic�g�k (�Ѯv��ĳ���n�� �t�~�g�@��Ū�Ϥ���servlet����n)-->
				<%-- 							<td><img src="${pageContext.request.contextPath}/movie/movie.do?action=getPicForDisplay&movieno=${movieVO.movieno}"></td>				 --%>
				<td>${movieVO.director}</td>
				<td>${movieVO.actor}</td>
				<td>${movieVO.category}</td>
				<c:choose>
					<c:when test="${((movieVO.length)/60)<1}">
						<td>${movieVO.length}����</td>
					</c:when>
					<c:when test="${(((movieVO.length)/60)%1)==0}">
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
						<input type="submit" value="�ק�"> <input type="hidden"
							name="movieno" value="${movieVO.movieno}"> <input
							type="hidden" name="requestURL"
							value="<%=request.getServletPath()%>">
						<!--�e�X�����������|��Controller-->
						<input type="hidden" name="whichPage" value="<%=whichPage%>">
						<!--�e�X��e�O�ĴX����Controller-->
						<input type="hidden" name="action" value="getOne_For_Update">


						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
					
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/movie/movie.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="movieno" value="${movieVO.movieno}"> <input
							type="hidden" name="requestURL"
							value="<%=request.getServletPath()%>">
						<!--�e�X�����������|��Controller-->
						<input type="hidden" name="whichPage" value="<%=whichPage%>">
						<!--�e�X��e�O�ĴX����Controller-->
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/movie/movie.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�e�X�d��"> <input type="hidden"
							name="movieno" value="${movieVO.movieno}"> <input
							type="hidden" name="requestURL"
							value="<%=request.getServletPath()%>">
						<!--�e�X�����������|��Controller-->
						<input type="hidden" name="whichPage" value="<%=whichPage%>">
						<!--�e�X��e�O�ĴX����Controller-->
						<input type="hidden" name="action"
							value="listComments_ByMovieno_B">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="pages/page2.file"%>
	<%
		if (request.getAttribute("listComments_ByMovieno") != null) {
	%>
<%-- 	<jsp:include page="listComments_ByMovieno.jsp" /> --%>
	<%
		}
	%>


</body>
</html>