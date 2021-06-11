<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.food.model.*"%>

<%
  FoodVO foodVO = (FoodVO) request.getAttribute("foodVO");
%>
<%= foodVO==null %>


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
		 <h3> ������Ʒs�W - addFood.jsp </h3></td><td>
		 <h4> <a href="<%=request.getContextPath()%>/back-end/food/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/food/food.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�\�I�W��</td>
		<td>
			<input name="food_name" type="text" value="${foodVO.food_name}">
		</td>
	</tr>
	<tr>
		<td>�\�I���� </td>
		
		<td>
			<select name="food_type">
					<option value= "0" ${(foodVO.food_type == "0") ? "selected" : "" }>������</option>
					<option value= "1" ${(foodVO.food_type == "1" ) ? "selected" : "" }>������</option>
					<option value= "2" ${(foodVO.food_type == "2" ) ? "selected" : "" }>�z�̪���</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>�\�I����</td>
		<td>
			<input name="food_price"  type="number" max="2000" min="0" value="${foodVO.food_price}">
		</td>
	</tr>
	<tr>
		<td>�\�I�Ϥ�</td>
		<td>
			<input name="food_pic" type="file">
		</td>
	</tr>
	<tr>
		<td>�\�I���A</td>
		<td>
			<select name="food_status">
				<option value="0" ${foodVO.food_status == 0 ? "selected" : ""}>�U�[</option>
				<option value="1" ${foodVO.food_status == 1 ? "selected" : ""}>�W�[</option>
			</select>
		</td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">
</FORM>


</body>
</html>