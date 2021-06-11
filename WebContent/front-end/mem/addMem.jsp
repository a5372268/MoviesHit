<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<%= memVO==null%> 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|����Ʒs�W - addEmp.jsp</title>

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
		 <h3>�|����Ʒs�W - addMem.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/mem/select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="mb_name" size="45" 
			 value="<%= (memVO==null)? "" : memVO.getMb_name()%>" /></td>
	</tr>
	<tr>
		<td>�|���H�c:</td>
		<td><input type="TEXT" name="mb_email" id="mb_email" size="45"
			 value="<%= (memVO==null)? "" : memVO.getMb_email()%>" /></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="password" name="mb_pwd" size="45"
			 value="<%= (memVO==null)? "" : memVO.getMb_pwd()%>" /></td>
	</tr>
	<tr>
		<td>�|���ͤ�:</td>
		<td><input type="TEXT" name="mb_bd" id="f_date1"></td>
	</tr>
	<tr>
		<td>�|���q��:</td>
		<td><input type="TEXT" name="mb_phone" size="45"
			 value="<%= (memVO==null)? "" : memVO.getMb_phone()%>" /></td>
	</tr>
	<tr>
		<td>�~����:</td>
		<td><select id="city" name="city"></select><select id="area" name="area"></select></td>
	</tr>
	<tr>
		<td>�a�}:</td>
		<td><input type="TEXT" name="mb_address" size="45"
			 value="<%= (memVO==null)? "" : memVO.getMb_address()%>" /></td>
	</tr>
	<tr>
		<td>�|���Ӥ�:</td>
		<td><input type="FILE" name="mb_pic" id="mb_pic" accept="image/*"/></td>
	</tr>



</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" id="btn" value="�e�X�s�W"></FORM>
</body>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="<%=request.getContextPath()%>/js/city_area.js"></script>
<script type="text/javascript">

 window.onload = function () {
		 AddressSeleclList.Initialize('city', 'area');
		
   };
   
   
   $("#mb_email").blur(function (event) {
	   let input = $(this);
       let email = $(this).val();
       let data = new FormData();
       data.append("email", email);
       data.append("action", "email_confirm");
       let xhr = new XMLHttpRequest();
       xhr.open("post", "<%=request.getContextPath()%>/MemServlet");
       xhr.send(data);
       xhr.onload = function () {
           if (xhr.readyState === xhr.DONE) {
               if (xhr.status === 200) {
					console.log("Status 200")
                   if (xhr.responseText === "used") {
						console.log("got msg")
                       Swal.fire({
                           position: "top",
                           icon: "error",
                           title: "Email����",
                           showConfirmButton: false,
                           timer: 1500,
                       });
						input.val("");
                   }
               }
           }
       };
       
   });

</script>
<% 
  java.sql.Date mb_bd = null;
  try {
	  mb_bd = memVO.getMb_bd();
   } catch (Exception e) {
	   mb_bd = new java.sql.Date(System.currentTimeMillis());
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
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=mb_bd%>', // value:   new Date(),
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
</html>