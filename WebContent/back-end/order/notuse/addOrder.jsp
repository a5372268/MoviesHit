<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>

<%
  OrderVO orderVO = (OrderVO) request.getAttribute("orderVO");
%>
<%= orderVO==null %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�q���Ʒs�W - addTheater.jsp</title>

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
		 <h3>�q���Ʒs�W - addOrder.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/order/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" name="form1">
<table>
<!-- 	<tr> -->
<!-- 		<td>�q��s��</td> -->
<!-- 		<td> -->
<%-- 			<td>${orderVO.order_no}</td> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr>
		<td>�|���s��</td>
		
		<td>
			<input type="text" name="member_no" value="${orderVO==null ? '' : orderVO.member_no}">
<!-- 			<select name="theater_no"> -->
<%-- 				<c:forEach var="theaterVO" items="${theaterSvc.all}" > --%>
<%-- 					<option value= "${theaterVO.theater_no}">${theaterVO.theater_name}</option> --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
		</td>
	</tr>
	
	<tr>
		<td>�����s��</td>
		<td>
			<input type="text" name="showtime_no" value="${orderVO==null ? '' : orderVO.showtime_no}">
		</td>
	</tr>
	
	<tr>
		<td>�Ыخɶ�</td>
		<td>
			<input name="crt_dt" id="f_date1" type="text" value="${orderVO==null ? '' : orderVO.crt_dt}">
		</td>
	</tr>
	
	<tr>
		<td>�q�檬�A</td>
		
		<td>
			<select name="order_status">
					<option value= "0" ${orderVO.order_status == 0 ? "selected" : ""}>���I��</option>
					<option value= "1" ${orderVO.order_status == 1 ? "selected" : ""}>�w�I��</option>
					<option value= "2" ${orderVO.order_status == 2 ? "selected" : ""}>�w����</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>�|���s��</td>
		
		<td>
			<select name="order_type">
					<option value= "0" ${orderVO.order_type == 0 ? "selected" : ""}>�{���ʲ�</option>
					<option value= "1" ${orderVO.order_type == 1 ? "selected" : ""}>�u�W�ʲ�</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>�|���s��</td>
		
		<td>
			<select name="payment_type">
					<option value= "0" ${orderVO.payment_type == 0 ? "selected" : ""}>�H�Υd</option>
					<option value= "1" ${orderVO.payment_type == 1 ? "selected" : ""}>�{��</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>�q���`��</td>
		<td>
			<input type="number"  min="0" name="total_price" value="${orderVO==null ? '' : orderVO.total_price}">
		</td>
	</tr>
	
	<tr>
		<td>�y��</td>
		<td>
			<input type="text" name="seat_name" value="${orderVO==null ? '' : orderVO.seat_name}">
		</td>
	</tr>
	
	
	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">
</FORM>


</body>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Timestamp crt_dt = null;
  try {
	  crt_dt = orderVO.getCrt_dt();
   } catch (Exception e) {
	   crt_dt = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:00',         //format:'Y-m-d H:i:s',
		   value: '<%=crt_dt%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
		//         		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>

</html>