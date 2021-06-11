package com.ord_ticket_type.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ord_ticket_type.model.Ord_ticket_typeService;
import com.ord_ticket_type.model.Ord_ticket_typeVO;


public class Ord_ticket_typeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ord_ticket_typeServlet() {
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
							.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer ticket_type_no = null;
				try {
					ticket_type_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���ؽs���榡�����T");
				}
				
				String str1 = req.getParameter("order_no");
				
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer order_no = null;
				
				try {
					order_no = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("���ؽs���榡�����T");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Ord_ticket_typeService ord_ticket_typeSvc = new Ord_ticket_typeService();
				Ord_ticket_typeVO ord_ticket_typeVO = ord_ticket_typeSvc.getOneOrd_ticket_type(ticket_type_no, order_no);
				if (ord_ticket_typeVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("ord_ticket_typeVO", ord_ticket_typeVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/ord_ticket_type/listOneOrd_ticket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Ord_ticket_typeService ord_ticket_typeSvc = new Ord_ticket_typeService();
				Ord_ticket_typeVO ord_ticket_typeVO = ord_ticket_typeSvc.getOneOrd_ticket_type(ticket_type_no, order_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("ord_ticket_typeVO", ord_ticket_typeVO);         // ��Ʈw���X��ticket_typeVO����,�s�Jreq
				String url = "/back-end/ord_ticket_type/update_ord_ticket_type_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_ticket_type_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_ticket_type/listAllOrd_ticket_type.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no").trim());
				
				Integer ticket_count = null;
				try {
					ticket_count = new Integer(req.getParameter("ticket_count").trim());
				} catch (NumberFormatException e) {
					ticket_count = 0;
					errorMsgs.add("�����ж�Ʀr.");
				}
				
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("�����ж�Ʀr.");
				}


				Ord_ticket_typeVO ord_ticket_typeVO = new Ord_ticket_typeVO();
				
				ord_ticket_typeVO.setTicket_type_no(ticket_type_no);
				ord_ticket_typeVO.setOrder_no(order_no);
				ord_ticket_typeVO.setTicket_count(ticket_count);
				ord_ticket_typeVO.setPrice(price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ord_ticket_typeVO", ord_ticket_typeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/update_ord_ticket_type_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Ord_ticket_typeService ord_ticket_typeService = new Ord_ticket_typeService();
				ord_ticket_typeVO = ord_ticket_typeService.updateOrd_ticket_type(ticket_type_no, order_no, ticket_count, price);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("ord_ticket_typeVO", ord_ticket_typeVO); // ��Ʈwupdate���\��,���T����ticket_typeVO����,�s�Jreq
				String url = "/back-end/ord_ticket_type/listOneOrd_ticket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_ticket_type/update_ord_ticket_type_input.jsp");
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
				String str = req.getParameter("ticket_type_no");
				
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���ؽs��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer ticket_type_no = null;
				try {
					ticket_type_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���ؽs���榡�����T");
				}
				
				String str1 = req.getParameter("order_no");
				
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/addOrd_ticket_type.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer order_no = null;
				
				try {
					order_no = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("���ؽs���榡�����T");
				}
				
				String str2 = req.getParameter("ticket_count");
				
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/addOrd_ticket_type.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer ticket_count = null;
				try {
					ticket_count = new Integer(str2);
				} catch (NumberFormatException e) {
					ticket_count = 0;
					errorMsgs.add("�ƶq�ж�Ʀr.");
				}
				
				String str3 = req.getParameter("price");
				
				if (str3 == null || (str3.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/addOrd_ticket_type.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("�����ж�Ʀr.");
				}

				Ord_ticket_typeVO ord_ticket_typeVO = new Ord_ticket_typeVO();
				
				ord_ticket_typeVO.setTicket_type_no(ticket_type_no);
				ord_ticket_typeVO.setOrder_no(order_no);
				ord_ticket_typeVO.setTicket_count(ticket_count);
				ord_ticket_typeVO.setPrice(price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ord_ticket_typeVO", ord_ticket_typeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/addord_ticket_type.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Ord_ticket_typeService ord_ticket_typeSvc = new Ord_ticket_typeService();
				ord_ticket_typeVO = ord_ticket_typeSvc.addOrd_ticket_type(ticket_type_no, order_no, ticket_count, price);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/ord_ticket_type/listAllOrd_ticket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTicket_type.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_ticket_type/addOrd_ticket_type.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no"));
				
				/***************************2.�}�l�R�����***************************************/
				Ord_ticket_typeService ord_ticket_typeService = new Ord_ticket_typeService();
				ord_ticket_typeService.deleteOrd_ticket_type(ticket_type_no, order_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/ord_ticket_type/listAllOrd_ticket_type.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_ticket_type/listAllOrd_ticket_type.jsp");
				failureView.forward(req, res);
			}
		}
		
		  if ("insert2".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//					String str1 = req.getParameter("order_no");
					
//					if (str1 == null || (str1.trim()).length() == 0) {
//						errorMsgs.add("�п�J�q��s��");
//					}
					
					Integer order_no = 5;
					
//					try {
//						order_no = new Integer(str1);
//					} catch (Exception e) {
//						errorMsgs.add("�\�I�s���榡�����T");
//					}
					
					String ticket_typeno[] = req.getParameterValues("ticket_type_no");
					String ticketcount[] = req.getParameterValues("ticket_count");
					String ticketprice[] = req.getParameterValues("ticket_price");
					
					System.out.println("ticket_typeno= " + ticket_typeno.length);
					System.out.println("ticketType= " + ticketcount.length);
					System.out.println("ticketprice= " + ticketprice.length);
					
					Integer ticket_type_no = null;
					Integer ticket_count = null;
					Integer price = null;
					
					for(int i = 0; i < ticket_typeno.length; i++) {
						ticket_type_no = new Integer(ticket_typeno[i]);
						ticket_count = new Integer(ticketcount[i]);
						price = new Integer(ticketprice[i]) * ticket_count;
						System.out.println("ticket_type_no = " + ticket_type_no);
						System.out.println("ticket_count = " + ticket_count);
						System.out.println("ticketprice = " + ticketprice[i]);
						System.out.println("price = " + price);
						System.out.println("order_no = " + order_no);
						
						Ord_ticket_typeVO ord_ticket_typeVO = new Ord_ticket_typeVO();
//						ord_ticket_typeVO.setOrder_no(order_no);
//						ord_ticket_typeVO.setTicket_type_no(ticket_type_no);
//						ord_ticket_typeVO.setTicket_count(ticket_count);
//						ord_ticket_typeVO.setPrice(price);
		
						Ord_ticket_typeService ord_ticket_typeSvc = new Ord_ticket_typeService();
						ord_ticket_typeVO = ord_ticket_typeSvc.addOrd_ticket_type(ticket_type_no, order_no, ticket_count, price);
						System.out.println("ticket_type_no =" + ord_ticket_typeVO.getTicket_type_no() + "ticket_count = " + ord_ticket_typeVO.getTicket_count() +
								"price = " + ord_ticket_typeVO.getPrice() + "order_no = " + ord_ticket_typeVO.getOrder_no());
					
					}
					
					
					
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
					String url = "/back-end/ord_ticket_type/listAllOrd_ticket_type.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTicket_type.jsp
					successView.forward(req, res);				
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_ticket_type/addOrd_ticket_type.jsp");
					failureView.forward(req, res);
				}
			}
			
		}
		
		
	}

