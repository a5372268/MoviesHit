<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*"%>

<%
	ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO"); //ArticleArticleServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<%-- <%= articleVO==null %> --%>
<html>
<head>
<link href="https://i2.bahamut.com.tw/css/basic.css?v=1618977484" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�峹��ƭק� - update_article_input.jsp</title>

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

<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>���u��ƭק� - update_article_input.jsp</h3> -->
<!-- 		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4> -->
<!-- 	</td></tr> -->
<!-- </table> -->

<h1 class="shadow p-3 mb-2 bg-white rounded">
	<span class="badge badge-secondary">
		�ק�峹
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/article/article.do" name="form1">
<table>
	<tr>
		<td><h4>�峹�s��:</h4><font color=red><b>*</b></font></td>
		<td><h4><%=articleVO.getArticleno()%></h4></td>	
	</tr>
<!-- 	<tr> -->
<!-- 		<td>�|���s��:</td> -->
<%-- 		<input type="hidden" name="memberno" size="45" value="<%=articleVO.getMemberno()%>" /> --%>
<!-- 	</tr> -->
	
	<jsp:useBean id="topicSvc" scope="page" class="com.topic.model.TopicService" />
	
	<tr>
		<td><h4>�峹���D:</h4></td>
		<td><textarea type="hidden" name="articleheadline" cols="60"  rows="2"><%=articleVO.getArticleheadline()%></textarea></td>
	</tr>	
		
	<tr>
		<td><h4>�峹���e:</h4></td>
		<td><textarea type="hidden" name="content" cols="60"  rows="15"><%=articleVO.getContent()%></textarea></td>
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
<!-- 			<td><input name="crtdt" id="f_date1" type="text" ></td> -->
<%-- <%-- 		<td><input type="TEXT" name="crtdt" size="45"	value="<%=articleVO.getCrtdt()%>" /></td> --%>
<!-- 	</tr> -->
	
<!-- 	<tr> -->
<!-- 		<td>��s�峹�ɶ�:</td> -->
<!-- 			<td><input name="updatedt" id="f_date2" type="text" ></td> -->
<%-- <%-- 		<td><input type="TEXT" name="updatedt" size="45"	value="<%=articleVO.getUpdatedt()%>" /></td> --%>
<!-- 	</tr>	 -->
	
<!-- 	<tr> -->
<!-- 		<td>�峹���A:</td> -->
<%-- 		<td><input type="TEXT" name="status" size="45"	value="<%=articleVO.getStatus()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�I�g��:</td> -->
<%-- 		<td><input type="TEXT" name="likecount" size="45" value="<%=articleVO.getLikecount()%>" /></td> --%>
<!-- 	</tr>	 -->
	
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memberno" value="<%=articleVO.getMemberno()%>" />
<input type="hidden" name="articleno" value="<%=articleVO.getArticleno()%>">
<input type="hidden" name="requestURL"	value="${param.requestURL}"> 
<!-- ����listOneArticle2.jsp�Ǩ�ArticleServlet -->
 <center><input type="submit" value="�e�X�ק�" class="btn btn-danger"></center></FORM>
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
		    timepicker:true,       //timepicker:true,
		    step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		    format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
			value: '<%=articleVO.getCrtdt()%>', 
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
			value: '<%=articleVO.getUpdatedt()%>', 
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