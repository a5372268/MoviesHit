<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%-- 	<%= articleVO==null %>--${articleVO.articleno} --%>
<html>
<head>
<link href="https://i2.bahamut.com.tw/css/basic.css?v=1618977484" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�峹��Ʒs�W - addArticle.jsp</title>

<style>
  body {   
      width: 640px;   
      margin: 0 auto;   
      padding: 20px 20px 20px 20px;   
     
  	        }   
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
/*     color: blue; */
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 15px;
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
<!-- <body bgcolor='white'> -->

<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>�峹��Ʒs�W - addArticle.jsp</h3> -->
<%-- 		 <h4><a href="<%=request.getContextPath()%>/article/listAllArticle.jsp"><img src="images/tomcat.png" width="100" height="32" border="0">�^�W�@��</a></h4> --%>
<!-- 	</td></tr> -->
<!-- </table> -->

<h1 class="shadow p-3 mb-2 bg-white rounded">
	<span class="badge badge-secondary">
		�s�W�峹
	</span>
</h1>	
<!-- <h3>��Ʒs�W:</h3> -->

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/article/article.do" name="form1">
<table>

<!-- 	<tr> -->
<!-- 		<td>�|���s��:</td> -->
<!-- 		<td>1 -->
<!-- 		<input type="TEXT" name="memberno" size="45"  -->
<%-- 		value="<%= (articleVO==null)? "1" : articleVO.getMemberno()%>" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
	<jsp:useBean id="topicSvc" scope="page" class="com.topic.model.TopicService" />


<!-- 	<tr> -->
<!-- 		<td>�峹���e:</td> -->
<!-- 			<td><input type="TEXT" name="content" size="45" -->
<%-- 			 value="<%= (articleVO==null)? "�٧A�n��" : articleVO.getContent()%>" /></td> --%>
<!-- 	</tr> -->
	<tr>
		<td><h4>�峹���D:</h4></td>
		
		<td><input type="TEXT" name="articleheadline" size="57"
			 value="<%= (articleVO==null)? "" : articleVO.getArticleheadline()%>" /></td>
	</tr>
	<tr>
		<td><h4>�峹���e:</h4></td>
			<td><textarea cols="60" name="content" rows="15"><%= (articleVO==null)? "" : articleVO.getContent()%></textarea></td>
	</tr>	
	<tr>
		<td><h4>�峹����:</h4><font color=red><b>*</b></font></td>
		<td><select size="1" name="articletype">
			<c:forEach var="topicVO" items="${topicSvc.all}">
				<option value="${topicVO.topicno}" ${(articleVO.articletype==topicVO.topicno)? 'selected':'' } >${topicVO.topic}
			</c:forEach>
		</select></td>
	</tr>
				
<!-- 	<tr> -->
<!-- 		<td>�s�W�峹�ɶ�:</td> -->
<!-- 		<td><input name="crtdt" id="f_date1" type="text" ></td> -->
<!-- 	</tr> -->
	
<!-- 	<tr> -->
<!-- 		<td>��s�峹�ɶ�:</td> -->
<!-- 		<td><input name="updatedt" id="f_date2" type="text" ></td> -->
<!-- 	</tr>	 -->
	
<!-- 	<tr> -->
<!-- 		<td>�峹���A:</td> -->
<!-- 		<td><input type="TEXT" name="status" size="45" -->
<%-- 			 value="<%= (articleVO==null)? "0" : articleVO.getStatus()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�I�g��:</td> -->
<!-- 				<td><input type="TEXT" name="likecount" size="45" -->
<%-- 			 value="<%= (articleVO==null)? "0" : articleVO.getLikecount()%>" /></td> --%>
<!-- 	</tr> -->

<%-- <%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.article.model.ArticleService" /> --%> 

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="memberno" value="${memVO.member_no}">
<input type="submit" value="�e�X�s�W" class="btn btn-success"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
<% 
// 	java.sql.Timestamp crtdt = null;
//   try {
// 	 	 crtdt = articleVO.getCrtdt();
//    } catch (Exception e) {
// 	   	 crtdt = new java.sql.Timestamp(System.currentTimeMillis());
//    }
%>
<% 
// 		java.sql.Timestamp updatedt = null;
//   try {
// 	  	updatedt = articleVO.getUpdatedt();
//    } catch (Exception e) {
// 	   	updatedt = new java.sql.Timestamp(System.currentTimeMillis());
//    }
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
// 		$.datetimepicker.setLocale('zh');
//         $('#f_date1').datetimepicker({
// 	       theme: '',              //theme: 'dark',
// 	       timepicker:true,       //timepicker:true,
// 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
// 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
<%-- 		   value: '<%=crtdt%>',  --%>
// 		   //value:   new Date(),
//            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
//            //startDate:	            '2017/07/10',  // �_�l��
//            //minDate:               '-1970-01-01', // �h������(���t)���e
//            //maxDate:               '+1970-01-01'  // �h������(���t)����
//         });
//         $.datetimepicker.setLocale('zh');
//         $('#f_date2').datetimepicker({
//  	       theme: '',              //theme: 'dark',
//  	       timepicker:true,       //timepicker:true,
//  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
//  	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
<%--  		   value: '<%=updatedt%>',  --%>
//  		   // value:   new Date(),
//             //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
//             //startDate:	            '2017/07/10',  // �_�l��
//             //minDate:               '-1970-01-01', // �h������(���t)���e
//             //maxDate:               '+1970-01-01'  // �h������(���t)����
//          });
        
        
   
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