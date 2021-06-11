<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.showtime.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	SimpleDateFormat sft = new SimpleDateFormat("yyyy-MM-dd");
%>


<jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" />


<html>
<head>
<title>IBM Showtime: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Showtime: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Showtime: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/showtime/listAllShowtime.jsp'>List</a> all Showtimes.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/showtime/showtime.do" >
        <b>��J�����s�� (�p1):</b>
        <input type="text" name="showtime_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="showtimeSvc" scope="page" class="com.showtime.model.ShowtimeService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/showtime/showtime.do" >
       <b>��ܳ����s��:</b>
       <select size="1" name="showtime_no">
         <c:forEach var="showtimeVO" items="${showtimeSvc.all}" > 
          <option value="${showtimeVO.showtime_no}">${showtimeVO.showtime_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
</ul>

<ul>  
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" name="form1">
        <b><font color=blue>�U�νƦX�d��:</font></b> <br>
        <b>�п�ܹq�v:</b>
       <select size="1" id="movie" name="movie_no"  style="width:150px; font-size: 10px;" class="required">
       		   <option value="">�п�ܹq�v</option>
<%--          <c:forEach var="movieVO" items="${movieSvc.all}" >  --%>
<%--           <option value="${movieVO.movieno}">${movieVO.moviename} --%>
<%--          </c:forEach>    --%>
       </select><br>
           
       <b>�п�ܤ��:</b>
	       	<select size="1" id="date" name="movie_date" style="width:150px; font-size: 10px;" class="required">
	       		   <option value="">�п�ܤ��</option>
	<%--          <c:forEach var="movieVO" items="${movieSvc.all}" >  --%>
	<%--           <option value="${movieVO.movieno}">${movieVO.moviename} --%>
	<%--          </c:forEach>    --%>
	       </select><br>
	       
       <b>�п�ܳ���:</b>
	       	<select size="1" id="showtime" name="showtime_no" style="width:150px; font-size: 10px;" class="required">
	       		   <option value="">�п�ܳ���</option>
	<%--          <c:forEach var="movieVO" items="${movieSvc.all}" >  --%>
	<%--           <option value="${movieVO.movieno}">${movieVO.moviename} --%>
	<%--          </c:forEach>    --%>
	       </select><br>
       
       
<!-- 	   <input name="showtime_time" id="f_date1" type="text"> -->
<!-- <!-- 	   <input name="showtime_time" type="date"> --> 

	
		      
        <input type="submit" id="btn" value="�e�X">
        <input type="hidden" name="action" value="sendToFT">
     </FORM>
  </li>
</ul>


<h3>�����޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/showtime/addShowtime.jsp'>Add</a> a new Showtime.</li>
</ul>

</body>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '',              // value:   new Date(),
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
//         	$.ajax({
<%--         		url: "<%=request.getContextPath()%>/MovieServlet?action=testAjax", --%>
//         		type: "POST",
//         		success: function(data){
//         			let movieNames = data.split(",");
//         			for(i in movieNames){
//         				let opt = $("<option>").val(movieNames[i]).text(movieNames[i]);
//         				$("#movie").append(opt);
//         			}
//         		}
//         	});
        	
        	$.ajax({
        		url: "<%=request.getContextPath()%>/showtime/showtime.do?action=getMovieFromHibernate",
        		type: "POST",
        		success: function(json){
						let jsonobj = JSON.parse(json);
						for(let i = 0; i < jsonobj['movie_no'].length; i++){
							let opt = $("<option>").val(jsonobj['movie_no'][i]).text(jsonobj['movie_name'][i]);
	         				$("#movie").append(opt);
						}
        			}
        	});
        	
        	$("#movie").change(function(){
            	$.ajax({
            		url: "<%=request.getContextPath()%>/showtime/showtime.do?action=getDateFromHibernate&movie_no=" + $("#movie>option:selected:eq(0)").val(),
            		type: "POST",
            		success: function(json){
    						let jsonobj = JSON.parse(json);
//     						console.log(jsonobj);
    						$("#date").html("<option>�п�ܤ��</option>");
    						for(let i = 0; i < jsonobj['showtime_date'].length; i++){
    							let opt = $("<option>").val(jsonobj['showtime_date'][i]).text(jsonobj['showtime_date'][i]);
    	         				$("#date").append(opt);
    						}
            			}
            	});
        	});
            	
            	$("#date").change(function(){
                	$.ajax({
                		url: "<%=request.getContextPath()%>/showtime/showtime.do?action=getTimeFromHibernate",
                		type: "POST",
                		data: {	movie_no: $("#movie>option:selected:eq(0)").val(), 
                			   	showtime_date: $("#date>option:selected:eq(0)").val(),
                		},
                		success: function(json){
        						let jsonobj = JSON.parse(json);
//         						console.log(jsonobj);
        						$("#showtime").html("<option>�п�ܳ���</option>");
        						for(let i = 0; i < jsonobj['showtime_no'].length; i++){
        							let opt = $("<option>").val(jsonobj['showtime_no'][i]).text(jsonobj['showtime_time'][i]);
        	         				$("#showtime").append(opt);
        						}
                			}
                	});
        	});
            	
            	$("#btn").click(function(){
                	$.ajax({
<%--                 		url: "<%=request.getContextPath()%>/order/order.do", --%>
                		url: "/CEA103G3/order/order.do",
                		type: "POST",
                		data: {	action:	"sendToFT",
                				showtime_no: $("#showtime>option:selected:eq(0)").val(), 
                		},
                		success: function(date){
                			console.log("�ɤJ�q������");
                		}
//                 			function(json){
//         						let jsonobj = JSON.parse(json);
// //         						console.log(jsonobj);
//         						$("#showtime").html("<option>�п�ܳ���</option>");
//         						for(let i = 0; i < jsonobj['showtime_no'].length; i++){
//         							let opt = $("<option>").val(jsonobj['showtime_no'][i]).text(jsonobj['showtime_time'][i]);
//         	         				$("#showtime").append(opt);
//         						}
//                 			}
                	});
        	});
        	
        	
        	

        
</script>
</html>