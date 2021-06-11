<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.reply.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	ReplyVO replyVO = (ReplyVO) request.getAttribute("replyVO"); //ReplyServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%-- <%= replyVO==null %> --%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�^�и�ƭק� - update_reply_input.jsp</title>

<style>
  body {   
      width: 600px;   
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
<!-- <body bgcolor='white'> -->

<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>�^�и�ƭק� - update_reply_input.jsp</h3> -->
<%-- 		 <h4><a href="<%=request.getContextPath()%>/front-end/reply/select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/reply/images/back1.gif" width="100" height="32" border="0">�^����</a></h4> --%>
<!-- 	</td></tr> -->
<!-- </table> -->

<h1 class="shadow p-3 mb-1 bg-white rounded">
	<span class="badge badge-secondary">
		�ק�峹�^�Ф��e
	</span>
</h1>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" name="form1">
<table>
<!-- 	<tr> -->
<!-- 		<td>�^�_�s��:<font color=red><b>*</b></font></td> -->
<%-- 		<td><%=replyVO.getReply_no()%></td>	 --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�峹�s��:</td> -->
<%-- 		<td><input type="TEXT" name="articleno" size="45" value="<%=replyVO.getArticleno()%>" /></td> --%>
<!-- 	</tr> -->

		<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />
		
<!-- 	<tr> -->
<!-- 		<td>�峹���e:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="article_no"> -->
<%-- 			<c:forEach var="articleVO" items="${articleSvc.all}"> --%>
<%-- 				<option value="${articleVO.articleno}" ${(replyVO.article_no==articleVO.articleno)?'selected':'' } >${articleVO.content} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->
		<tr>
			<td><h4>�峹���e:<font color=red>*</font></h4></td>
			<td><textarea cols="58" name="content" rows="10" disabled>${articleSvc.getOneArticle(replyVO.article_no).content}</textarea></td>
		</tr>															
<!-- 	<tr> -->														
<%-- 		<c:forEach var="articleVO" items="${articleSvc.ll}"> --%>
<!-- 			<td><h4>�峹���e:</h4></td> -->
<%-- 			<td><textarea type="hidden" name="content" cols="60"  rows="15"><%=articleVO.getContent()%></textarea></td> --%>
<%-- 		</c:forEach> --%>
<!-- 	</tr> -->
	
<!-- 	<tr> -->
<!-- 		<td>�|���s��:<font color=red><b>*</b></font></td> -->
<%-- 		<td><%=replyVO.getMember_no()%></td> --%>
<!-- 	</tr> -->
	
	<tr>
		<td><h4>�^�Ф��e:</h4></td>
		<td><input type="TEXT" name="content" size="55"	value="<%=replyVO.getContent()%>" /></td>
														
<!-- 	<tr> -->
<!-- 		<td>�s�W�峹�ɶ�:</td> -->
<!-- 			<td><input name="crt_dt" id="f_date1" type="text" ></td> -->
<!-- 	</tr> -->
	
<!-- 	<tr> -->
<!-- 		<td>��s�峹�ɶ�:</td> -->
<!-- 			<td><input name="modify_dt" id="f_date2" type="text" ></td> -->
<!-- 	</tr>	 -->
	
<!-- 	<tr> -->
<!-- 		<td>�峹���A:</td> -->
<%-- 		<td><input type="TEXT" name="status" size="45"	value="<%=replyVO.getStatus()%>" /></td> --%>
<!-- 	</tr> -->


<%--  	<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />  --%>
	
	
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="reply_no" value="<%=replyVO.getReply_no()%>">
<input type="hidden" name="articleno" value="<%=replyVO.getArticle_no()%>">
<input type="hidden" name="member_no" value="${memVO.member_no}">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
<center><input type="submit" value="�e�X�ק�" class="btn btn-outline-danger"></center></FORM>

<!-- <br>�e�X�ק諸�ӷ��������|:<br><b> -->
<%--    <font color=blue>request.getParameter("requestURL"):</font> <%=request.getParameter("requestURL")%><br> --%>
<%--    <font color=blue>request.getParameter("whichPage"): </font> <%=request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b> --%>
<!-- </body> -->



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
		    timepicker:true,       //timepicker:true,
		    step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		    format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
			value: '<%=replyVO.getCrt_dt()%>', 
			//value:   new Date(),
		   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		   //startDate:	            '2017/07/10',  // �_�l��
		   //minDate:               '-1970-01-01', // �h������(���t)���e
		   //maxDate:               '+1970-01-01'  // �h������(���t)����
		});
				
		$.datetimepicker.setLocale('zh');
		$('#f_date2').datetimepicker({
		   theme: '',              //theme: 'dark',
		    timepicker:true,       //timepicker:true,
		    step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		    format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
			value: '<%=replyVO.getModify_dt()%>', 
			//value:   new Date(),
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