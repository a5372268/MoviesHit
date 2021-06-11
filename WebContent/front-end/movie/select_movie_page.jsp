<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movies Pro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->

<title>IBM Movie: Home</title>

<style>

li.test1{
background-color:pink;
padding-left:200px;
}
input.form-control{
margin-right:10px;
}
input#li1{
margin-left:120px;
}
select.form-control-sm{
margin-left:100px;
}

ul li{
	list-style-type:none;
}

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

</head>
<body bgcolor='white'>



<table id="table-1">
   <tr><td><h3>IBM Movie: Home</h3><h4>( MVC )</h4></td></tr>
</table>


  <a href="<%=request.getContextPath()%>/front-end/comment/select_comment_page.jsp" class="navbar-brand" href="#">
    <img src="<%=request.getContextPath()%>/images/comment_images/comment1.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    �e�����׭���
  </a>


<p>This is the Home page for IBM Movie: Home</p>

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


<!-- ���ծM�� -->
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
<ul class="nav justify-content-end">  
  <li class="searchbar">   
  

    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" name="form1" class="form-inline my-2 my-lg-0">
       <input type="text" name="MOVIE_NAME" value="" class="form-control" placeholder="�п�J�q�v" id=li1><br>
       
       <input type="text" name="DIRECTOR" value="" class="form-control" placeholder="�п�J�ɺt"><br>
       
       <input type="text" name="ACTOR" value="" class="form-control" placeholder="�п�J�t��"><br>
       
       <input type="text" name="PREMIERE_DT" id="f_date1" class="form-control" placeholder="�п�J�[�v���">~
       <input type="text" name="OFF_DT" id="f_date2" class="form-control" placeholder="�п�J�[�v���" ><br>
       
       <select  name="CATEGORY" class="form-control form-control-sm" >
			<option value="">�п�ܹq�v����</option>
			<option value="�ʧ@��">�ʧ@��</option>
			<option value="�_�I��">�_�I��</option>
			<option value="��ۤ�">��ۤ�</option>
			<option value="�Ǹo��">�Ǹo��</option>
			<option value="ĵ���">ĵ���</option>
			<option value="�߼@��">�߼@��</option>
			<option value="�@����">�@����</option>
			<option value="�R����">�R����</option>
       </select><br>
       
       <select size="1" name="STATUS" class="form-control form-control-sm">
			<option value="">�п�ܹq�v���A</option>
			<option value="0">�W�M��</option>
			<option value="1">���W�M</option>
			<option value="2">�w�U��</option>
       </select><br>
    
       <select size="1" name="GRADE" class="form-control form-control-sm">
			<option value="">�п�ܹq�v����</option>
			<option value="0">���M��</option>
			<option value="1">�O�@��</option>
			<option value="2">���ɯ�</option>
			<option value="3">�����</option>
       </select><br>
       
       <select size="1" name="RATING" class="form-control form-control-sm">
			<option value="">�����j��</option>
			<option value="2">2</option>
			<option value="4">4</option>
			<option value="6">6</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="9.5">9.5</option>
       </select><br>
       
       <select size="1" name="EXPECTATION" class="form-control form-control-sm" >
			<option value="">���ݫפj��</option>
			<option value="0.2">20%</option>
			<option value="0.4">40%</option>
			<option value="0.6">60%</option>
			<option value="0.8">80%</option>
			<option value="0.9">90%</option>
			<option value="0.95">95%</option>
       </select><br>
       
    
<!--        <b>��ܵ���:</b> -->
<!--        <select size="1" name="commentno" > -->
<!--           <option value=""> -->
<%--          <c:forEach var="commentVO" items="${commentSvc.all}" >  --%>
<%--           <option value="${commentVO.commentno}">${commentVO.moviename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <br> -->
<!--         <input type="submit" value="�e�X"> -->
<!--         <input type="hidden" name="action" value="listMovies_ByCompositeQuery"> -->
        
       
      <button class="btn btn-secondary btn-sm" type="submit" value="�e�X">Search</button>
      <input type="hidden" name="action" value="listMovies_ByCompositeQuery">

     </FORM>
  </li>
</ul>
</nav>





<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/movie/listAllMovie.jsp'>List</a> all Movies.  <br><br></li>
  
  
  <li class="test1">
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" >
        <b>��J�q�v�s�� (�p1):</b>
        <input type="text" name="movieno">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="movieSvc" scope="page" class="com.movie.model.MovieService" />
   
  <li class="list-group-item list-group-item-success">
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" >
       <b>��ܹq�v�s��:</b>
       <select size="1" name="movieno">
         <c:forEach var="movieVO" items="${movieSvc.all}" > 
          <option value="${movieVO.movieno}">${movieVO.movieno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li class="list-group-item list-group-item-success">
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" >
       <b>��ܹq�v�W��:</b>
       <select size="1" name="movieno">
         <c:forEach var="movieVO" items="${movieSvc.all}" > 
          <option value="${movieVO.movieno}">${movieVO.moviename}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>




<h3>�q�v�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/movie/addMovie.jsp'>Add</a> a new Movie.</li>
</ul>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
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
		   value: '',              //value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '',              //value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               '-1970-01-01', // �h������(���t)���e
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
</html>