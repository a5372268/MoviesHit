<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.food.model.*"%>
<%@ page import="com.theater.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	FoodVO foodVO = (FoodVO) request.getAttribute("foodVO"); //TheaterServlet.java(Concroller), �s�Jreq��theaterVO����
%>

<html>
<head>
<title>�\�I��� - listOneFood.jsp</title>

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
h2{
			margin-left: 325px;
		}

		label {
			padding: 0;
			margin: 2px 2px 0px 0px;
			cursor: pointer;
/* 			background-color: lightgreen;  */
		}
		input[type=checkbox] {
			display: none;
			background-color: lightgreen;
		}
		span{
			font-size: 8px;
			font-family: Arial;
			text-align: center;
			/*  */
			line-height: 25px;
			/* background-color: lightgreen; */
		}

		input[type=checkbox]+span {
			display: inline-block;
			vertical-align:middle;
			background-color: lightgreen;
			/* 			padding: 3px ; */
			border: 1px solid; /* gray; */
			color: #444;
			user-select: none; /* �����r�Q�ƹ�����ϥ� */
			width: 25px;
			height: 25px;		
			margin: 2px 2px;
		}

		input[type=checkbox]:checked+span {
			/* 			color: yellow; */
			background-color: #ADD8E6;

		}

		input[type=checkbox]+span:first-child {
			visibility: hidden;
		}

		#d1{
			margin: 10px 0px;
			font-size: 27px;
		}
		input#submit{
			margin-left: 330px;
		}
		button{
			width: 25px;
			height: 25px;
		}
		#d1 > label:nth-child(2){
			visibility:  hidden;
			width: 20px;
			height: 20px;
		}
		#d2{
			border: 1px solid black;
			width: 700px;
			height: 30px;
			text-align: center;
			background: orange;
			font-size: 20px;
			line-height: 30px;
		}
		#d3, #d4{
			width:25px;
			height:25px;
			border: 1px solid black;
			display:inline-block;
		}
		#d3{
			margin-left:300px;
			background-color:lightgreen;
			
		}
		#d4{
			margin-left:20px;
			background-color: #ADD8E6;
		}
		#div1{
			display:inline-block;
			display: flex;
			align-items:center;
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

<jsp:useBean id="theaterSvc" scope="page" class="com.theater.model.TheaterService" />

<jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" />

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�\�I��� - ListOneFood.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/food/select_page.jsp"><img src="/CEA103G3/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�\�I�s��</th>
		<th>�\�I�W��</th>
		<th>�\�I����</th>
		<th>���I����</th>
		<th>�\�I�Ϥ�</th>
		<th>�\�I���A</th>
	</tr>
	<tr>
			<td>${foodVO.food_no}</td>
			<td>${foodVO.food_name}</td>
			<td>
				<c:choose>
					<c:when test="${foodVO.food_type == 0 }">
						������
					</c:when>
					<c:when test="${foodVO.food_type == 1 }">
						����
					</c:when>
					<c:when test="${foodVO.food_type == 3 }">
						�z�̪���
					</c:when>
				</c:choose>
			</td>
			<td>
				${foodVO.food_price}
			</td>
			<td>
				<img src="<%=request.getContextPath()%>/food/food.do?action=getPic&food_no=${foodVO.food_no}" >
			</td>
			<td>
				${foodVO.food_status == 0 ? "�U�[" : "�W�["}
			</td>
		</tr>
</table>
	
</body>
</html>