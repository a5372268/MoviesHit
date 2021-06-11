package com.ord_food.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ord_food.model.Ord_foodService;
import com.ord_food.model.Ord_foodVO;


public class Ord_foodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ord_foodServlet() {
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
				String str1 = req.getParameter("order_no");
				
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer order_no = null;
				
				try {
					order_no = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("�q��s���榡�����T");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String str = req.getParameter("food_no");
				
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�\�I�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer food_no = null;
				try {
					food_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�\�I�s���榡�����T");
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Ord_foodService ord_foodSvc = new Ord_foodService();
				Ord_foodVO ord_foodVO = ord_foodSvc.getOneOrd_food(order_no, food_no);
				if (ord_foodVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("ord_foodVO", ord_foodVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/ord_food/listOneOrd_food.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no"));
				Integer food_no = new Integer(req.getParameter("food_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Ord_foodService ord_foodSvc = new Ord_foodService();
				Ord_foodVO ord_foodVO = ord_foodSvc.getOneOrd_food(order_no, food_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("ord_foodVO", ord_foodVO);         // ��Ʈw���X��ticket_typeVO����,�s�Jreq
				String url = "/back-end/ord_food/update_ord_food_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_ticket_type_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/listAllOrd_food.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no").trim());
				Integer food_no = new Integer(req.getParameter("food_no").trim());
				
				Integer food_count = null;
				try {
					food_count = new Integer(req.getParameter("food_count").trim());
				} catch (NumberFormatException e) {
					food_count = 0;
					errorMsgs.add("�\�I�ƶq�ж�Ʀr.");
				}
				
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("�\�I����ж�Ʀr.");
				}


				Ord_foodVO ord_foodVO = new Ord_foodVO();
				
				ord_foodVO.setOrder_no(order_no);
				ord_foodVO.setFood_no(food_no);
				ord_foodVO.setFood_count(food_count);
				ord_foodVO.setPrice(price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ord_foodVO", ord_foodVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/update_ord_food_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Ord_foodService ord_foodService = new Ord_foodService();
				ord_foodVO = ord_foodService.updateOrd_food(order_no, food_no, food_count, price);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("ord_foodVO", ord_foodVO); // ��Ʈwupdate���\��,���T����ticket_typeVO����,�s�Jreq
				String url = "/back-end/ord_food/listOneOrd_food.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/update_ord_food_input.jsp");
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
				String str1 = req.getParameter("order_no");
				
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer order_no = null;
				
				try {
					order_no = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("�\�I�s���榡�����T");
				}
				
				String str = req.getParameter("food_no");
				
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�\�I�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer food_no = null;
				try {
					food_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�\�I�s���榡�����T");
				}
				
				String str2 = req.getParameter("food_count");
				
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�п�J�\�I�ƶq");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer food_count = null;
				try {
					food_count = new Integer(str2);
				} catch (NumberFormatException e) {
					food_count = 0;
					errorMsgs.add("�\�I�ƶq�ж�Ʀr.");
				}
				
				String str3 = req.getParameter("price");
				
				if (str3 == null || (str3.trim()).length() == 0) {
					errorMsgs.add("�п�J�\�I����");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("�\�I����ж�Ʀr.");
				}

				Ord_foodVO ord_foodVO = new Ord_foodVO();
				
				ord_foodVO.setOrder_no(order_no);
				ord_foodVO.setFood_no(food_no);
				ord_foodVO.setFood_count(food_count);
				ord_foodVO.setPrice(price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ord_foodVO", ord_foodVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/addord_food.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Ord_foodService ord_foodSvc = new Ord_foodService();
				ord_foodVO = ord_foodSvc.addOrd_food(order_no, food_no, food_count, price);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/ord_food/listAllOrd_food.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTicket_type.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
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
				Integer order_no = new Integer(req.getParameter("order_no"));
				Integer food_no = new Integer(req.getParameter("food_no"));
				
				/***************************2.�}�l�R�����***************************************/
				Ord_foodService ord_foodService = new Ord_foodService();
				ord_foodService.deleteOrd_food(order_no, food_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/ord_food/listAllOrd_food.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/listAllOrd_food.jsp");
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
//				String str1 = req.getParameter("order_no");
				String str1 = "3";
				
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer order_no = null;
				
				try {
					order_no = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("�\�I�s���榡�����T");
				}
				
				String foodno[] = req.getParameterValues("food_no");
				String foodcount[] = req.getParameterValues("food_count");
				String foodprice[] = req.getParameterValues("food_price");
				System.out.println("foodno= " + foodno.length);
				System.out.println("foodcount= " + foodcount.length);
				System.out.println("foodprice= " + foodprice.length);
				
				Integer food_no = null;
				Integer food_count = null;
				Integer price = null;
				
				for(int i = 0; i < foodno.length; i++) {
					food_no = new Integer(foodno[i]);
					food_count = new Integer(foodcount[i]);
					price = new Integer(foodprice[i]) * food_count;
					System.out.println("food_no =" + food_no);
					System.out.println("food_count =" + food_count);
					System.out.println("food_price =" + foodprice[i]);
					System.out.println("price =" + price);
					
					Ord_foodVO ord_foodVO = new Ord_foodVO();
					ord_foodVO.setOrder_no(order_no);
					ord_foodVO.setFood_no(food_no);
					ord_foodVO.setFood_count(food_count);
					ord_foodVO.setPrice(price);
	
					Ord_foodService ord_foodSvc = new Ord_foodService();
					ord_foodVO = ord_foodSvc.addOrd_food(order_no, food_no, food_count, price);
				}
				
				
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/ord_food/listAllOrd_food.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTicket_type.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ord_food/addOrd_food.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}
