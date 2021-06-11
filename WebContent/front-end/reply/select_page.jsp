<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Reply: Home</title>

<style>
  table#table-1 {
	width: 800px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Reply: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Reply: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/front-end/reply/listAllReply.jsp'>List</a> all Reply.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" >
        <b>��J�^�_�s�� (�p1~10):</b>
        <input type="text" name="reply_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="replySvc" scope="page" class="com.reply.model.ReplyService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" >
       <b>��ܦ^�_�s��:</b>
       <select size="1" name="reply_no">
         <c:forEach var="replyVO" items="${replySvc.all}" > 
          <option value="${replyVO.reply_no}">${replyVO.reply_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" >
       <b>��ܤ峹�s��:</b>
       <select size="1" name="reply_no">
         <c:forEach var="replyVO" items="${replySvc.all}" > 
          <option value="${replyVO.reply_no}">${replyVO.article_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
 		
 		<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />

    <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/article.do" >
       <b><font color=orange>��ܤ峹���D(0403):</font></b>
       <select size="1" name="articleno">
         <c:forEach var="articleVO" items="${articleSvc.all}" > 
          <option value="${articleVO.articleno}">${articleVO.articleheadline}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="listReplys_ByArticleno_A">
     </FORM>
  </li>
</ul>

<%-- �U�νƦX�d��-�H�U���-�i�H�N�W�� --%>
<ul>  
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" name="form1">
        <b><font color=blue>�U�νƦX�d��:</font></b> <br>
        <b>��J�^�_�s��:</b>
        <input type="text" name="reply_no" value=""><br>
        
        <b>��ܤ峹���D:</b>
        <select size="1" name="article_no" >
          <option value="">
         <c:forEach var="articleVO" items="${articleSvc.all}" > 
          <option value="${articleVO.articleno}">${articleVO.articleheadline}
         </c:forEach>   
        </select><br>
      
       <b>��J�|���s��:</b>
       <input type="text" name="member_no" value=""><br>
       
       <b>��J�^�_���e:</b>
       <input type="text" name="content" value=""><br>
          
       <b>�s�W�^�_���:</b>
	   <input name="crt_dt" id="f_date1" type="text"><br>
	   
	   <b>��s�^�_���:</b>
	   <input name="modify_dt" id="f_date2" type="text"><br>
	   
	   <b>��J�^�_���A:</b>
       <input type="text" name="status" value=""><br>
		        
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listReplys_ByCompositeQuery">
     </FORM>
  </li>
</ul>


<h3>�^�_�޲z:</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/reply/addReply.jsp'>Add</a> a new Reply.</li>
</ul>

<h3><font color=orange>�峹�޲z(0403):</font></h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp'>List</a> all Articles. </li>
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
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '',              // value:   new Date(),
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
        
</script>
</html>