package com.group.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.group.model.*;
import com.group_member.model.*;
import com.showtime.model.ShowtimeService;
import com.showtime.model.ShowtimeVO;

@WebServlet("/GroupServlet")
public class GroupServlet extends HttpServlet {
	private GroupTimer groupTimer;
	//���إߤ@���~�Ӧ�Timer��GroupTimer����
	//�o��ŧi�~�i�H��servlet���ͩR�g��
	public void init() throws ServletException{
		this.groupTimer= new GroupTimer();
		
		//init()�ɫإߩҦ����Υ��ѺI��Ƶ{��
		GroupService groupSvc = new GroupService();
		List<GroupVO> list= groupSvc.getAll();
		for(GroupVO groupVO : list) {
			groupTimer.addDismissTask(groupVO);
		}
		//�إߴ��Φ������I�ڳQ�𱼤��Ƶ{��
		List<GroupVO> list1= groupSvc.getStatusEquals1();
		for(GroupVO groupVO : list1) {
			groupTimer.addKickOutTask(groupVO);
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text; charset=utf-8");
		String action = null;
		if( req.getAttribute("action") != null) {
			action = (String) req.getAttribute("action");
		}
		else {
			action = req.getParameter("action");
		}

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("group_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���νs��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer group_no = null;
				try {
					group_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���νs���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/group_front_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				GroupService groupSvc = new GroupService();
				GroupVO groupVO = groupSvc.getOneGroup(group_no);
				if (groupVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/group_front_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("groupVO", groupVO); // ��Ʈw���X��groupVO����,�s�Jreq
				String url = "/front-end/group/listOneGroup.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer group_no = new Integer(req.getParameter("group_no"));
				/***************************2.�}�l�d�߸��****************************************/
				GroupService groupSvc = new GroupService();
				GroupVO groupVO = groupSvc.getOneGroup(group_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("groupVO", groupVO);         // ��Ʈw���X��groupVO����,�s�Jreq
				String url = "/front-end/group/update_group_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				//GROUP_NO
				Integer group_no  = null;
				try {
					group_no = new Integer(req.getParameter("group_no").trim());
				} catch(NumberFormatException e) {
					errorMsgs.add("�䤣�촪�νs��");
				}

				//SHOWTIME_NO
				Integer showtime_no  = null;
				try {
					showtime_no = new Integer(req.getParameter("showtime_no").trim());
					if(showtime_no <= 0 ) {
						errorMsgs.add("�����s���ж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					showtime_no = 1;
					errorMsgs.add("�����s���ж�Ʀr.");
				}
				
				//MEMBER_NO
				Integer member_no  = null;
				try {
					member_no = new Integer(req.getParameter("member_no").trim());
				}catch(NumberFormatException e) {
					member_no = 1;
					errorMsgs.add("�D���|���s���ж�Ʀr.");
				}
				
				//GROUP_TITLE
				String group_title = req.getParameter("group_title").trim();
				if (group_title == null || group_title.trim().length() == 0) {
					group_title = "";
					errorMsgs.add("���μ��D�ФŪť�");
				}

				//REQUIRED_CNT
				Integer required_cnt  = null;
				try {
					required_cnt = new Integer(req.getParameter("required_cnt").trim());
					if(required_cnt <= 0 ) {
						errorMsgs.add("�n�D�H�ƽж�>0���Ʀr.");
					}
				}catch(NumberFormatException e) {
					required_cnt = 1;
					errorMsgs.add("�n�D�H�ƽж�Ʀr.");
				}
				
				//GROUP_STATUS
				String group_status = req.getParameter("group_status").trim();
				if (group_status == "null" || group_status.trim().length() == 0) {
					group_status = "0";
					errorMsgs.add("���Ϊ��A�ФŪť�");
				}

				
				//GROUP_TITLE
				String desc = req.getParameter("desc").trim();
				if (desc == null || desc.trim().length() == 0) {
					desc = "";
					errorMsgs.add("���λ����ФŪť�");
				}
				
				//CRT_DT
				java.sql.Timestamp crt_dt = new java.sql.Timestamp(System.currentTimeMillis());;
				//MODIFY_DT
				java.sql.Timestamp modify_dt= new java.sql.Timestamp(System.currentTimeMillis());
				
				
				//DEADLINE_DT
				java.sql.Timestamp deadline_dt = null;
				try {
//					deadline_dt = java.sql.Timestamp.valueOf(req.getParameter("deadline_dt").trim());
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date parsedDate = dateFormat.parse(req.getParameter("deadline_dt"));
					deadline_dt = new java.sql.Timestamp(parsedDate.getTime());
					
					
					//�ŧi24�p�ɫ�ɶ�
			        int day = 1;
					Timestamp original = new Timestamp(System.currentTimeMillis());
			        Calendar cal = Calendar.getInstance();
			        cal.setTimeInMillis(original.getTime());
			        cal.add(Calendar.DATE, day);
			        Timestamp twentyFourHoursLater = new Timestamp(cal.getTime().getTime());

			        //�ŧi�����e�@��
			        ShowtimeService showtimeSvc = new ShowtimeService();
			        Timestamp showtime_Time = showtimeSvc.getOneShowtime(showtime_no).getShowtime_time();
			        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			        Date parsedDate1 = dateFormat1.parse(showtime_Time.toString());
			       Timestamp oneDayBefore = new java.sql.Timestamp(parsedDate1.getTime());

			        
			      //���κI��ɶ��@�w�n>�{�b�_��24�p�ɫ�
			        if( deadline_dt.before(twentyFourHoursLater)) {
			        	Timestamp original1 = new Timestamp(System.currentTimeMillis());
			        	Calendar cal2 = Calendar.getInstance();
			            cal2.setTimeInMillis(original1.getTime());
			            cal2.add(Calendar.DATE, 1);
			            cal2.add(Calendar.MINUTE, 5);
			            deadline_dt = new Timestamp(cal2.getTime().getTime());
						errorMsgs.add("�I�����̦���24�p�ɤ���!");
			        }
			      //���κI��ɶ��@�w�n<�����e�@��
			        if( deadline_dt.after(oneDayBefore)) {
			        	Calendar cal2 = Calendar.getInstance();
			            cal2.setTimeInMillis(oneDayBefore.getTime());
			            cal2.add(Calendar.MINUTE, -1);
			            deadline_dt = new Timestamp(cal2.getTime().getTime());
						errorMsgs.add("�I�����̱߭n�b�����e�@��");
			        }
			        
				} catch (IllegalArgumentException e) {
					deadline_dt=new Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J�I����!");
				}
				
				
				GroupVO groupVO = new GroupVO();
				groupVO.setGroup_no(group_no);
				groupVO.setShowtime_no(showtime_no);
				groupVO.setMember_no(member_no);
				groupVO.setGroup_title(group_title);
				groupVO.setRequired_cnt(required_cnt);
				groupVO.setGroup_status(group_status);
				groupVO.setDesc(desc);
				groupVO.setCrt_dt(crt_dt);
				groupVO.setModify_dt(modify_dt);
				groupVO.setDeadline_dt(deadline_dt);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("groupVO", groupVO); // �t����J�榡���~��groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/update_group_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				/***************************2.�}�l�ק���*****************************************/
				GroupService groupSvc = new GroupService();
				groupVO = groupSvc.updateGroup(group_no, showtime_no, 
						member_no, group_title, required_cnt, 
						group_status, desc, crt_dt, modify_dt, deadline_dt);
				//��s�Ƶ{��
				groupTimer.cancelDismissTask(group_no);
				groupTimer.addDismissTask(groupVO);
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("groupVO", groupVO); // ��Ʈwupdate���\��,���T����groupVO����,�s�Jreq

				String url = "/front-end/group/group_front_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
        if ("insert".equals(action)) { // �Ӧ�addGroup.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				//GROUP_NO
				//insert����group_no
				Integer group_no  = null;

				//SHOWTIME_NO
				Integer showtime_no  = null;
				try {
					showtime_no = new Integer(req.getParameter("showtime_no").trim());
					if(showtime_no <= 0 ) {
						errorMsgs.add("�����s���ж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					showtime_no = 1;
					errorMsgs.add("�����s���ж�Ʀr.");
				}
				
				//MEMBER_NO
				Integer member_no  = null;
				try {
					member_no = new Integer(req.getParameter("member_no").trim());
					
					if(member_no <= 0 ) {
						errorMsgs.add("�D���|���s���ж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					errorMsgs.add("�D���|���s���ж�Ʀr.");
				}
				
				//GROUP_TITLE
				String group_title = req.getParameter("group_title").trim();
				if (group_title == null || group_title.trim().length() == 0) {
					group_title = "";
					errorMsgs.add("���μ��D�ФŪť�");
				}
				
				//REQUIRED_CNT
				Integer required_cnt  = null;
				try {
					required_cnt = new Integer(req.getParameter("required_cnt").trim());
					if(required_cnt <= 0 ) {
						errorMsgs.add("�n�D�H�ƽж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					required_cnt = 1;
					errorMsgs.add("�n�D�H�ƽж�Ʀr.");
				}
				
				//DESC
				String desc = req.getParameter("desc").trim();
				if (desc == null || desc.trim().length() == 0) {
					desc = "";
					errorMsgs.add("�����ФŪť�");
				}
				//DEADLINE_DT
				java.sql.Timestamp deadline_dt = null;

				try {
//					deadline_dt = java.sql.Timestamp.valueOf(req.getParameter("deadline_dt").trim());
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date parsedDate = dateFormat.parse(req.getParameter("deadline_dt"));
					deadline_dt = new java.sql.Timestamp(parsedDate.getTime());
					
					
					//�ŧi24�p�ɫ�ɶ�
			        int day = 1;
					Timestamp original = new Timestamp(System.currentTimeMillis());
			        Calendar cal = Calendar.getInstance();
			        cal.setTimeInMillis(original.getTime());
			        cal.add(Calendar.DATE, day);
			        Timestamp twentyFourHoursLater = new Timestamp(cal.getTime().getTime());

			        //�ŧi�����e�@��
			        ShowtimeService showtimeSvc = new ShowtimeService();
			        Timestamp showtime_Time = showtimeSvc.getOneShowtime(showtime_no).getShowtime_time();
			        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			        Date parsedDate1 = dateFormat1.parse(showtime_Time.toString());
			       Timestamp oneDayBefore = new java.sql.Timestamp(parsedDate1.getTime());

			        
			      //���κI��ɶ��@�w�n>�{�b�_��24�p�ɫ�
			        if( deadline_dt.before(twentyFourHoursLater)) {
			        	Timestamp original1 = new Timestamp(System.currentTimeMillis());
			        	Calendar cal2 = Calendar.getInstance();
			            cal2.setTimeInMillis(original1.getTime());
			            cal2.add(Calendar.DATE, 1);
			            cal2.add(Calendar.MINUTE, 5);
			            deadline_dt = new Timestamp(cal2.getTime().getTime());
						errorMsgs.add("�I�����̦���24�p�ɤ���!");
			        }
			      //���κI��ɶ��@�w�n<�����e�@��
			        if( deadline_dt.after(oneDayBefore)) {
			        	Calendar cal2 = Calendar.getInstance();
			            cal2.setTimeInMillis(oneDayBefore.getTime());
			            cal2.add(Calendar.MINUTE, -1);
			            deadline_dt = new Timestamp(cal2.getTime().getTime());
						errorMsgs.add("�I�����̱߭n�b�����e�@��");
			        }
			        
				} catch (IllegalArgumentException e) {
					deadline_dt=new Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J�I����!");
				}
				GroupVO groupVO = new GroupVO();
				groupVO.setGroup_no(group_no);
				groupVO.setShowtime_no(showtime_no);
				groupVO.setMember_no(member_no);
				groupVO.setGroup_title(group_title);
				groupVO.setRequired_cnt(required_cnt);
				groupVO.setDesc(desc);
				groupVO.setDeadline_dt(deadline_dt);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("groupVO", groupVO); // �t����J�榡���~��groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/addGroup.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				GroupService groupSvc = new GroupService();
				Group_MemberService group_memberSvc = new Group_MemberService();
				//�s�Wgroup
				groupVO = groupSvc.addGroup(showtime_no, 
						member_no, group_title, required_cnt,
						desc, deadline_dt);
				
				//�s�Wgroup_member
				group_memberSvc.addGroup_Member(groupVO.getGroup_no(), member_no);
				
				//�إߺI��Ƶ{��
				groupTimer.addDismissTask(groupVO);
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
		
				String url = "/front-end/group/group_front_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/addGroup.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer group_no = new Integer(req.getParameter("group_no"));
				
				/***************************2.�}�l�R�����***************************************/
				GroupService groupSvc = new GroupService();
				groupSvc.deleteGroup(group_no);
				
				//�����I��Ƶ{��
				groupTimer.cancelDismissTask(group_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/group/group_front_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("listMembers_ByGroupno_A".equals(action) || "listMembers_ByGroupno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String str = req.getParameter("group_no");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("�п�J���νs��");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/select_page.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer group_no = null;
				try {
					group_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���νs���榡�����T");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/*************************** 2.�}�l�d�߸�� ****************************************/
				GroupService groupSvc = new GroupService();
				Set<Group_MemberVO> set = groupSvc.getMembersByGroupno(group_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listMembers_ByGroupno", set);    // ��Ʈw���X��list����,�s�Jrequest
				
				boolean openModal_listMembers_ByGroupno=true;	
				req.setAttribute("openModal_listMembers_ByGroupno",openModal_listMembers_ByGroupno );
				
				String url = null;
				if ("listMembers_ByGroupno_A".equals(action))
					url = "/front-end/group/listMembers_ByGroupno.jsp";        // ���\��� dept/listEmps_ByDeptno.jsp
				else if ("listMembers_ByGroupno_B".equals(action))
					url = "/front-end/group/listAllGroup.jsp";              // ���\��� dept/listAllDept.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		
		if ("getOne_From06".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("group_no");
				

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���νs��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				Integer group_no = null;
				try {
					group_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���νs���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				/***************************2.�}�l�d�߸��*****************************************/
				GroupService groupSvc = new GroupService();
				GroupVO groupVO = groupSvc.getOneGroup(group_no);
				if (groupVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("groupVO", groupVO); // ��Ʈw���X��groupVO����,�s�Jreq
				
				//Bootstrap_modal
				boolean openModal_Group=true;	
				req.setAttribute("openModal_Group",openModal_Group );
				String url = requestURL;
//				String url = "/front-end/group/listOneGroup.jsp";
				if("/front-end/group/group_SearchResult.jsp".equals(requestURL)) {
					url = "/front-end/group/group_front_page.jsp";
				}
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("listGroups_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.�N��J����ରMap**********************************/ 
				//�ĥ�Map<String,String[]> getParameterMap()����k 
				//�`�N:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				@SuppressWarnings("unchecked")
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				
				// �H�U�� if �϶��u��Ĥ@������ɦ���
				if (req.getParameter("whichPage") == null){
					Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				
				/***************************2.�}�l�ƦX�d��***************************************/
				GroupService groupSvc = new GroupService();
				List<GroupVO> list  = groupSvc.getAll(map);
				
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listGroups_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/group/group_SearchResult.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		//�ƦX�d��
		if ("getAllShowtimeByMovie_no".equals(action)) { // �Ӧ�select_page.jsp���ШD
//			res.setContentType("application/json; charset=uft-8");
			res.setCharacterEncoding("utf-8");
			PrintWriter out = res.getWriter();
			Integer movie_no = new Integer(req.getParameter("movie_no").trim());
			
			ShowtimeService showtimerSvc = new ShowtimeService();
			List<ShowtimeVO> listAllShowtimeByMovie_no = showtimerSvc.getAllShowtimeByMovie_no(movie_no);
			
			JSONArray showtimeByMovie_no = new JSONArray(listAllShowtimeByMovie_no);  //
			JSONObject jsonobj=new JSONObject();
			try {
				jsonobj.put("showtimeByMovie_no", showtimeByMovie_no);
				out.print(jsonobj.toString());
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
			out.close();
			return;
		}
		
		//�ڪ�����
		if ("listMyGroups".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer member_no = null;
				try {
					member_no = new Integer(req.getParameter("member_no"));
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				
				Integer group_status = null;
				try {
					group_status = new Integer(req.getParameter("group_status"));
				} catch (Exception e) {
					errorMsgs.add("���Ϊ��A�榡�����T");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/select_page.jsp/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************2.�}�l�d�ߧڪ�����***************************************/
				GroupService groupSvc = new GroupService();
				List<GroupVO> list  = groupSvc.getMyGroups(member_no, group_status);
				
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listMyGroups", list); // ��Ʈw���X��list����,�s�Jrequest
				req.setAttribute("group_status", group_status);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/group/group_listMyGroups.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updateOne_For_Ajax".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				int group_no = new Integer(req.getParameter("group_no"));
				int member_no = new Integer(req.getParameter("member_no"));
				String group_title = req.getParameter("group_title");
				if (group_title == null || group_title.trim().length() == 0) {
					out.print("title_error");
					return;
				}
				
				int showtime_no = new Integer(req.getParameter("showtime_no"));
				int required_cnt = new Integer(req.getParameter("require_no"));
				String desc = req.getParameter("desc");
				if (desc == null || desc.trim().length() == 0) {
					out.print("desc_error");
					return;
				}
				
				java.sql.Timestamp deadline_dt = null;
				try {
					deadline_dt = java.sql.Timestamp.valueOf(req.getParameter("deadline_dt").trim());
				} catch (IllegalArgumentException e) {
					deadline_dt=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J�I����!");
				}
				
				String group_status = "0";
				//CRT_DT
				java.sql.Timestamp crt_dt = new java.sql.Timestamp(System.currentTimeMillis());;
				//MODIFY_DT
				java.sql.Timestamp modify_dt= new java.sql.Timestamp(System.currentTimeMillis());
				//DEADLINE_DT
				
				GroupVO groupVO = new GroupVO();

				/***************************2.�}�l�ק���*****************************************/
				GroupService groupSvc = new GroupService();
				groupVO = groupSvc.updateGroup(group_no, showtime_no, 
						member_no, group_title, required_cnt, 
						group_status, desc, crt_dt, modify_dt, deadline_dt);

				if (groupVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}	
				
				try {
					out.print("success");
					return;
				}catch(Exception e) {
					out.print("fail");
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}
		
//		if ("gogogo".equals(action)) { 
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			String str = req.getParameter("group_no");
//			if (str == null || (str.trim()).length() == 0) {
//				errorMsgs.add("�п�J���νs��");
//			}
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
//				failureView.forward(req, res);
//				return;//�{�����_
//			}
//			try{
//				
//				Integer group_no = null;
//				try {
//					group_no = new Integer(str);
//					
////					//���եΦۤv�]�wtimestamp��J
//					GroupService groupSvc = new GroupService();
//					groupSvc.gogogo(group_no);
//					GroupVO groupVO = groupSvc.getOneGroup(group_no); 
//					groupTimer.cancelDismissTask(group_no);
//					groupTimer.addKickOutTask(groupVO);
//					
//					
//				} catch (Exception e) {
//					errorMsgs.add("���νs���榡�����T");
//				}
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/group/group_front_page.jsp");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//			
//			}
//			catch (Exception e) {
//				errorMsgs.add("�L�k���o���:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
		if ("gogogo".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String str = req.getParameter("group_no");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("�п�J���νs��");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			try{
				
				Integer group_no = null;
				try {
					group_no = new Integer(str);
//					//���եΦۤv�]�wtimestamp��J
					GroupService groupSvc = new GroupService();
					groupSvc.gogogo(group_no);
					GroupVO groupVO = groupSvc.getOneGroup(group_no); 
					groupTimer.cancelDismissTask(group_no);
					groupTimer.addKickOutTask(groupVO);
					
				} catch (Exception e) {
					errorMsgs.add("���νs���榡�����T");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group/group_front_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				req.setAttribute("action", "getOne_For_Display");
				String url = "/group/group.do";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);
			 
			}
			catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group/group_front_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("getGroupVO_Ajax".equals(action)) { // �Ӧ�listAllEmp.jsp
			System.out.println("����getGROUPVO�ШD");
			res.setCharacterEncoding("utf-8");
			PrintWriter out = res.getWriter();
			Integer group_no = new Integer(req.getParameter("group_no"));
			GroupService groupSvc = new GroupService();
			GroupVO groupVO = groupSvc.getOneGroup(group_no);
						
			JSONObject jsonobj= new JSONObject();
			try {
				Date date = new Date();
				date.setTime(groupVO.getDeadline_dt().getTime());
				String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:MM").format(date);
				System.out.println("deadline_dt = " + formattedDate);
				jsonobj.put("group_no", groupVO.getGroup_no());
				jsonobj.put("showtime_no", groupVO.getShowtime_no());
				jsonobj.put("member_no", groupVO.getMember_no());
				jsonobj.put("group_title", groupVO.getGroup_title());
				jsonobj.put("required_cnt", groupVO.getRequired_cnt());
				jsonobj.put("member_cnt", groupVO.getMember_cnt());
				jsonobj.put("group_status", new com.mappingtool.StatusMapping().dboGroup_GroupStatus(groupVO.getGroup_status()));
				jsonobj.put("desc", groupVO.getDesc());
				jsonobj.put("crt_dt", groupVO.getCrt_dt());
				jsonobj.put("modify_dt", groupVO.getModify_dt());
				jsonobj.put("deadline_dt", formattedDate);
				out.print(jsonobj.toString());
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
		}

		
	} //doPost����
	public void destroy() {
		groupTimer.cancel();
	}

}
