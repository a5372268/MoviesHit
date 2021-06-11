package com.food.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONException;
import org.json.JSONObject;

import com.food.model.FoodService;
import com.food.model.FoodVO;


@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodServlet() {
        super();
    }
    
  
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
				String str = req.getParameter("food_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�q�v�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer food_no = null;
				try {
					food_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�q�v�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				FoodService foodSvc = new FoodService();
				FoodVO foodVO = foodSvc.getOneFood(food_no);
				if (foodVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("foodVO", foodVO); // ��Ʈw���X��foodVO����,�s�Jreq
				String url = "/back-end/food/listOneFood.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllFood.jsp 

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
//			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j			
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer food_no = new Integer(req.getParameter("food_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				FoodService foodSvc = new FoodService();
				FoodVO foodVO = foodSvc.getOneFood(food_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("foodVO", foodVO); // ��Ʈw���X��foodVO����,�s�Jreq
				String url = "/back-end/food/update_food_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_food_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z************************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", "�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/listAllFood.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getPic".equals(action)) {
			
			Integer food_no = new Integer(req.getParameter("food_no").trim());
			FoodService foodSvc = new FoodService();
			FoodVO foodVO = foodSvc.getOneFood(food_no);
			byte[] food_pic = foodVO.getFood_pic();
			if(food_pic!= null) {
				res.getOutputStream().write(food_pic);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_food_input.jsp���ШD
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
//			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer food_no = new Integer(req.getParameter("food_no").trim());

				String food_name = req.getParameter("food_name");
				String food_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (food_name == null || food_name.trim().length() == 0) {
					errorMsgs.put("food_name","�\�I�W��: �ФŪť�");
				} else if(!food_name.trim().matches(food_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.put("food_name","�\�I�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb1��10����");
	            }
				
				
				String food_type = req.getParameter("food_type").trim();
				
				Integer food_price = null;
				try {
					food_price = new Integer(req.getParameter("food_price").trim());
				} catch (NumberFormatException e) {
					food_price = 0;
					errorMsgs.put("food_price","�\�I����ж�Ʀr.");
				}
				
				Part part = req.getPart("food_pic");
				InputStream in = part.getInputStream();
				byte[] food_pic = new byte[in.available()];
				if(in.available() == 0) {
					FoodService foodSvc = new FoodService();
					FoodVO foodVO = foodSvc.getOneFood(food_no);
					food_pic = foodVO.getFood_pic();
				}
				in.read(food_pic);
				in.close();

				String food_status = req.getParameter("food_status");

				FoodVO foodVO = new FoodVO();				
				foodVO.setFood_no(food_no);
				foodVO.setFood_name(food_name);
				foodVO.setFood_type(food_type);
				foodVO.setFood_pic(food_pic);
				foodVO.setFood_status(food_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("foodVO", foodVO); // �t����J�榡���~��foodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/update_food_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				FoodService foodSvc = new FoodService();
				foodVO = foodSvc.updateFood(food_no,food_name,food_type,food_price,food_pic,food_status);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/				
				req.setAttribute("foodVO", foodVO); // ��Ʈwupdate���\��,���T����foodVO����,�s�Jreq
				String url = "/back-end/food/listAllFood.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneFood.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", "�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/update_food_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addFood.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				String food_name = req.getParameter("food_name");
				String food_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (food_name == null || food_name.trim().length() == 0) {
					errorMsgs.add("�q�v�W��: �ФŪť�");
				} else if(!food_name.trim().matches(food_nameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�q�v�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb1��10����");
	            }
				
				
				String food_type = req.getParameter("food_type").trim();
				
				Integer food_price = null;
				try {
					food_price = new Integer(req.getParameter("food_price").trim());
				} catch (NumberFormatException e) {
					food_price = 0;
					errorMsgs.add("�\�I����ж�Ʀr.");
				}
				
				Part part = req.getPart("food_pic");
				InputStream in = part.getInputStream();
				byte[] food_pic = new byte[in.available()];
				in.read(food_pic);
				in.close();

				String food_status = req.getParameter("food_status");

				FoodVO foodVO = new FoodVO();				
				foodVO.setFood_name(food_name);
				foodVO.setFood_type(food_type);
				foodVO.setFood_price(food_price);
				foodVO.setFood_pic(food_pic);
				foodVO.setFood_status(food_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("foodVO", foodVO); // �t����J�榡���~��foodVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/addFood.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				FoodService foodSvc = new FoodService();
				foodVO = foodSvc.addFood(food_name,food_type,food_price,food_pic,food_status);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/food/listAllFood.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllFood.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/addFood.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer food_no = new Integer(req.getParameter("food_no"));
				
				/***************************2.�}�l�R�����***************************************/
				FoodService foodSvc = new FoodService();
				FoodVO foodVO = foodSvc.getOneFood(food_no);
				foodSvc.deleteFood(food_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
				String url = "/back-end/food/listAllFood.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/listAllFood.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("updateStatus".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();

			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer food_no = new Integer(req.getParameter("food_no"));
		
				/***************************2.�}�l�ק���***************************************/
				FoodService foodSvc = new FoodService();
				foodSvc.onOrDownFoodStatus(food_no);
				FoodVO foodVO = foodSvc.getOneFood(food_no);
				
				//�N�̷s�����A��^�h
				String newStatus=foodVO.getFood_status();
				JSONObject jsonobj = new JSONObject();
				try {
					jsonobj.put("newStatus", newStatus);
					out.print(jsonobj.toString());
					return;
				}catch(JSONException e) {
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)***********/
				String url = "/back-end/food/listAllFood2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/food/listAllFood.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
