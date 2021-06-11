<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ord_ticket_type.model.*"%>

<%
  Ord_ticket_typeVO ord_ticket_typeVO = (Ord_ticket_typeVO) request.getAttribute("ord_ticket_typeVO");
%>
<%= ord_ticket_typeVO==null %>

<%-- <jsp:useBean id="theaterSvc" scope="page" class="com.theater.model.TheaterService" /> --%>
<%-- <jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" /> --%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�U�|��Ʒs�W - addTheater.jsp</title>

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
		 <h3>���ظ�Ʒs�W - addTicket_type.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/ord_ticket_type/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ord_ticket_type/ord_ticket_type.do" name="form1">
<table>
	<tr>
		<td>�q��s��</td>
		<td>
			<input type="text" name="order_no" value="${(ord_ticket_typeVO==null) ? '1' : ord_ticket_typeVO.order_no}">
		</td>
	</tr>
	<tr>
		<td>���ؽs��</td>
		<td>
			<input type="text" name="ticket_type_no" value="${(ord_ticket_typeVO==null) ? '1' : ord_ticket_typeVO.ticket_no}">
		</td>
	</tr>
	<tr>
		<td>�ƶq</td>
		<td>
			<input type="text" name="ticket_count" value="${(ord_ticket_typeVO==null) ? '1' : ord_ticket_typeVO.ticket_count}">
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td>
			<input type="text" name="price" value="${(ord_ticket_typeVO==null) ? '100' : ord_ticket_typeVO.price}">
		</td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">
</FORM>

</body>
</html>