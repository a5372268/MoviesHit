<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.relationship.model.*"%>
<%@ page import="com.mem.model.*"%>

<% 
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
	
<html>
<head>
<title>IBM relationship: Home</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/front/notification.css" />
<!-- <link href="https://i2.bahamut.com.tw/css/basic.css?v=1618977484" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script> -->

<style>
   body {  
/*      width: 565px;   */
     margin: 0 auto;  
     padding: 10px 20px 20px 20px;  

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
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	
  }
  table, th, td {
/*     border: 1px solid #CCCCFF; */
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white' onload="connect();" onunload="disconnection();">
<jsp:include page="/front_header.jsp"/>
<%-- ���~��C --%>
<div class="container"  style="min-height: 465px;" >

<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="row"  style="margin:5px 0;">
	<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${memVO.member_no}"
				alt="�|�L�Ϥ�" class="rounded-circle" width="60px" height="60px" title=""/>
<%--      		�i<font color=orange>${memVO.mb_name}</font>�j --%>
	<h1 class="shadow p-3 mb-1 bg-white rounded" style="background-color:#02a388 ;display:inline-block;color: white;">
			${memVO.mb_name} ���n�ͱM��
	</h1>

</div>
<div class="row">

		<div class="col col-md-8">
	 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1">   
       <b><font color=blue>�j�M�|���[�n��:</font></b> 
       		<input type="text" name="mb_name" value="" placeholder="�п�J�|���W��">		        
        <input type="submit" value="�e�X" class="btn btn-primary">
        <input type="hidden" name="action" value="listMems_ByCompositeQuery">
     	<br>
     </FORM>
    </div>
		<div class="col col-md-4 btn-group" style="font-size:40px">
		  <button type="button" class="btn btn-success" style="border-radius: 5px 0 0 5px;right:128px;">�n�ͺ޲z</button>
		  <button type="button" class="btn btn-success dropdown-toggle" style="border-radius: 0 5px 5px 0;right:128px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    <span class="caret"></span>&nbsp
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/mem/mem.do?action=listRelationships_ByMemberno_B&member_no=${memVO.member_no}">�ڪ��n��</a></li>
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/relationship/friend_invite.jsp">�n���ܽ�</a></li>
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/chat.do?action=ueser&userName=${memVO.mb_name}">�}�Ҳ�ѫ�</a></li>
		
		  </ul>
		</div>

		<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<jsp:useBean id="relationshipSvc" scope="page" class="com.relationship.model.RelationshipService" />
		
<!--     <li> -->

<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" > --%>
<!--        <b><font color=orange>��ܷ|���m�W�d�ӷ|�����n��(0403):</font></b> -->
<!--        <select size="1" name="member_no"> -->
<%--          <c:forEach var="memVO" items="${memSvc.all}" >  --%>
<%--           	<option value="${memVO.member_no}">${memVO.mb_name} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!-- 	       <input type="submit" value="�e�X"> -->
<!-- 	       <input type="hidden" name="action" value="listRelationships_ByMemberno_A"> -->
<!--      </FORM> -->
<!--   </li> -->

   </div>
<%if (request.getAttribute("listRelationships_ByMemno")!=null){%>
      <jsp:include page="/front-end/mem/listRelationships_ByMemno.jsp" />
<%} %>


 <div class="alert-container" >
  </div>
  
 </div>
<script>
	var MyPoint = "/NotifyWS/${memVO.member_no}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var friendNO;
	var groupNO;
	var movieNO;
	var groupName;
	var goGroupName;
	var kickGroupName;
	var memberNO;
	var self = '${memVO.member_no}';
	var webSocket;
	var type;

	

	function connect() {
		console.log(endPointURL);
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			

		};

		webSocket.onmessage = function(event) {
			console.log(event.data);
			var jsonObj = JSON.parse(event.data);
			var text = jsonObj.message;
			var time = jsonObj.time;
			var type = jsonObj.type;
			console.log(jsonObj)
			createAlert(text,time,type);
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	
// 	���ͳq��block�b�����k�U��
	  const alertContainer = document.querySelector('.alert-container');
	  const btnCreate = document.getElementById('create');
	  
	  
	  
	  const createAlert = (text,time,type) => {
		  
	  const newAlert = document.createElement('div');
	  const closeNewAlert = document.createElement('span');
	  const imgdiv = document.createElement('div');
	  const img = document.createElement('img');
	  const txt = document.createElement('div');
	  const time_str = document.createElement('div');
	  
	  if (type==="addFriend"||type==="response"){
		  img.src="<%=request.getContextPath()%>/images/notify_icons/friend.png"
	  }
	  if (type==="addGroup"||type==="createGroup"||type==="dismissGroup"||type==="goGroup"||type==="kickoffGroup"||type==="kickUnpaid"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/group.png"
	  }
	  if (type==="buyTicket"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/ticket.png"
	  }
	  if (type==="reminder"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/warning.png"
	  }
	  
		  img.classList.add("alertImg");
		  imgdiv.append(img);
		  txt.innerText = text;
		  txt.classList.add("alertTxt");
		  time_str.innerText = time;
		  txt.append(time_str);
		  newAlert.prepend(imgdiv);
		  newAlert.append(txt)
		  closeNewAlert.innerHTML = '&times;';
		  
		  newAlert.appendChild(closeNewAlert);
		  
		  newAlert.classList.add('alert');
		  
		  alertContainer.appendChild(newAlert);
		  
		  setTimeout(()=> {
		    newAlert.classList.add('fadeOut');
		  },3000)
		  
		  setTimeout(()=> {
		    newAlert.remove();
		  },5000)
		  
		
	};


	alertContainer.addEventListener('click', (e) => {
	    if(e.target.nodeName == 'SPAN') {
	        e.target.parentNode.remove();
	    }
	})
</script>
     <div class="w3agile_footer_copy">
        <p>2021 MoviesHit. All rights reserved</p>
    </div>
    <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>

</html>