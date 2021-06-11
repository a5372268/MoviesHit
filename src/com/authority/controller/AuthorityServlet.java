package com.authority.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.authority.model.AuthorityService;
import com.authority.model.AuthorityVO;

public class AuthorityServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOneEmp_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("empno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				AuthorityService authoritySvc = new AuthorityService();
				List<AuthorityVO> authorityVO = authoritySvc.getOneAuthorityByEmpNo(empno);
				if (authorityVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("authorityVO", authorityVO); // ��Ʈw���X��authorityVO����,�s�Jreq
				String url = "/back-end/authority/listOneAuthority.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneAuthority.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("empno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				
				String str4 = req.getParameter("function_no");
				if (str4 == null || (str4.trim()).length() == 0) {
					errorMsgs.add("�п�J�\��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer function_no = null;
				try {
					function_no = new Integer(str4);
				} catch (Exception e) {
					errorMsgs.add("�\��s���榡�����T");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				AuthorityService authoritySvc = new AuthorityService();
				AuthorityVO authorityVO = authoritySvc.getOneAuthorityByEmpNo_Function_no(empno, function_no);
				if (authorityVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("authorityVO", authorityVO); // ��Ʈw���X��authorityVO����,�s�Jreq
				String url = "/back-end/authority/listOneAuthority.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneAuthority.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer empno = new Integer(req.getParameter("empno"));
				Integer function_no = new Integer(req.getParameter("function_no"));
				

				/*************************** 2.�}�l�d�߸�� ****************************************/
				AuthorityService authoritySvc = new AuthorityService();
				AuthorityVO authorityVO = authoritySvc.getOneAuthorityByEmpNo_Function_no(empno, function_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("authorityVO", authorityVO); // ��Ʈw���X��authorityVO����,�s�Jreq
				String url = "/back-end/authority/update_authority_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_authority_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/listAllAuthority.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_authority_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				Integer empno = new Integer(req.getParameter("empno").trim());
				
				Integer function_no = new Integer(req.getParameter("function_no").trim());
				String str2= Integer.toString(function_no);
				String function_noReg = "^[0-9]{1,3}$";
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�\��s���ФŪť�");
				} else if (!str2.trim().matches(function_noReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\��s���u��O�Ʀr, �B�ƭȥ����p��999");
				}
				
				String auth_status = req.getParameter("auth_status").trim();
				if (auth_status == null || auth_status.trim().length() == 0) {
					errorMsgs.add("�v�����A�ФŪť�");
				}
				
				
				AuthorityVO authorityVO = new AuthorityVO();
				authorityVO.setEmpno(empno);
				authorityVO.setFunction_no(function_no);
				authorityVO.setAuth_status(auth_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("authorityVO", authorityVO); // �t����J�榡���~��authorityVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/update_authority_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				AuthorityService authoritySvc = new AuthorityService();
				authorityVO = authoritySvc.updateAuthority(empno, function_no, auth_status);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("authorityVO", authorityVO); // ��Ʈwupdate���\��,���T����authorityVO����,�s�Jreq
				String url = "/back-end/authority/listOneAuthority.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneAuthority.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/update_authority_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // �Ӧ�addAuthority.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				
				Integer empno = new Integer(req.getParameter("empno").trim());
				String str3= Integer.toString(empno);
				String empnoReg = "^[0-9]{1,2}$";
				if (str3 == null || (str3.trim()).length() == 0) {
					errorMsgs.add("���u�s���ФŪť�");
				} else if (!str3.trim().matches(empnoReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���u�s���u��O�Ʀr, �B�ƭȥ����p��99");
				}
				
				Integer function_no = new Integer(req.getParameter("function_no").trim());
				String str2= Integer.toString(function_no);
				String function_noReg = "^[0-9]{1,3}$";
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�\��s���ФŪť�");
				} else if (!str2.trim().matches(function_noReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\��s���u��O�Ʀr, �B�ƭȥ����p��999");
				}
				
				String auth_status = req.getParameter("auth_status").trim();
				if (auth_status == null || auth_status.trim().length() == 0) {
					errorMsgs.add("�v�����A�ФŪť�");
				}
				
				AuthorityVO authorityVO = new AuthorityVO();
				authorityVO.setEmpno(empno);
				authorityVO.setFunction_no(function_no);
				authorityVO.setAuth_status(auth_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("authorityVO", authorityVO); // �t����J�榡���~��authorityVO����,�]�s�Jreq�C�x�s���L����ơA�Y��J���~���έ��s��J
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/addAuthority.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				AuthorityService authoritySvc = new AuthorityService();
				authorityVO = authoritySvc.addAuthority(empno, function_no, auth_status);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/back-end/authority/listAllAuthority.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllAuthority.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/addAuthority.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // �Ӧ�listAllAuthority.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				Integer empno = new Integer(req.getParameter("empno"));
				Integer function_no = new Integer(req.getParameter("function_no"));

				/*************************** 2.�}�l�R����� ***************************************/
				AuthorityService authoritySvc = new AuthorityService();
				authoritySvc.deleteAuthority(empno,function_no);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/back-end/authority/listAllAuthority.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/authority/listAllAuthority.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
