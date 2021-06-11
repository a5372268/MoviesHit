<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ord_food.model.*"%>

<%
	Ord_foodVO ord_foodVO = (Ord_foodVO) request.getAttribute("ord_foodVO");
%>

<%= ord_foodVO==null %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>������ƭק� - update_Ord_food_input.jsp</title>

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
		 <h3>������ƭק� - update_ticket_type_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/ord_food/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ord_food/ord_food.do" name="form1">
<table>
	<tr>
		<td>�q��s��</td>
		<td>
			<input type="text" name="order_no" value="${ord_foodVO.order_no}">
		</td>
	</tr>
	<tr>
		<td>���ؽs��</td>
		<td>
			<input type="text" name="food_no" value="${ord_foodVO.food_no}">
		</td>
	</tr>
	<tr>
		<td>�ƶq</td>
		<td>
			<input type="text" name="food_count" value="${ord_foodVO.food_count}">
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td>
			<input type="text" name="price" value="${ord_foodVO.price}">
		</td>
	</tr>

</table>
<br>


<input type="hidden" name="action" value="update">
<%-- <input type="hidden" name="order_no" value="${ord_food.order_no}"> --%>
<%-- <input type="hidden" name="food_no" value="${ord_food.food_no}"> --%>
<input type="submit" id="submit" value="�e�X�ק�"></FORM>

</body>
</html>