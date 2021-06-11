package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;

//@WebServlet("/AccountActivate.do")

public class AccountActivate  extends HttpServlet {

		private static final long serialVersionUID = 1L;


		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=Big5");

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			List<String> successMsgs = new LinkedList<String>();
			req.setAttribute("successMsgs", successMsgs);

			
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String mb_email = req.getParameter("key1");
				String mb_emailReg = "^[(a-zA-Z0-9_)]{2,20}[@][(a-zA-Z0-9)]{3,10}[.][(a-zA-Z)]{1,5}$"; // ^�O�W�w�}�Y���᭱���r(not
																										// sure)
				if (mb_email == null || mb_email.trim().length() == 0) {
					errorMsgs.add("�|���H�c: �ФŪť�");
				} else if (!mb_email.trim().matches(mb_emailReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���H�c: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.accountActivate(mb_email);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jreq
				
				successMsgs.add("�b���ҥΦ��\! �Э��s�n�J");
				String url = "/front-end/mem/MemLogin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
				failureView.forward(req, res);
			}
		}
	}
