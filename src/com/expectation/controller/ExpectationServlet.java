package com.expectation.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.json.JSONException;
import org.json.JSONObject;

import com.expectation.model.*;
import com.movie.model.*;
import com.rating.model.RatingVO;

public class ExpectationServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str1 = req.getParameter("memberno");
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				
				String str2 = req.getParameter("movieno");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�п�J�q�v�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer memberno = null;
				try {
					memberno = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				
				Integer movieno = null;
				try {
					movieno = new Integer(str2);
				} catch (Exception e) {
					errorMsgs.add("�q�v�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				ExpectationService expectationSvc = new ExpectationService();
				ExpectationVO expectationVO = expectationSvc.getOneExpectation(memberno,movieno);
				if (expectationVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("expectationVO", expectationVO); // ��Ʈw���X��expectationVO����,�s�Jreq
				String url = "/front-end/expectation/listOneExpectation.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneExpectation.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/index.jsp");
				failureView.forward(req, res);
			}
		}
		
		
//		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp ���ШD
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
//			
//			try {
//				/***************************1.�����ШD�Ѽ�****************************************/
//				Integer memberno = new Integer(req.getParameter("memberno"));
//				Integer movieno = new Integer(req.getParameter("movieno"));
//				
//				/***************************2.�}�l�d�߸��****************************************/
//				ExpectationService expectationSvc = new ExpectationService();
//				ExpectationVO expectationVO = expectationSvc.getOneExpectation(memberno,movieno);
//								
//				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
//				req.setAttribute("expectationVO", expectationVO); // ��Ʈw���X��expectationVO����,�s�Jreq
//				String url = "/front-end/expectation/update_expectation_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_expectation_input.jsp
//				successView.forward(req, res);
//
//				/***************************��L�i�઺���~�B�z************************************/
//			} catch (Exception e) {
//				errorMsgs.add("�ק��ƨ��X�ɥ���:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher(requestURL);
//				failureView.forward(req, res);
//			}
//		}
//		
//		
//		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
//		
//			try {
//				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//				Integer memberno = new Integer(req.getParameter("memberno").trim());
//				
//				Integer movieno = new Integer(req.getParameter("movieno").trim());
//				
//				Double expectation = new Double(req.getParameter("expectation").trim());
//
//				ExpectationVO expectationVO = new ExpectationVO();
//				expectationVO.setMemberno(memberno);
//				expectationVO.setMovieno(movieno);
//				expectationVO.setExpectation(expectation);				
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("expectationVO", expectationVO); // �t����J�榡���~��expectationVO����,�]�s�Jreq
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/expectation/update_expectation_input.jsp");
//					failureView.forward(req, res);
//					return; //�{�����_
//				}
//				
//				/***************************2.�}�l�ק���*****************************************/
//				ExpectationService expectationSvc = new ExpectationService();
//				expectationVO = expectationSvc.updateExpectationAndUpdateMovieExpectation(memberno, movieno, expectation);
//				
//				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/				
////				DeptService deptSvc = new DeptService();
////				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
////					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(deptno)); // ��Ʈw���X��list����,�s�Jrequest
//
//                String url = requestURL;
//				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
//				successView.forward(req, res);
//
//				/***************************��L�i�઺���~�B�z*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/expectation/update_expectation_input.jsp");
//				failureView.forward(req, res);
//			}
//		}

        if ("insertOrUpdate".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			
			String requestURL = req.getParameter("requestURL");
			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/

				Integer memberno = new Integer(req.getParameter("memberno").trim());
				
				Integer movieno = new Integer(req.getParameter("movieno").trim());
				
				Double expectation = new Double(req.getParameter("expectation").trim());
				
//				ExpectationVO expectationVO = new ExpectationVO();
//				expectationVO.setMemberno(memberno);
//				expectationVO.setMovieno(movieno);
//				expectationVO.setExpectation(expectation);	

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("expectationVO", expectationVO); // �t����J�榡���~��empVO����,�]�s�Jreq
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/expectation/addExpectation.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				/***************************2.�}�l�s�W���***************************************/
				ExpectationService expectationSvc = new ExpectationService();
//				expectationVO = expectationSvc.insertOrUpdateExpectationAndUpdateMovieExpectation(memberno , movieno , expectation);
				expectationSvc.insertOrUpdateExpectationAndUpdateMovieExpectation(memberno , movieno , expectation);
				ExpectationVO expectationVO = expectationSvc.getThisMovieToatalExpectation(movieno);
				
				//�N�쥻��movievo��^�h
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				if (movieVO == null) {
					errorMsgs.add("�d�L���");
				}
				req.setAttribute("movieVO", movieVO);
				
				//�N�̷s�����ݫץ�^�h
				double newExpectation=movieVO.getExpectation();
				double countExpectation = expectationVO.getExpectation();
				JSONObject jsonobj = new JSONObject();
				try {
					jsonobj.put("newExpectation", newExpectation);
					jsonobj.put("countExpectation", countExpectation);
					out.print(jsonobj.toString());
					return;
				}catch(JSONException e) {
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}

				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/expectation/addExpectation.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j

			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer memberno = new Integer(req.getParameter("memberno").trim());
				
				Integer movieno = new Integer(req.getParameter("movieno").trim());
				
				/***************************2.�}�l�R�����***************************************/
				ExpectationService expectationSvc = new ExpectationService();
//				ExpectationVO expectationVO = expectationSvc.getOneExpectation(memberno,movieno);
				expectationSvc.deleteExpectation(memberno,movieno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
//				DeptService deptSvc = new DeptService();
//				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
//					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
}
