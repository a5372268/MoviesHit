<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.ord_ticket_type.model.*"%>
<%@ page import="com.ord_food.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO");
%>

<% 
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:00");; 
	pageContext.setAttribute("df",df);
%>

<jsp:useBean id="ord_ticket_typeSvc" scope="page" class="com.ord_ticket_type.model.Ord_ticket_typeService"></jsp:useBean>
<jsp:useBean id="ord_foodSvc" scope="page" class="com.ord_food.model.Ord_foodService"></jsp:useBean>
<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService"></jsp:useBean>
<jsp:useBean id="ticket_typeSvc" scope="page" class="com.ticket_type.model.Ticket_typeService"></jsp:useBean>

<%
	List<Ord_ticket_typeVO> list = ord_ticket_typeSvc.getAll();
	for(int i = 0; i < list.size(); i++){
		if(orderVO.getOrder_no().intValue() != list.get(i).getOrder_no().intValue()){
			list.remove(i);
			i--;
		}
	}
	
	List<Ord_foodVO> list1 = ord_foodSvc.getAll();
	for(int i = 0; i < list1.size(); i++){
		if(orderVO.getOrder_no().intValue() != list1.get(i).getOrder_no().intValue()){
			list1.remove(i);
			i--;
		}
	}
	
	request.setAttribute("list", list);
	request.setAttribute("list1", list1);

%>

<html>
<head>
<title>������� - listOneOrder.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>������� - ListOneOrder.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/order/select_page.jsp"><img src="/CEA103G3/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th>�����s��</th>
		<th>���߮ɶ�</th>
		<th>�q�檬�A</th>
		<th>�q�����</th>
		<th>�I�ڤ覡</th>
		<th>�q���`��</th>
		<th>�y��</th>
	</tr>
		<tr>
			<td>${orderVO.order_no}</td>
			<td>${orderVO.member_no}</td>
			<td>${orderVO.showtime_no}</td>
			<td>${df.format(orderVO.crt_dt)}</td>
			<td>
				<c:choose>
					<c:when test="${orderVO.order_status == 0 }">
						���I��
					</c:when>
					<c:when test="${orderVO.order_status == 1 }">
						�w�I��
					</c:when>
					<c:when test="${theaterVO.theater_type == 2 }">
						�w����
					</c:when>
				</c:choose>
			</td>
			<td>${orderVO.order_type == 0 ? "�{��" : "�u�W"}</td>
			<td>
				<c:choose>
					<c:when test="${orderVO.payment_type == 0 }">
						�H�Υd
					</c:when>
					<c:when test="${orderVO.payment_type == 1 }">
						�{��
					</c:when>
					<c:when test="${orderVO.payment_type == 2 }">
						�{���I��
					</c:when>
				</c:choose>
			</td>
			<td>${orderVO.total_price }</td>
			<td>${orderVO.seat_name }</td>
		</tr>
</table>

<p>�q����T:
<table>
	<tr>
		<th>�q��s��</th>
		<th>���ؽs��</th>
		<th>���ؼƶq</th>
		<th>���ػ���</th>
	</tr>
		<c:forEach var="ord_ticket_typeVO" items="${list}">
			<c:forEach var="ticket_typeVO" items="${ticket_typeSvc.all}">
				  <c:if test="${ord_ticket_typeVO.ticket_type_no == ticket_typeVO.ticket_type_no}">
					<tr>
						<td>${ord_ticket_typeVO.order_no}</td>
<%-- 						<td>${ord_ticket_typeVO.ticket_type_no}</td> --%>
						<td>${ticket_typeVO.ticket_desc}</td>
						<td>${ord_ticket_typeVO.ticket_count}</td>
						<td>${ord_ticket_typeVO.price}</td>
					</tr>
				 </c:if>
			</c:forEach>
		</c:forEach>
</table>

<p>�\�I��T:
<table>
	<tr>
		<th>�q��s��</th>
		<th>�\�I�s��</th>
		<th>�\�I�ƶq</th>
		<th>�\�I����</th>
	</tr>
	<c:forEach var="ord_foodVO" items="${list1}">
		<c:forEach var="foodVO" items="${foodSvc.all}">
			<c:if test="${ord_foodVO.food_no == foodVO.food_no}">
				<tr>
					<td>${ord_foodVO.order_no}</td>
					<td>${foodVO.food_name}</td>
					<td>${ord_foodVO.food_count}</td>
					<td>${ord_foodVO.price}</td>
				</tr>
			</c:if>
		</c:forEach>
	</c:forEach>
</table>






</body>
</html>