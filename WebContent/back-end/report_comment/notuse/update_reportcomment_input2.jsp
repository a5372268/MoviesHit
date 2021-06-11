<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.report_comment.model.*"%>

<%
	ReportCommentVO reportCommentVO = (ReportCommentVO) request.getAttribute("reportCommentVO");
%>
<jsp:useBean id="commentSvc" scope="page" class="com.comment.model.CommentService" />
<html>
<head>
<title>��x �ק����|����</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movies Pro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="<%=request.getContextPath()%>/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="<%=request.getContextPath()%>/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/basictable.css" />
<!-- list-css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

<style>
tr td>img {
	width: 180px;
	height: 200px;
}

#th1{
	width: 150px;
	height:100px;
	align:center;
}
#th2{
	width: 50px;
	align:center;
}
#th3{
	width: 150px;
	align:right;
}
#send{
align:center;	
color:red;
}
</style>




</head>
<body>
	
<!--/content-inner-section-->
	<div class="w3_content_agilleinfo_inner">
		<div class="agile_featured_movies">
			<div class="inner-agile-w3l-part-head">
		    	<h3 class="w3l-inner-h-title">��x�@�ק����|����</h3>
			</div>
	        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						<div class="agile-news-table">
							
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_comment/reportcomment.do" name="form1">
							<table>
								<thead class="thead">
								  <tr>
								  	<th id="th1">���|�s��</th>
								  	<th id="th2">${reportCommentVO.reportno}</th>
<!-- 								  	<th id="th3">&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="�e�X�ק�" class="btn btn-outline-primary" id="send"></th> -->
								  	<th></th>
								  </tr>
								</thead>
								<tbody>
									<tr>
										<td>���|�|��:</td>
										<td>
										<img src="${pageContext.request.contextPath}/mem/mem.do?action=view_memPic&member_no=${reportCommentVO.memberno}" 
										width="130px" height="130px"></td>
										<td></td>
									</tr>
									<tr>
										<td>���|��]:</td>
										<td style= "max-width:170px; word-break: break-all;">${reportCommentVO.content}</td>
										<td></td>
									</tr>
									<tr>
										<td>���ק@��:</td>
										
										<c:forEach var="commentVO" items="${commentSvc.all}">
											<c:if test="${reportCommentVO.commentno == commentVO.commentno}">
												<td><img src="${pageContext.request.contextPath}/mem/mem.do?action=view_memPic&member_no=${commentVO.memberno}" 
												width="130px" height="130px"></td>
											</c:if>
										</c:forEach>
										<td></td>
									</tr>	
									<tr>
										<td>���׽s��:</td>
										<td>${reportCommentVO.commentno}</td>
										<td></td>
									</tr>
									<tr>
										<td>���פ��e:</td>
										<c:forEach var="commentVO" items="${commentSvc.all}">
											<c:if test="${reportCommentVO.commentno == commentVO.commentno}">
												<td>${commentVO.content}</td>
											</c:if>
										</c:forEach>
										<td></td>
									</tr>

									
									<tr>
										<td>���|�ɶ�:</td>
										<td><fmt:formatDate value="${reportCommentVO.creatdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td></td>
									</tr>
									<tr>
										<td>�B�z�ɶ�:</td>
										<td><fmt:formatDate value="${reportCommentVO.executedate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td></td>
									</tr>
									
									<tr>
										<td>�B�z���A:</td>
										<td><select name="status" size="1">
												<option value="9"
													<%=(reportCommentVO.getStatus().equals("9") ? "selected" : "")%>></option>
												<option value="0"
													<%=(reportCommentVO.getStatus().equals("0") ? "selected" : "")%>>���f��</option>
												<option value="1"
													<%=(reportCommentVO.getStatus().equals("1") ? "selected" : "")%>>�f�ֳq�L</option>
												<option value="2"
													<%=(reportCommentVO.getStatus().equals("2") ? "selected" : "")%>>�f�֥��q�L</option>
										</select></td>
										<td><font color=red>${errorMsgs.status}</font></td>
									</tr>
										
									<tr>
										<td>�Ƶ�:</td>
										<td><textarea name="desc" rows="5" cols="70" maxlength="300"><%=(reportCommentVO.getDesc() == null) ? "" : reportCommentVO.getDesc()%></textarea></td>
										<td></td>
									</tr>
									
									
									<tr>
										<td></td>
										<td></td>
										<td>
											&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
											<input type="submit" value="�e�X�ק�" id="send" 
											class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#FF4268; font-weight:bold; color:white;">
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="action" value="update"> 
							<input type="hidden" name="reportno" value="${reportCommentVO.reportno}">
							<input type="hidden" name="commentno" value="${reportCommentVO.commentno}">
							<input type="hidden" name="memberno" value="${reportCommentVO.memberno}">
							<input type="hidden" name="content" value="${reportCommentVO.content}">
							<input type="hidden" name="creatdate" value="${reportCommentVO.creatdate}">
							<input type="hidden" name="executedate" value="${reportCommentVO.executedate}">
							<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
							<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">
						</FORM>
						</div>
					</div>
					<div class="blog-pagenat-wthree">
				</div>	
			</div>
		</div>
	</div>
</div>
<!--//content-inner-section-->






<!-- <h1 class="shadow p-3 mb-1  rounded" align="center" style="background-color:#7d4627;" > -->
<!-- 	<span class="badge badge-secondary" style="background-color:#7d4627;"> -->
<!-- 		���|��ƭק� -->
<!-- 	</span> -->
<!-- </h1> -->

<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">�Эץ��H�U���~:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<%-- <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/report_comment/reportcomment.do" name="form1"> --%>
<!-- <table> -->

<!-- 	<tr> -->
<!-- 		<td><span class="badge badge-danger" style="font-size:20px; background-color:#729f98; margin:5px 5px 5px 5px">���פ��e</span></td> -->
<!-- 	</tr>	 -->
<!-- 	<tr> -->
<%-- 		<td><textarea name="content" rows="5" cols="73" maxlength="300">${commentVO.content}</textarea></td> --%>
<!-- 	</tr>	 -->
<!-- 	<tr> -->
<%-- 		<td><span class="badge badge-warning" style="font-size:15px; margin:5px 5px 5px 5px">�إ߮ɶ�</span> <fmt:formatDate value="${commentVO.creatdate}" pattern="yyyy-MM-dd  HH:mm:ss" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><span class="badge badge-warning" style="font-size:15px; margin:5px 5px 5px 5px">�ק�ɶ�</span> <fmt:formatDate value="${commentVO.modifydate}" pattern="yyyy-MM-dd  HH:mm:ss" /></td> --%>
	
<!-- 	</tr> -->
<!-- </table> -->
<!-- <br> -->
<!-- <input type="hidden" name="action" value="update"> -->
<%-- <input type="hidden" name="commentno" value="${commentVO.commentno}"> --%>
<%-- <input type="hidden" name="movieno" value="${commentVO.movieno}"> --%>
<%-- <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��--> --%>
<%-- <input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllComment.jsp--> --%>
<%-- <center><input type="submit" value="�e�X�ק�" class="btn btn-outline-danger"></center></FORM> --%>

</body>

<!-- <br>�e�X�ק諸�ӷ��������|:<br><b> -->
<%--    <font color=blue>request.getParameter("requestURL"):</font> <%=request.getParameter("requestURL")%><br> --%>
<%--    <font color=blue>request.getParameter("whichPage"): </font> <%=request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllComment.jsp))</b> --%>
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
</html>