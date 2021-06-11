package com.ticket_type.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticket_type.model.Ticket_typeService;
import com.ticket_type.model.Ticket_typeVO;


public class Ticket_typeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ticket_typeServlet() {
        super();
    }
    
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
				String str = req.getParameter("ticket_type_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���ؽs��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer ticket_type_no = null;
				try {
					ticket_type_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���ؽs���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Ticket_typeService ticket_typeSvc = new Ticket_typeService();
				Ticket_typeVO ticket_typeVO = ticket_typeSvc.getOneTicket_type(ticket_type_no);
				if (ticket_typeVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("ticket_typeVO", ticket_typeVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/ticket_type/listOneTicket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ticket_type/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllTicket_type.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer ticket_type_no = new Integer(req.getParameter("ticket_type_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Ticket_typeService ticket_typeSvc = new Ticket_typeService();
				Ticket_typeVO ticket_typeVO = ticket_typeSvc.getOneTicket_type(ticket_type_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("ticket_typeVO", ticket_typeVO);         // ��Ʈw���X��ticket_typeVO����,�s�Jreq
				String url = "/back-end/ticket_type/update_ticket_type_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_ticket_type_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ticket_type/listAllTicket_type.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_ticket_type_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer ticket_type_no = new Integer(req.getParameter("ticket_type_no").trim());
				
				String ticket_type = req.getParameter("ticket_type");
				
				Integer ticket_price = null;
				try {
					ticket_price = new Integer(req.getParameter("ticket_price").trim());
				} catch (NumberFormatException e) {
					ticket_price = 0;
					errorMsgs.add("�����ж�Ʀr.");
				}

				String ticket_desc = req.getParameter("ticket_desc").trim();
				String ticket_descReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (ticket_desc == null || ticket_desc.trim().length() == 0) {
					errorMsgs.add("���ػ����ФŪť�");
				}else if(!ticket_desc.trim().matches(ticket_descReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���ػ���: �u��O����B�^��r���B�Ʀr,�B���ץ��ݬ�1~10");
				}

				Ticket_typeVO ticket_typeVO = new Ticket_typeVO();
				
				ticket_typeVO.setTicket_type_no(ticket_type_no);
				ticket_typeVO.setTicket_type(ticket_type);
				ticket_typeVO.setTicket_price(ticket_price);
				ticket_typeVO.setTicket_desc(ticket_desc);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ticket_typeVO", ticket_typeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ticket_type/update_ticket_type_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Ticket_typeService ticket_typeSvc = new Ticket_typeService();
				ticket_typeVO = ticket_typeSvc.updateTicket_type(ticket_type_no, ticket_type, ticket_price, ticket_desc);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("ticket_typeVO", ticket_typeVO); // ��Ʈwupdate���\��,���T����ticket_typeVO����,�s�Jreq
				String url = "/back-end/ticket_type/listAllTicket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ticket_type/update_ticket_type_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				
				String ticket_type = req.getParameter("ticket_type");
				System.out.println(ticket_type);
				
				Integer ticket_price = null;
				try {
					ticket_price = new Integer(req.getParameter("ticket_price").trim());
				} catch (NumberFormatException e) {
					ticket_price = 0;
					errorMsgs.add("�����ж�Ʀr.");
				}
				System.out.println(ticket_price);

				String ticket_desc = req.getParameter("ticket_desc").trim();
				String ticket_descReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (ticket_desc == null || ticket_desc.trim().length() == 0) {
					errorMsgs.add("���ػ����ФŪť�");
				}else if(!ticket_desc.trim().matches(ticket_descReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���ئW��: �u��O����B�^��r���B�Ʀr,�B���ץ��ݬ�1~10");
				}
				System.out.println(ticket_desc);

				Ticket_typeVO ticket_typeVO = new Ticket_typeVO();
				
				ticket_typeVO.setTicket_type(ticket_type);
				ticket_typeVO.setTicket_price(ticket_price);
				ticket_typeVO.setTicket_desc(ticket_desc);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ticket_typeVO", ticket_typeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ticket_type/addTicket_type.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Ticket_typeService ticket_typeSvc = new Ticket_typeService();
				ticket_typeVO = ticket_typeSvc.addTicket_type(ticket_type, ticket_price, ticket_desc);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/ticket_type/listAllTicket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTicket_type.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ticket_type/addTicket_type.jsp");
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
				Integer ticket_type_no = new Integer(req.getParameter("ticket_type_no"));
				
				/***************************2.�}�l�R�����***************************************/
				Ticket_typeService ticket_typeSvc = new Ticket_typeService();
				ticket_typeSvc.deleteTicket_type(ticket_type_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/ticket_type/listAllTicket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ticket_type/listAllTicket_type.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}
