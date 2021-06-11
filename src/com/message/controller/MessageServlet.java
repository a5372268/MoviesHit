package com.message.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.message.model.*;

public class MessageServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("message_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�T���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				Integer message_no = null;
				try {
					message_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�T���s���榡�����T");
				}
				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��(�I�smodel, ����h�s��*****************************************/
				MessageService messageSvc = new MessageService();
				MessageVO messageVO = messageSvc.getOneMessage(message_no);
				if (messageVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("messageVO", messageVO); // ��Ʈw���X��messageVO����,�s�Jreq
			
				String url = "/front-end/message/listOneMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneMessage.jsp
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/message/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllMessage.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer message_no = new Integer(req.getParameter("message_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				MessageService messageSvc = new MessageService();
				MessageVO messageVO = messageSvc.getOneMessage(message_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("messageVO", messageVO); 

				// ��Ʈw���X��messageVO����,�s�Jreq
				String url = "/front-end/message/update_message_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_message_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/message/listAllMessage.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // �Ӧ�update_message_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer message_no = new Integer(req.getParameter("message_no").trim());
				Integer from_member_no = null;
				try {
				from_member_no = new Integer(req.getParameter("from_member_no").trim());
				} catch (NumberFormatException e) {
					from_member_no = null;
					errorMsgs.add("�ж�J���T���o�T�|���s��");
				}
				Integer to_member_no = null;
						try {
							to_member_no = new Integer(req.getParameter("to_member_no").trim());
						} catch (NumberFormatException e) {
							to_member_no = null;
							errorMsgs.add("�ж�J���T�����T�|���s��");
						}
				String message_content = req.getParameter("message_content").trim();
				if (message_content == null || message_content.trim().length() == 0) {
					message_content = "�V�O���@�w�|���\�A�����V�O�|�ܻ��P :)";
					errorMsgs.add("�T�����e�ФŪť�");
				}
				
				java.sql.Timestamp message_time = null;
				try {
					message_time = java.sql.Timestamp.valueOf(req.getParameter("message_time").trim());
				} catch (IllegalArgumentException e) {
					message_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J�I����!");
				}
				
				MessageVO messageVO = new MessageVO();
				messageVO.setMessage_no(message_no);
				messageVO.setFrom_member_no(from_member_no);
				messageVO.setTo_member_no(to_member_no);
				messageVO.setMessage_content(message_content);
				messageVO.setMessage_time(message_time);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("messageVO", messageVO); // �t����J�榡���~��messageVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/message/update_message_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}

				/***************************2.�}�l�ק���*****************************************/
				MessageService messageSvc = new MessageService();
				messageVO = messageSvc.updateMessage(message_no, from_member_no, to_member_no, message_content, message_time);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("messageVO", messageVO); // ��Ʈwupdate���\��,���T����messageVO����,�s�Jreq
				
				
				String url = "/front-end/message/listOneMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneMessage.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/message/update_message_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addMessage.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
//				Integer message_no =null;
//				try {
//					message_no = new Integer(req.getParameter("message_no").trim());
//				} catch (NumberFormatException e) {
//					message_no = 0;
//					errorMsgs.add("�ж�J���T�o�X�T�����|���s��");
//				}
//				�H�W����O�]��addXXX.jsp�S����user��Jmessage_no,�|������ȵL�k����
				Integer from_member_no = null;
				try {
				from_member_no = new Integer(req.getParameter("from_member_no").trim());
				} catch (NumberFormatException e) {
					from_member_no = 0;
					errorMsgs.add("�ж�J���T�o�X�T�����|���s��");
				}

				Integer to_member_no = null;
						try {
							to_member_no = new Integer(req.getParameter("to_member_no").trim());
						} catch (NumberFormatException e) {
							to_member_no = 0;
							errorMsgs.add("�ж�J���T����T�����|���s��");
						}

				String message_content = req.getParameter("message_content").trim();
				if (message_content == null || message_content.trim().length() == 0) {
					message_content = "�@�ӫK��Y�����A���A���Y�ĤG�Ӷ�?";
					errorMsgs.add("�T�����e�ФŪť�");
				}	
				
//				java.sql.Date message_time = null;
//				try {
//					message_time = java.sql.Date.valueOf(req.getParameter("message_time").trim());
//				} catch (IllegalArgumentException e) {
//					message_time=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
				
				MessageVO messageVO = new MessageVO();
				
				messageVO.setFrom_member_no(from_member_no);
				messageVO.setTo_member_no(to_member_no);
				messageVO.setMessage_content(message_content);
//				messageVO.setMessage_time(message_time);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("messageVO", messageVO); // �t����J�榡���~��messageVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/message/addMessage.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.�}�l�s�W���***************************************/
				MessageService messageSvc = new MessageService();
				messageVO = messageSvc.addMessage(from_member_no, to_member_no, message_content);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/front-end/message/listAllMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllMessage.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/message/addMessage.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { // �Ӧ�listAllMessage.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer message_no = new Integer(req.getParameter("message_no"));
				
				/***************************2.�}�l�R�����***************************************/
				MessageService messageSvc = new MessageService();
				messageSvc.deleteMessage(message_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/message/listAllMessage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/message/listAllMessage.jsp");
				failureView.forward(req, res);
			}	
		}
	}
}
