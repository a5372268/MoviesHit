<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>

<%
  EmployeeVO employeeVO = (EmployeeVO) request.getAttribute("employeeVO"); //EmpServlet.java (Concroller) �s�Jreq��employeeVO���� (�]�A�������X��employeeVO, �]�]�A��J��ƿ��~�ɪ�employeeVO����)
%>
<%-- <%= employeeVO==null %> --%>
<html lang="en" class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_employee_input.jsp</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/employee/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/employee/css/stylexxx.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/employee/css/animate-custom.css" />

</head>
    <body>
    
    <%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

        <div class="container">
        <header>
                <h1></span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <div id="wrapper">
                    

                        <div id="register" class="animate form">
                            <form  METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/employee/employee.do" name="form1" autocomplete="on"> 
                                <h1> ���u�ק� </h1> 
                                <p> 
                                    <label for="empno" data-icon="u">���u�s��:</label>
                                    <input id="empno" name="empno" required="required" type="text" value="<%=employeeVO.getEmpno()%>" />
                                </p>
                                
                                <p> 
                                    <label for="empname" data-icon="u" >���u�m�W:</label>
                                    <input id="empname" name="empname" required="required" type="text" value="<%=employeeVO.getEmpname()%>" /> 
                                </p>
                                
                                 <p> 
                                    <label for="emppwd" data-icon="p">���u�K�X:</label>
                                    <input id="emppwd" name="emppwd" required="required" type="password" value="<%=employeeVO.getEmppwd()%>" />
                                </p>
                                
                                <p> 
                                    <label for="gender">�ʧO:</label>
                                		<select size="1" name="gender">
										<option value="0">�k
										<option value="1">�k
									</select>
                                </p>
                                
                                <p> 
                                    <label for="tel" data-icon="u">�q��:</label>
                                    <input id="tel" name="tel" required="required" type="text" value="<%=employeeVO.getTel()%>" />
                                </p>
                                
                                <p> 
                                    <label for="email" data-icon="e">�q�l�l��:</label>
                                    <input id="email" name="email" required="required" type="text"  value="<%=employeeVO.getEmail()%>" />
                                </p>
                                
                                <p> 
                                    <label for="title" data-icon="u">¾��:</label>
                                    <input id="title" name="title" required="required" type="text" value="<%=employeeVO.getTitle()%>" />
                                </p>
                                
                                <p> 
                                    <label for="f_date1" data-icon="u">���Τ��:</label>
                                    <input id="f_date1" name="hiredate" required="required" type="text" value="<%=employeeVO.getHiredate()%>"/>
                                </p>
                                
                                <p> 
                                    <label for="f_date2" data-icon="u">��¾���:</label>
                                    <input id="f_date2" name="quitdate" required="required" type="text" value="<%=employeeVO.getQuitdate()%>"/>
                                </p>
                                
                                <p> 
                                 	 <label for="status" data-icon="u">�b¾���A:</label>
									 <input id="status" name="status" required="required" type="text" value="<%=employeeVO.getStatus()%>"/>
<!--                                   	 <input type="radio" name="status" value="0">�w��¾ -->
<!-- 									 <input type="radio" name="status" value="1" checked>�b¾�� -->
<!-- 									 <input type="radio" name="status" value="2">�d¾���~ -->
                                </p>
                                
                                
                                
                                <p class="signin button"> 
									<input type="hidden" name="action" value="update">
									<input type="hidden" name="empno" value="<%=employeeVO.getEmpno()%>">
									<input type="submit" value="save">
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
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
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=employeeVO.getHiredate()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=employeeVO.getQuitdate()%>', // value:   new Date(),
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