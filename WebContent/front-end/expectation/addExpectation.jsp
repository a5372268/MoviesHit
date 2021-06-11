<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.expectation.model.*"%>

<%
	ExpectationVO expectationVO = (ExpectationVO) request.getAttribute("expectationVO");
%>

<html>
<head>
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>������Ʒs�W - addExpectation.jsp</title>

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
		 <h3>���ݫ׸�Ʒs�W - addExpectation.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/front-end/expectation/select_expectation_page.jsp"><img src="<%=request.getContextPath()%>/images/comment_images/comment1.jpg" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/expectation/expectation.do" name="form1">
<table>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="memberno" size="45"
			 value="<%= (expectationVO==null)? "1" : expectationVO.getMemberno()%>" /></td>
	</tr>
	<jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" />
<!-- 	<tr> -->
<!-- 		<td>�q�v�s��:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="movieno"> -->
<%-- 			<c:forEach var="movieVO" items="${movieSvc.all}"> --%>
<%-- 				<option value="${movieVO.movieno}" ${(expectationVO.movieno==movieVO.movieno)? 'selected':'' } >${movieVO.moviename} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->
														<tr>
															<td><input type="hidden" name="movieno" size="45" value="1" /></td>
														</tr>
<!-- 	<tr> -->
<!-- 		<td>����:</td> -->
<%-- 		<td><textarea name="rating" rows="5" cols="45" maxlength="300" ><%= (ratingVO==null)? "" : ratingVO.getRating()%></textarea></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>���ݫ�:</td>
		<td><input type="hidden" name="expectation" value="" id="con1" size="50"/>
			<ion-icon name="thumbs-up-outline" class="thumbsup" id="t1"></ion-icon>
			<ion-icon name="thumbs-down-outline" class="thumbsdown" id="t2"></ion-icon>
		</td>
	</tr>

	
	</table>
<br>
<input type="hidden" name="action" value="insertOrUpdate">
<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">	
<input type="submit" value="�e�X�s�W"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->


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
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '', // value:   new Date(),
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
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
<script>
	$(document).ready(function(){
		$("#t1").click(function(){
			$(".thumbsup").css("color","gray");
			$("#t1").css("color","blue");
			$("#t2").css("color","gray");
			$("#con1").val("1.0");
		})
		$("#t2").click(function(){
			$(".thumbsdown").css("color","gray");
			$("#t2").css("color","blue");
			$("#t1").css("color","gray");
			$("#con1").val("0.0");
		})
	})
</script>
</html>