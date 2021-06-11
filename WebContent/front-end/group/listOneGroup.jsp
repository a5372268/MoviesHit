<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.group.model.*"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mappingtool.*"%>
<%@ page import="com.mappingtool.StatusMapping"%>


<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	GroupVO groupVO = (GroupVO) request.getAttribute("groupVO");
%>
<%-- <jsp:useBean id="memVO" scope="session" type="com.mem.model.MemVO" /> --%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="groupSvc" scope="page"	class="com.group.model.GroupService" />
<jsp:useBean id="movieSvc" scope="page"	class="com.movie.model.MovieService" />
<jsp:useBean id="showtimeSvc" scope="page"	class="com.showtime.model.ShowtimeService" />
<jsp:useBean id="mapping" scope="page" class="com.mappingtool.StatusMapping" />

<html>
<head>
<title>����</title>
 <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

        function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- //for-mobile-apps -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    
    <!-- pop-up -->
    <link href="<%=request.getContextPath()%>/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //pop-up -->
    <link href="<%=request.getContextPath()%>/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/zoomslider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
    <link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr-2.6.2.min.js"></script>
    <!--/web-fonts-->
    <link href='https://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!--//web-fonts-->
	<!--     �۩w�qcss�榡�}�l -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styleForGroup.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!--     �۩w�qcss�榡���� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

body {
	background-image: linear-gradient(#ddd6f3,#faaca8);
}

table#table-2 {
	background-color: #5bc0de;
	border: 2px solid black;
	text-align: center;
	margin: 0px auto;
}

table#table-2 h4 {
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
	background-color: white;
	width: 100%
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>




<style>
  /* �q���� */
  @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

.fadeOut {
  opacity: 0 !important;
}

#create {
  border: none !important;
  padding: 8px !important;
  font-size:15px !important;
  color: #FFF !important;
  background-color: firebrick !important;
  border-radius: 8px !important;
}

.alert-container{
  position: fixed !important;
  right: 10px !important;
  bottom: 10px !important;
}

.alert {
  position: relative !important;
  background-color: white !important;
  border: 5px solid lightblue !important;
  height: 130px !important;
  width: 290px !important;
  border-radius: 15px !important;
  margin-bottom: 15px !important;
  color: #40bde6 !important;
  padding: 20px 15px 0 15px !important;
  transition: opacity 2s !important;
}

.alert span {
  font-size: 1.3rem !important;
  position: absolute !important;
  top: 3px !important;
  right: 12px !important;
  cursor: pointer !important;

}
.alertTxt{
  font-size: 17px !important;
  position: absolute !important;
  top: 0px !important;
  right: 12px !important;
  cursor: pointer !important;
  margin-top:23px !important;
  width:170px !important;

}
.alertImg{
  width:80px !important;
  margin-left:-5px !important;

}

.alertTxt .alertTime{
	font-size:10px !important;
	color:gray;
}
</style>


</head>
<body onload="connect();" onunload="disconnection();">
	<div id="display" class="container-fluid">
<!-- 			<div class="row"> -->
<!-- 			<table id="table-2"> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<h1> -->
<!-- 							<strong><em>���θ��</em></strong> -->
<%-- 						</h1> 		 <h4><a href="<%=request.getContextPath()%>/front-end/group/select_page.jsp"  --%>
<!-- 											class="btn btn-primary btn-lg active" role="button">�^�W��</a></h4> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
		
		<div class="row">
			<div class="jumbotron">
			  <h1 style="margin-left: -20px; display:flex; align-items: center; "class="display-4">
			  ${groupVO.group_title} &nbsp
			  	<button disabled id="stat" style="font-size: 20px; height:60px; width:auto; border-radius: 10px;" class="btnlead">
			  	${mapping.dboGroup_GroupStatus(groupVO.group_status)}: ${groupVO.member_cnt} / ${groupVO.required_cnt}</button>
			  </h1>
			  <br>
			  <h2 class="lead">${groupVO.desc}</h2>
			  
			  <hr class="my-4">
			  <div class="row">
				  <div class="col-md-2 lead div-th">
				   �q�v�W��:
				  </div>
			      <div class="col-md lead">${movieSvc.getOneMovie(showtimeSvc.getOneShowtime(groupVO.showtime_no).movie_no).moviename}
			      </div>
			  </div>
			  <div class="row">
				  <div class="col-md-2 lead div-th">
				   �����ɶ�:
				  </div>
			      <div class="col-md lead">
			  		<fmt:formatDate value="${showtimeSvc.getOneShowtime(groupVO.showtime_no).showtime_time}" pattern="yyyy-MM-dd HH:mm" />
			      </div>
			  </div>
			  <c:choose>
			  	
			  	<c:when test="${groupVO.group_status == 0}">
			  		<div class="row">
					  	<div class="col-md-2 lead div-th">
					  	�ثe����:
			  			</div>
					  	<div class="col-md-10 lead group-mem-pic" id="member"> 
						  	<c:forEach var="group_memberVO" items="${groupSvc.getMembersByGroupno(groupVO.getGroup_no())}">
								<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${group_memberVO.member_no}"  id="${groupVO.group_no}-${group_memberVO.member_no}"
								alt="�|�L�Ϥ�" width="90px;" height="90px" style="border-radius:50%;"
								class="clickable" />
