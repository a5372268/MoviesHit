package com.report_group.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.group.model.GroupService;
import com.group_member.model.Group_MemberVO;
import com.report_group.model.*;


public class Report_GroupServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

//		if ("getAll".equals(action)) {
//			/***************************�}�l�d�߸�� ****************************************/
//			Report_groupDAO dao = new Report_groupDAO();
//			List<Report_groupVO> list = dao.getAll();
//
//			/***************************�d�ߧ���,�ǳ����(Send the Success view)*************/
//			HttpSession session = req.getSession();
//			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
//			// Send the Success view
//			String url = "/report_group/listAllReport_group2_getFromSession.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllReport_group2_getFromSession.jsp
//			successView.forward(req, res);
//			return;
//		}


		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD //���g�b�e�� �Ҥp�����d��

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("report_no");
				if (str == null || (str.trim()).length() == 0) { //�[str == null ���bgetParameter("report_no")��reportno����ŭȪ����p
					errorMsgs.add("�п�J���|�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer report_no = null;
				try {
					report_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���׽s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/select_page.jsp_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
			Report_GroupDAO dao = new Report_GroupDAO();
			Report_GroupVO report_groupVO = dao.findByPrimaryKey(report_no);
				if (report_groupVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("report_groupVO", report_groupVO); // ��Ʈw���X��report_groupVO����,�s�Jreq
				String url = "/front-end/report_group/listOneReport_Group.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneReport_Group.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_group/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllReport_Group.jsp���ШD  ��  /movie/listReport_Groups_ByMovieno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer report_no = new Integer(req.getParameter("report_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Report_GroupService report_groupSvc = new Report_GroupService();
				Report_GroupVO report_groupVO = report_groupSvc.getOneReport_Group(report_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("report_groupVO", report_groupVO);         // ��Ʈw���X��report_groupVO����,�s�Jreq
				String url = "/front-end/report_group/update_report_group_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_report_group_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_group/listAllReport_Group.jsp");
				failureView.forward(req, res);

			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_report_group_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
	
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer report_no = new Integer(req.getParameter("report_no").trim());
				
//				Integer group_no  = null;
//				try {
//					group_no = new Integer(req.getParameter("group_no").trim());
//					if(group_no <= 0 ) {
//						errorMsgs.add("�����s���ж�>0���Ʀr.");
//					}
//				} catch(NumberFormatException e) {
//					group_no = 1;
//					errorMsgs.add("�����s���ж�Ʀr.");
//				}
				
				
				
				String status = req.getParameter("status").trim();
				if (status == null || status.trim().length() == 0) {
					errorMsgs.add("���A�ФŪť�");
				}
				
				String desc = req.getParameter("desc").trim();
				if (desc == null || desc.trim().length() == 0) {
					errorMsgs.add("�Ƶ��ФŪť�");
				}
				
				Report_GroupVO report_groupVO = new Report_GroupVO();
								
				report_groupVO.setReport_no(report_no);
				report_groupVO.setDesc(desc);
				report_groupVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("report_groupVO", report_groupVO); // �t����J�榡���~��report_groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/update_report_group_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Report_GroupService report_groupSvc = new Report_GroupService();
				report_groupVO = report_groupSvc.updateReport_Group(report_no, status, desc);
				
				
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("report_groupVO", report_groupVO); // ��Ʈwupdate���\��,���T����report_groupVO����,�s�Jreq
				String url = "/front-end/report_group/listOneReport_Group.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneReport_Group.jsp
				successView.forward(req, res);


				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_group/update_report_group_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addReport_Group.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				Integer group_no = new Integer(req.getParameter("group_no").trim());
				Integer member_no = new Integer(req.getParameter("member_no").trim());
				
				
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("���|���e�ФŪť�");
				}
				
				
				Report_GroupVO report_groupVO = new Report_GroupVO();
				report_groupVO.setGroup_no(group_no);;
				report_groupVO.setMember_no(member_no);
				report_groupVO.setContent(content);
				
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("report_groupVO", report_groupVO); // �t����J�榡���~��report_groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/addReport_Group.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Report_GroupService report_groupSvc = new Report_GroupService();
				report_groupVO = report_groupSvc.addReport_Group(group_no, content, member_no);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/front-end/report_group/listAllReport_Group.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllReport_Group.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_group/addReport_Group.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllReport_Group.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer report_no = new Integer(req.getParameter("report_no"));
			
				/***************************2.�}�l�R�����***************************************/
				Report_GroupService report_groupSvc = new Report_GroupService();
				report_groupSvc.deleteReport_Group(report_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/report_group/listAllReport_Group.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_group/listAllReport_Group.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("listReports_ByStatus_A".equals(action) || "listReports_ByStatus_B".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String str = req.getParameter("status");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("�п�J���A");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
				return;//�{�����_
			}
			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String status = str;
			
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/report_group/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/*************************** 2.�}�l�d�߸�� ****************************************/
				
				Report_GroupService report_groupSvc = new Report_GroupService();
				Set<Report_GroupVO> set = report_groupSvc.getReportsByStatus(status);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listReports_ByStatus", set);    // ��Ʈw���X��list����,�s�Jrequest
				
				boolean openModal_listReports_ByStatus=true;	
				req.setAttribute("openModal_listReports_ByStatus",openModal_listReports_ByStatus );
				
				String url = null;
				if ("listReports_ByStatus_A".equals(action))
					url = "/front-end/report_group/listReports_ByStatus.jsp";        // ���\��� dept/listEmps_ByDeptno.jsp
				else if ("listReports_ByStatus_B".equals(action))
					url = "/front-end/report_group/listAllReport_Group.jsp";              // ���\��� dept/listAllDept.jsp
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}
}
