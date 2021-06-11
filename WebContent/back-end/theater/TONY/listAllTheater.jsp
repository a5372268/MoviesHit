<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.theater.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    TheaterService theaterSvc = new TheaterService();
    List<TheaterVO> list = theaterSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��U�|��� - listAllTheater.jsp</title>

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
	width: 700px;
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
		 <h3>�Ҧ��U�|��� - listAllTheater.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/theater/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>�U�|�s��</th>
		<th>�U�|�W��</th>
		<th>�U�|����</th>
		<th>�U�|�t�m</th>
<!-- 		<th>�y��W��</th> -->
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="theaterVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${theaterVO.theater_no}</td>
			<td>${theaterVO.theater_name}</td>
			<td>
				<c:choose>
					<c:when test="${theaterVO.theater_type == 0 }">
					2D
					</c:when>
					<c:when test="${theaterVO.theater_type == 1 }">
					3D
					</c:when>
					<c:when test="${theaterVO.theater_type == 2 }">
					IMAX
					</c:when>
					<c:when test="${theaterVO.theater_type == 3 }">
					2D_IMAX
					</c:when>
					<c:when test="${theaterVO.theater_type == 4 }">
					3D_IMAX
					</c:when>
<%-- 					<c:when test="${theaterVO.theater_type == 5 }"> --%>
<%-- 					</c:when> --%>
				</c:choose>
			</td>
<!-- 			<td>�d��</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�d��">
			     <input type="hidden" name="theater_no"  value="${theaterVO.theater_no}">
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			     <input type="hidden" name="action"	value="getOne_For_Theater"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="theater_no"  value="${theaterVO.theater_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="theater_no"  value="${theaterVO.theater_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<%if (request.getAttribute("theaterVO")!=null){%>
<jsp:include page="listOneTheater.jsp" />
<%} %>
</body>
</html>