<!-- 								onmouseenter="displayImg()" onmouseout="vanishImg()" onmousemove="displayImg()" -->
							</c:forEach>
					  	</div>
				  	 </div>
		  		</c:when>
		  		<c:otherwise>
		  			<div class="row">
			  			<div class="col-md-2 lead div-th">
					  	�w�I�ڦ���:
			  			</div>
			  			<div class="col-md-10 lead group-mem-pic" id="member"> 
						  	<c:forEach var="group_memberVO" items="${groupSvc.getMembersByGroupno(groupVO.getGroup_no())}">
						  		<c:if test="${group_memberVO.pay_status==1 }">
									<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${group_memberVO.member_no}"  id="${groupVO.group_no}-${group_memberVO.member_no}"
									alt="�|�L�Ϥ�" width="90px;" height="90px"
<%-- 									 title=" ${memSvc.getOneMem(group_memberVO.member_no).mb_name}"  --%>
									style="border-radius:50%;" class="clickable"
									/>
								</c:if>
							</c:forEach>
				  		</div>
		  			</div>
		  			<div class="row">
			  			<div class="col-md-2 lead div-th">
					  	���I�ڦ���:
			  			</div>
			  			<div class="col-md-10 lead group-mem-pic" id="member"> 
						  	<c:forEach var="group_memberVO" items="${groupSvc.getMembersByGroupno(groupVO.getGroup_no())}">
						  		<c:if test="${group_memberVO.pay_status==0 }">
									<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${group_memberVO.member_no}"  id="${groupVO.group_no}-${group_memberVO.member_no}"
									alt="�|�L�Ϥ�" width="90px;" height="90px" style="border-radius:50%; " class="clickable" />
								</c:if>
							</c:forEach>
				  		</div>
		  			</div>
		  		</c:otherwise>
			</c:choose>
			<div class="row">
			    <div class="col-md-2 lead div-th">
			    �I��ɶ�:
			    </div>
			    <div class="col-md-10 lead" id="dd-cntDown">
			    </div>
		  	</div>
			<hr class="my-4">
			
		   <div class="row">
		    <div class="col-md lead">
				<a id="backBtn" href="<%=request.getContextPath()%>/front-end/group/group_front_page.jsp" 
				style="margin-bottom: 0px;" class="btn btn-lg">�^����</a>
				<c:choose>
					<c:when test="${memVO == null}">
						<button style="border-radius: 10px;" onclick="loginFirst()"  class="btn btn-lg btn-primary">
							�{�b�[�J
						</button> 
					</c:when>
					<c:otherwise>
						<button id="joinBtn" class="btn btn-lg btn-primary" ${(groupVO.member_cnt < groupVO.required_cnt) ?  '' : 'disabled'}>
						${(groupVO.member_cnt < groupVO.required_cnt) ?  '�{�b�[�J' : '�H�Ƥw��'}
						</button> 
					</c:otherwise>
				</c:choose>
				<button id="leaveBtn" class="btn btn-lg btn-danger" style="display:none">�h�X����</button> 
				<a id="modifyBtn" href="<%=request.getContextPath()%>/group/group.do?group_no=${groupVO.group_no}&action=getOne_For_Update" 
				style="margin-bottom: 0px;" class="btn btn-lg btn-success">�קﴪ��</a>
				<a id="reportBtn" href="<%=request.getContextPath()%>/front-end/report_group/addReport_Group.jsp?group_no=${groupVO.group_no}" 
				style="margin-bottom: 0px;" class="btn btn-lg btn-warning">���|����</a>
				<a id="dismissBtn" href="<%=request.getContextPath()%>/group/group.do?group_no=${groupVO.group_no}&action=delete" 
				style="margin-bottom: 0px;" class="btn btn-lg btn-danger activeDismissGroup">�Ѵ�����<input type="hidden" class="activeDismissGroupNO"  value="${groupVO.group_no}"></a>
<%-- 					<a id="TimerdismissBtn" href="<%=request.getContextPath()%>/group/group.do?group_no=${groupVO.group_no}&action=SetDeleteTimerTask"  --%>
<!-- 					style="margin-bottom: 0px;" class="btn btn-lg btn-danger">���ձƵ{�R��</a> -->
				<a id="gogoBtn" style="margin-bottom: 0px;" class="btn btn-lg btn-primary goGroup">�X��(�Ϊ�) <input type="hidden" class="goGroupName"  value="${groupVO.group_no}"></a>
			    </div>
			  </div>
			</div>
		</div>
			 <p class="hint"><!-- Hint text will be displayed here --></p>
	</div>
	
	<!--�ʺA��ܪ�div-->
	<div id="pop-out-div">
		
		<c:choose>
			<c:when test="${memVO==null }">
				<button onclick="loginFirst()" id="add-friend" type="button" class="btn btn-primary"><i class="fa fa-plus-circle " aria-hidden="true"></i>�[�n��</button>
			</c:when>
			<c:otherwise>
				<button id="add-friend" type="button" class="btn btn-primary"><i class="fa fa-plus-circle " aria-hidden="true"></i>�[�n��</button>
			</c:otherwise>
		</c:choose>
		
		<button id="already-friends" type="button" class="btn btn-info"  style="display:none;" disabled>�w�O�B��</button>
		<button id="retrieve-invitation" type="button" class="btn btn-info"  style="display:none;">���^�ܽ�</button>
		<button id="myself" type="button" class="btn btn-info" style="display:none;" disabled>���H</button>
		<button id="kick-out" type="button" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i>��</button>
		
		
<!-- 		<span class="label label-warning"><a  id="add-friend" href="#">�[�L�n��</a></span> -->
<!-- 		<span class="label label-danger"><a id="kick-out"  href="#" onclick="kickMember(target_member_no)">�𱼥L</a></span> -->
	</div>
	<!--�ʺA��ܪ�div-->

<!-- �q�����div -->
 <div class="alert-container">
 </div>
	<script>
	
	//�_�l�ʧ@
	//1. �L�X���κI��ɶ�(�C���s)
	//2. �o�Xajax �ШD�T�{�|���O�_�w�b���Τ�, �̦����[�J/�h�X���s���
	let memberCnt = ${groupVO.member_cnt};
	let group_status = ${groupVO.group_status};
	
	let timer = null;
	$(function() {
		console.log("���νs��: " + ${groupVO.group_no});
		//�̾ڴ��Ϊ��A��ܤ��P�C��button
		let stat = ${groupVO.group_status};
		if (stat == 0)
			$("#stat").toggleClass("btn-success", true);
		else if(stat == 1)
			$("#stat").toggleClass("btn-info", true);
		else if(stat == 2)
			$("#stat").toggleClass("btn-primary", true);
		else
			$("#stat").toggleClass("btn-danger", true);
		//�T�{�|���O�_���Ϊ�, �M�w��ܱ���
		if(${memVO.member_no == groupVO.member_no}){
			console.log("�Ϊ�!");
			$("#joinBtn").hide();
			$("#leaveBtn").hide();
			$("#reportBtn").show();
			if ( group_status === 0){
				$("#gogoBtn")	.show();
				$("#dismissBtn").show();
				$("#modifyBtn").show();
			} else{
				$("#gogoBtn").hide();
				$("#modifyBtn").hide();
				$("#dismissBtn").hide();
			}
		}
		else{
			console.log("���O�Ϊ�");
			$("#modifyBtn").hide();
			$("#reportBtn").show();
			$("#dismissBtn").hide();
			$("#gogoBtn").hide();
		}
		$("#dd-cntDown").html(
    			'<fmt:formatDate value="${groupVO.deadline_dt}" pattern="yyyy-MM-dd HH:mm" />'
    			+ ' <font color="red"> (remaining: '+ timeFormat(timeLeft())+ ') </font>' );
		
		//�P�_�s�����������|���O�_�w�[�J����
		$.ajax({
			url: "<%=request.getContextPath()%>/group_member/group_member.do",
			type:"POST",
			data: {
				group_no:"${groupVO.group_no}",
				member_no:"${memVO.member_no}",
				action:"checkMemIfExist"
			},
			success: function(msg){
				if(!${memVO.member_no == groupVO.member_no}){
					if(msg==="success"){
						$("#leaveBtn").show();
						$("#joinBtn").hide();
					}else{
						$("#joinBtn").show();
						$("#leaveBtn").hide();
					}
					if (group_status === 1){
						$("#joinBtn").hide();
						$("#leaveBtn").hide();
					}
				}
			}
		});
		var host = $("#${groupVO.group_no}-${groupVO.member_no}");
		
		$("#${groupVO.group_no}-${groupVO.member_no}").parent().prepend(host);
		host.height("120px");
		host.width("120px");

	});
	//�_�l�ʧ@����
		
		$("#joinBtn").click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/group_member/group_member.do",
				type:"POST",
				data: {
					group_no:"${groupVO.group_no}",
					member_no:"${memVO.member_no}",
					pay_status:"0",
					status:"1",
					action:"insert",
					requestURL:"<%=request.getServletPath()%>"
					
				},
				success: function(data){
					$("#joinBtn").hide();
					$("#member").append(
						 '<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${memVO.member_no}" id="${groupVO.group_no}-${memVO.member_no}" '
						+ 'alt="�|�L�Ϥ�" width="90px;" height="90px" '
						+ 'style="border-radius:50%;" class="clickable" />'
						);
					//�ʺAô��
					$(".clickable").off("mouseenter").on("mouseenter",function(){
						cancelTimer();
						displayImg();
					});
					
					$(".clickable").off("mouseleave").on("mouseleave", function(){
						setTimer();
					});
					//�ʺAô��
					 Swal.fire({
	                        position: "center",
	                        icon: "success",
	                        title: "�w���\�[�J����",
	                        showConfirmButton: false,
	                        timer: 1500,
	                    });
					 $("#leaveBtn").show();
				}
			}).done(function(){
				//������~����, �Գ̷s���ɶ�
				$.ajax({
					url: "<%=request.getContextPath()%>/group_member/group_member.do",
					type:"POST",
					data: {
						group_no:"${groupVO.group_no}",
						action:"getGroupCount_Ajax",
						requestURL:"<%=request.getServletPath()%>"
					},
					success: function(data){
						 $("#groupCnt").text('' +data + " / ${groupVO.required_cnt}");
					}
				});
			});
		});
		
		$("#leaveBtn").click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/group_member/group_member.do",
				type:"POST",
				data: {
					group_no:"${groupVO.group_no}",
					member_no:"${memVO.member_no}",
					action:"delete",
					requestURL:"<%=request.getServletPath()%>"
				},
				success: function(data){
					Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "�w���\�h�X����",
                        showConfirmButton: false,
                        timer: 1500,
                    });
					$("#leaveBtn").hide();
					$("#${groupVO.group_no}-${memVO.member_no}").remove();
					 $('#joinBtn').removeAttr('disabled','disabled');
					 $("#joinBtn").show();
				}
			}).done(function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/group_member/group_member.do",
					type:"POST",
					data: {
						group_no:"${groupVO.group_no}",
						action:"getGroupCount_Ajax",
						requestURL:"<%=request.getServletPath()%>"
					},
					success: function(data){
						 $("#groupCnt").text('' +data + " / ${groupVO.required_cnt}");
						 let joinBtnTxt = (data < ${groupVO.required_cnt}) ? '�{�b�[�J' : '�H�Ƥw��';
						 $("#joinBtn").text(joinBtnTxt);
					}
				});
			});
		});
		
		$("#gogoBtn").click(function(){
			goGroupName = $(this).find("input.goGroupName").val();
			sendWebSocket($(this));
			 Swal.fire({
                 position: "center",
                 icon: "success",
                 title: "�N�ɦV�I�ڭ���",
                 showConfirmButton: false,
                 timer: 1500,
             });
			  setTimeout(function() {
					 $(location).attr('href', '<%=request.getContextPath()%>/group/group.do?action=gogogo&group_no=${groupVO.group_no}&requestURL=<%=request.getServletPath()%>');
				    }, 1500);
		  });


		
		
		//�˼ƭp��
        function timeLeft() {
            // ���o�{�b�ɶ�
            let now = new Date();
            // �ӧO���o�@��� �Z��1970/1/1���@���
            let nowTime = now.getTime();
            let deadTime = Date.parse("${groupVO.deadline_dt}");
            // �^�Ǭۮt���@���
            return deadTime - nowTime;
        }
		
		function timeLeft1(time) {
            // ���o�{�b�ɶ�
            let now = new Date();
            // �ӧO���o�@��� �Z��1970/1/1���@���
            let nowTime = now.getTime();
            let deadTime = Date.parse(time);
            // �^�Ǭۮt���@���
            return deadTime - nowTime;
        }
        // 3. �g�@�Ө禡�A�^�Ǯ榡�ƳѾl���ɶ��A�榡�G'�Z�����Ф�A�ٳѤU 23��5�p��23��3��C'
        function timeFormat(leftTimes) { // �ǤJ�@���
        	const DAY = 24 * 60 * 60;
            const HOUR = 60 * 60;
            const MINUTE = 60;
            var secondLeft = Math.floor(leftTimes / 1000);
            var dayLeft = Math.floor(secondLeft / DAY);
            var secondLeft = secondLeft % DAY;
            var hourLeft = Math.floor(secondLeft / HOUR);
            var secondLeft = secondLeft % HOUR;
            var minuteLeft = Math.floor(secondLeft / MINUTE);
            var secondLeft = secondLeft % MINUTE;
            return   + dayLeft + 'day' + hourLeft + 'hr' + minuteLeft + 'min' + secondLeft + 'sec';
        }

        let target_member_no;
		//��ܹϤ�
		function displayImg() {
			var img = document.getElementById("pop-out-div");
			console.log("�q�L " + event.target.id + "����Ĳ�o");
			target_member_no = event.target.id.split("-")[1];
			console.log("target_member_no = " + target_member_no);
			console.log("${groupVO.member_no}");
			console.log("${memVO.member_no}");
			//�P�_�O�_���Ϊ�
			if(${memVO.member_no == groupVO.member_no}){
				//�O�Ϊ�
// 				console.log("�o�O�ڪ���");
				if(target_member_no == "${groupVO.member_no}"){
// 					console.log("���Ϊ�");
					$("#kick-out").hide();
				}
				else{
					$("#kick-out").show();
				}
			} else{ 
				//���O�Ϊ�
// 				console.log("�o���O�ڪ���");
				$("#kick-out").hide();
			}
			
			//�P�_�O�_�����H�Φn�͡A�M�w�n���n��ܥ[�n�ͫ��s
			if( target_member_no =="${memVO.member_no}"){
				$("#add-friend").hide();
				$("#myself").show();
				$("#retrieve-invitation").hide();
				$("#already-friends").hide();
			} else{
				let relationshipVO = getRelationship_Ajax(target_member_no);
				$("#myself").hide();
				$("#add-friend").show();
				$("#retrieve-invitation").hide();
				$("#already-friends").hide();
				if (relationshipVO.status == "XX"){ //���S���A���n��
					console.log("��襼�[�A���n��");
				} else if(relationshipVO.status == 0){ //��襼�����ܽСA�i���^�ܽ�
					$("#add-friend").hide();
					$("#retrieve-invitation").show();
					$("#already-friends").hide();
				} else if(relationshipVO.status == 1){ //���P�A�w�O�n��
					$("#already-friends").show();
					$("#retrieve-invitation").hide();
					$("#add-friend").hide();
				}
			}
				
			var x = event.clientX + document.body.scrollLeft -20;
			var y = event.clientY + document.body.scrollTop  +10; 

			img.style.left = x + "px";
			img.style.top = y + "px";
// 			img.style.display = "block";
			$("#pop-out-div").fadeIn();
		}
		
