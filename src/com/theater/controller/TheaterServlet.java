package com.theater.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.theater.model.TheaterService;
import com.theater.model.TheaterVO;

public class TheaterServlet extends HttpServlet {

    public TheaterServlet() {
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
				String str = req.getParameter("theater_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�U�|�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/theater/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer theater_no = null;
				try {
					theater_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�U�|�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/theater/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				TheaterService theaterSvc = new TheaterService();
				TheaterVO theaterVO = theaterSvc.getOneTheater(theater_no);
				if (theaterVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/theater/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("theaterVO", theaterVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/theater/listOneTheater.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/theater/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllTheater.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer theater_no = new Integer(req.getParameter("theater_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				TheaterService theaterSvc = new TheaterService();
				TheaterVO theaterVO = theaterSvc.getOneTheater(theater_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("theaterVO", theaterVO);         // ��Ʈw���X��theaterVO����,�s�Jreq
				String url = "/back-end/theater/update_theater_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_theater_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/theater/listAllTheater.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_theater_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer theater_no = new Integer(req.getParameter("theater_no").trim());
				
				String theater_name = req.getParameter("theater_name");
				String theater_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,5}$";
				if (theater_name == null || theater_name.trim().length() == 0) {
					errorMsgs.add("�U�|�W��: �ФŪť�");
				} else if(!theater_name.trim().matches(theater_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�U�|�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				String theater_type = req.getParameter("theater_type");
				String theater_typeReg = "^[(0-9)]{1}$";
				if (theater_type == null || theater_type.trim().length() == 0) {
					errorMsgs.add("�U�|����: �ФŪť�");
				} else if(!theater_type.trim().matches(theater_typeReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�U�|����: 0~9���Ʀr,�B���ץ��ݬ�1");
	            }
				
				String s[] = req.getParameterValues("seat_no");
				String seat_no = "";
				for(int i = 0; i < s.length; i++) {
					seat_no = seat_no + s[i];
				}
				
				
//				String seat_noReg = "^[(0-1)]{400}$";
//				if (seat_no == null || seat_no.trim().length() == 0) {
//					errorMsgs.add("�U�|�t�m�ФŪť�");
//				}else if(!seat_no.trim().matches(seat_noReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
//					errorMsgs.add("�U�|�t�m: 0~1���Ʀr,�B���ץ��ݬ�400");
//				}
				
				String seat_name = req.getParameter("seat_name").trim();
				String seat_nameReg = "^[(a-zA-Z0-9)]{1200}$";
				if (seat_name == null || seat_no.trim().length() == 0) {
					errorMsgs.add("�y��W�ٽФŪť�");
				}else if(!seat_name.trim().matches(seat_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�y��W��: �u��O�^��r���B�Ʀr,�B���ץ��ݬ�1200");
				}

				TheaterVO theaterVO = new TheaterVO();
				
				theaterVO.setTheater_no(theater_no);
				theaterVO.setTheater_name(theater_name);
				theaterVO.setTheater_type(theater_type);
				theaterVO.setSeat_no(seat_no);
				theaterVO.setSeat_name(seat_name);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("theaterVO", theaterVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/theater/update_theater_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				TheaterService theaterSvc = new TheaterService();
				theaterVO = theaterSvc.updateTheater(theater_no, theater_name, theater_type, seat_no, seat_name);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("theaterVO", theaterVO); // ��Ʈwupdate���\��,���T����theaterVO����,�s�Jreq
				String url = "/back-end/theater/listAllTheater.jsp?whichPage=9999";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/theater/update_theater_input.jsp");
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
				String theater_name = req.getParameter("theater_name");
				System.out.println("theater_name" + theater_name);
				String theater_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,5}$";
				if (theater_name == null || theater_name.trim().length() == 0) {
					errorMsgs.add("�U�|�W��: �ФŪť�");
				} else if(!theater_name.trim().matches(theater_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�U�|�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				String theater_type = req.getParameter("theater_type");
				String theater_typeReg = "^[(0-9)]{1}$";
				if (theater_type == null || theater_type.trim().length() == 0) {
					errorMsgs.add("�U�|����: �ФŪť�");
				} else if(!theater_type.trim().matches(theater_typeReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�U�|����: 0~9���Ʀr,�B���ץ��ݬ�1");
	            }
				System.out.println("theater_type" + theater_type);
				
//				String seat_no = req.getParameter("seat_no").trim();
//				String seat_noReg = "^[(0-1)]{400}$";
//				if (seat_no == null || seat_no.trim().length() == 0) {
//					errorMsgs.add("�U�|�t�m�ФŪť�");
//				}else if(!seat_no.trim().matches(seat_noReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
//					errorMsgs.add("�U�|�t�m: 0~1���Ʀr,�B���ץ��ݬ�400");
//				}
				String s[] = req.getParameterValues("seat_no");
				String seat_no = "";
				for(int i = 0; i < s.length; i++) {
					seat_no = seat_no + s[i];
				}
				
				String seat_name = req.getParameter("seat_name").trim();
				String seat_nameReg = "^[(a-zA-Z0-9)]{1200}$";
				if (seat_name == null || seat_name.trim().length() == 0) {
					errorMsgs.add("�y��W�ٽФŪť�");
				}else if(!seat_name.trim().matches(seat_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�y��W��: �u��O�^��r���B�Ʀr,�B���ץ��ݬ�1200");
				}

				TheaterVO theaterVO = new TheaterVO();
				
				theaterVO.setTheater_name(theater_name);
				theaterVO.setTheater_type(theater_type);
				theaterVO.setSeat_no(seat_no);
				theaterVO.setSeat_name(seat_name);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("theaterVO", theaterVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/theater/addTheater.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�s�W���***************************************/
				TheaterService theaterSvc = new TheaterService();
				theaterVO = theaterSvc.addTheater(theater_name, theater_type, seat_no, seat_name);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/theater/listAllTheater.jsp?whichPage=999";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTheater.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/theater/addTheater.jsp");
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
				Integer theater_no = new Integer(req.getParameter("theater_no"));
				
				/***************************2.�}�l�R�����***************************************/
				TheaterService theaterSvc = new TheaterService();
				theaterSvc.deleteTheater(theater_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/theater/listAllTheater.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/theater/listAllTheater.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Theater".equals(action)) {
			
			try {
				Integer theater_no = new Integer(req.getParameter("theater_no"));
				
				TheaterService theaterSvc = new TheaterService();
				TheaterVO theaterVO = theaterSvc.getOneTheater(theater_no);
				
				req.setAttribute("theaterVO", theaterVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/theater/listAllTheater.jsp");
				successView.forward(req, res);
				return;
				
			}catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
	}
}