// 		//�Ϥ�����
		function vanishImg(){
			var img = document.getElementById("pop-out-div");
			$("#pop-out-div").fadeOut("slow");
		}
		
		let timer1;
		function setTimer(){
			timer1 = setTimeout(function(){
			vanishImg();     
			}, 600);
		}
		function cancelTimer(){
			clearTimeout(timer1);
		}
		$(".clickable").mouseenter(function(){
			cancelTimer();
			displayImg();
		});

		$(".clickable").mouseleave(function(){
			setTimer();
		});
		
		$("#pop-out-div").mouseenter(function(){
			cancelTimer();
		});
		$("#pop-out-div").mouseleave(function(){
			setTimer();
		});
		$("#kick-out").click(function(){
			kickMember(target_member_no);
		});
		$("#add-friend").click(function(){
			var relationshipVO = addFriend(target_member_no);
			$("#retrieve-invitation").show();
			$("#add-friend").hide();
		});
		$("#retrieve-invitation").click(function(){
			deleteRelationship_Ajax(target_member_no);
			$("#retrieve-invitation").hide();
			$("#add-friend").show();
		});
		function kickMember(target_member_no){
				$.ajax({
					url: "<%=request.getContextPath()%>/group_member/group_member.do",
					type:"POST",
					data: {
						group_no:"${groupVO.group_no}",
						member_no: target_member_no,
						action:"delete",
						requestURL:"<%=request.getServletPath()%>"
					},
					success: function(data){
						Swal.fire({
	                        position: "center",
	                        icon: "success",
	                        title: "�w���\��X����",
	                        showConfirmButton: false,
	                        timer: 1000,
	                    });
						$("#${groupVO.group_no}-"+ target_member_no).remove();
					}
				}).done(function(){
					$.ajax({
						url: "<%=request.getContextPath()%>/group_member/group_member.do",
						type:"POST",
						data: {
							group_no:"${groupVO.group_no}",
							action:"getGroupCount_Ajax",
							requestURL:"<%=request.getServletPath()%>"
						},
						success: function(data){
							 $("#groupCnt").text('' +data + " / ${groupVO.required_cnt}");
							 let joinBtnTxt = (data < ${groupVO.required_cnt}) ? '�{�b�[�J' : '�H�Ƥw��';
							 $("#joinBtn").text(joinBtnTxt);
						}
					});
				});
		}
		
		function addFriend(target_member_no){
			var relationshipVO = null;
				$.ajax({
					url: "<%=request.getContextPath()%>/relationship/relationship.do",
					type:"POST",
					data: {
						member_no:"${memVO.member_no}",
						friend_no:target_member_no,
						action:"addFriend_Ajax"
					},
					async: false,
					success: function(data){
						console.log(data);
						json = JSON.parse(data);
						console.log("�w���\�W�[�|���s��: " + json.friend_no + "���n��");
						relationshipVO = json;
					}
				});
			return relationshipVO;
		}
		
		function getRelationship_Ajax(target_member_no){
			var relationshipVO = null;
				$.ajax({
					url: "<%=request.getContextPath()%>/relationship/relationship.do",
					type:"POST",
					data: {
						member_no:"${memVO.member_no}",
						friend_no:target_member_no,
						action:"getRelationship_Ajax"
					},
					async: false,
					success: function(data){
						console.log(data);
						json = JSON.parse(data);
						console.log("�w���\���o�|���s��: " + json.friend_no + "�����");
						relationshipVO = json;
					}
				});
			return relationshipVO;
		}
		
		function deleteRelationship_Ajax(target_member_no){
			var relationshipVO = null;
			$.ajax({
				url: "<%=request.getContextPath()%>/relationship/relationship.do",
				type:"POST",
				data: {
					member_no:"${memVO.member_no}",
					friend_no:target_member_no,
					action:"deleteRelationship_Ajax"
				},
				async: false,
				success: function(data){
					if(data == "success")
						console.log(member_no + "�P" + friend_no + "���n�����Y(��V)�R������!");
					else{
						console.log("�R������");
					}
				}
			});
		}

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
	var activeDismissGroupNO;


	$(".addFriend").click(function(){
		friendNO = $(this).find("input.friendNO").val();
		sendWebSocket($(this));
	})
	$(".addGroup").click(function(){
		groupNO = $(this).find("input.groupNO").val();
		sendWebSocket($(this));
	})
	$(".buyTicket").click(function(){
		movieNO = $(this).find("input.movieNO").val();
		sendWebSocket($(this));
	})
	$(".addfriend_check_btn").click(function(){
		friendNO = $(this).find("input.friendNO").val();
		sendWebSocket($(this));
		//�o�����insertfriend��code
	})
	$(".createGroup").click(function(){
		groupName = document.getElementById("groupName").value;  //���i��b�W���ŧi�A�]��groupname�O�ϥΪ̦ۤv���nclick��~�|�����A�ҥH�n��bclick�ƥ�
		sendWebSocket($(this));
	})
	$(".kickoffGroup").click(function(){
		kickGroupName = $(this).find("input.kickGroupName").val();
		sendWebSocket($(this));
	})
	$(".reminder").click(function(){
		memberNO = $(this).find("input.memberNO").val();
		sendWebSocket($(this));

	})
	$(".activeDismissGroup").click(function(){
		activeDismissGroupNO = $(this).find("input.activeDismissGroupNO").val();
		sendWebSocket($(this));
	})
	
	
	function sendWebSocket(item){
		let timespan = new Date();
		let timeStr = timespan.getFullYear() + "-" + (timespan.getMonth()+1).toString().padStart(2, "0") + "-" 
					+ timespan.getDate() + " " + timespan.getHours().toString().padStart(2, "0") + ":" + timespan.getMinutes().toString().padStart(2, "0");
		if(item.hasClass("addFriend")){
			type = item.val();
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : friendNO,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("addGroup")){
			type = "addGroup";
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : groupNO,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("buyTicket")){
			type = item.val();
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : movieNO,
				"message":"",
				"time":timeStr
			};
		}
		if(item.val()==1){
			var jsonObj = {
				"type" : "response",
				"sender" : self,
				"receiver" : friendNO,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("createGroup")){
			type = "createGroup";
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : groupName,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("goGroup")){
			type = "goGroup";
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : goGroupName,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("kickoffGroup")){
			type = "kickoffGroup";
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : kickGroupName,
				"message":"",
				"time":timeStr
			};
		}
		if(item.hasClass("reminder")){
			type = item.val();
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : memberNO,
				"message":"",
				"time":timeStr
			};
		}

		if(item.hasClass("activeDismissGroup")){
			type = "activeDismissGroup";
			var jsonObj = {
				"type" : type,
				"sender" : self,
				"receiver" : activeDismissGroupNO,
				"message":"",
				"time":timeStr
			};
		}

		webSocket.send(JSON.stringify(jsonObj));
	}
	

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
	  if (type==="addGroup"||type==="createGroup"||type==="goGroup"||type==="activeDismissGroup"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/group.png"
	  }
	  if (type==="buyTicket"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/ticket.png"
	  }
	  if (type==="reminder"||type==="dismissGroup"||type==="kickoffGroup"||type==="kickUnpaid"){
			img.src="<%=request.getContextPath()%>/images/notify_icons/warning.png"
	  }
	  
		  img.classList.add("alertImg");
		  imgdiv.append(img);
		  txt.innerText = text;
		  txt.classList.add("alertTxt");
		  time_str.innerText = time;
		  time_str.classList.add("alertTime");
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

	function loginFirst(){
		Swal.fire('�Х��n�J').then((result)=>{
			window.location.href = "<%=request.getContextPath()%>/front-end/mem/MemLogin.jsp";
		});
	}
	//���κI��˼ƭp��
	timer = setInterval(function() {
        let left = timeLeft(); 
        if (left >= 1000) {
//         	$("#dd-cntDown").html(
//         			'<fmt:formatDate value="${groupVO.deadline_dt}" pattern="yyyy-MM-dd HH:mm" />'
//         			+ '<br><p class="counter">(' + timeFormat(left)  + ')</p>');
        	$("#dd-cntDown").html(
        			'<fmt:formatDate value="${groupVO.deadline_dt}" pattern="yyyy-MM-dd HH:mm" />'
        			+ ' <font color="red"> (remaining: '+ timeFormat(timeLeft())+ ') </font>' );
        	
        	if(left <= 1000 * 60 *5 ){
        		$("#dd-cntDown").toggleClass("counter", false);
        		$("#dd-cntDown").toggleClass("urgentCounter", true);
        	}
        }
        else {
            alert('���Τw�I��I');
            window.location.reload();
			document.location.href ="<%=request.getContextPath()%>/front-end/group/group_front_page.jsp";
            clearInterval(timer); 
        }
    }, 1000);
	//���κI��˼ƭp��
	
</script>
</body>
</html>