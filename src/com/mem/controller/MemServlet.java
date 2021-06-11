package com.mem.controller;

import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mem.model.MemDAO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.mem.model.SendEmail;
import com.relationship.model.RelationshipVO;

import imageUtil.ImageUtil;

import java.util.*;

import security.SecureUtils;

import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/MemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemServlet() {

	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=Big5");
		InputStream in = null;
		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			List<String> successMsgs = new LinkedList<String>();
			req.setAttribute("successMsgs", successMsgs);

			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				String mb_name = req.getParameter("mb_name");
				String mb_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_name == null || mb_name.trim().length() == 0) {
					errorMsgs.add("�|���m�W: �ФŪť�");
				} else if (!mb_name.trim().matches(mb_nameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}

				String mb_email = req.getParameter("mb_email");
				String mb_emailReg = "^[(a-zA-Z0-9_)]{2,20}[@][(a-zA-Z0-9)]{3,10}[.][(a-zA-Z)]{1,5}$"; // ^�O�W�w�}�Y���᭱���r(not
																										// sure)
				if (mb_email == null || mb_email.trim().length() == 0) {
					errorMsgs.add("�|���H�c: �ФŪť�");
				} else if (!mb_email.trim().matches(mb_emailReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���H�c: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				String mb_pwd = req.getParameter("mb_pwd");
				String mb_pwdReg = "^[(a-zA-Z0-9_)]{2,20}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_pwd == null || mb_pwd.trim().length() == 0) {
					errorMsgs.add("�|���K�X: �ФŪť�");
				} else if (!mb_pwd.trim().matches(mb_pwdReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���K�X: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				java.sql.Date mb_bd = null;
				try {
					mb_bd = java.sql.Date.valueOf(req.getParameter("mb_bd").trim());
				} catch (IllegalArgumentException e) {
					mb_bd = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���");
				}

				String mb_phone = req.getParameter("mb_phone");
				String mb_phoneReg = "^[(0-9)]{2,10}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_phone == null || mb_phone.trim().length() == 0) {
					errorMsgs.add("�|���q��: �ФŪť�");
				} else if (!mb_phone.trim().matches(mb_phoneReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���q�ܥu��O�Ʀr�B�̪�10���");
				}

				String city = req.getParameter("city");
				String area = req.getParameter("area");
				String mb_city = (city + area).trim();

				String mb_address = req.getParameter("mb_address");
				String mb_addressReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_address == null || mb_address.trim().length() == 0) {
					errorMsgs.add("�|���a�}: �ФŪť�");
				} else if (!mb_address.trim().matches(mb_addressReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���a�}: �u��O���B�^��B�Ʀr, �B���ץ��ݦb2��30����");
				}

				Part part = req.getPart("mb_pic");
				in = part.getInputStream();
				byte[] mb_pic = new byte[in.available()];
				in.read(mb_pic);
				in.close();

				MemVO memVO = new MemVO();
				memVO.setMb_name(mb_name);
				memVO.setMb_email(mb_email);
				memVO.setMb_pwd(mb_pwd);
				memVO.setMb_bd(mb_bd);
				memVO.setMb_phone(mb_phone);
				memVO.setMb_city(mb_city);
				memVO.setMb_address(mb_address);
				memVO.setMb_pic(mb_pic);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
					failureView.forward(req, res);
					return; // return�i�g�i���g
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.emailCheck(mb_email);
				memVO = memSvc.addMem(mb_name, mb_email, mb_pwd, mb_bd, mb_pic, mb_phone, mb_city, mb_address);
				if (memVO != null) {
					SendEmail mailService = new SendEmail();
					mailService.sendMail(mb_email);
//					System.out.println(mb_email);
				}

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				successMsgs.add("�b�����U���\! �ЦܫH�c�I��s���H�ҥαb���C");
				String url = "/front-end/mem/MemLogin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
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
				String str = req.getParameter("member_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer member_no = null;
				try {
					member_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(member_no);
				if (memVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/mem/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/select_page.jsp");
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
				Integer member_no = new Integer(req.getParameter("member_no"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(member_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/front-end/mem/memberInfo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer member_no = new Integer(req.getParameter("member_no").trim());

				String mb_name = req.getParameter("mb_name");
				String mb_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_name == null || mb_name.trim().length() == 0) {
					errorMsgs.add("�|���m�W: �ФŪť�");
				} else if (!mb_name.trim().matches(mb_nameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}

				String mb_email = req.getParameter("mb_email");
				String mb_emailReg = "^[(a-zA-Z0-9_)]{2,20}[@][(a-zA-Z0-9)]{3,10}[.][(a-zA-Z)]{1,5}$"; // ^�O�W�w�}�Y���᭱���r(not
																										// sure)
				if (mb_email == null || mb_email.trim().length() == 0) {
					errorMsgs.add("�|���H�c: �ФŪť�");
				} else if (!mb_email.trim().matches(mb_emailReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���H�c: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				String mb_pwd = req.getParameter("mb_pwd");
				String mb_pwdReg = "^[(a-zA-Z0-9_)]{2,20}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_pwd == null || mb_pwd.trim().length() == 0) {
					errorMsgs.add("�|���K�X: �ФŪť�");
				} else if (!mb_pwd.trim().matches(mb_pwdReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���K�X: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				java.sql.Date mb_bd = null;
				try {
					mb_bd = java.sql.Date.valueOf(req.getParameter("mb_bd").trim());
				} catch (IllegalArgumentException e) {
					mb_bd = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���");
				}

				String mb_phone = req.getParameter("mb_phone");
				String mb_phoneReg = "^[(a-zA-Z0-9_)]{2,20}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_phone == null || mb_phone.trim().length() == 0) {
					errorMsgs.add("�|���q��: �ФŪť�");
				} else if (!mb_phone.trim().matches(mb_phoneReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���q��: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				String city = req.getParameter("city");
				String area = req.getParameter("area");
				String mb_city = city + area;
				System.out.println(mb_city);
				String mb_cityReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,20}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_city == null || mb_city.trim().length() == 0) {
					errorMsgs.add("�|������: �ФŪť�");
				} else if (!mb_city.trim().matches(mb_cityReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|������: �u��O���B�^��B�Ʀr, �B���ץ��ݦb2��10����");
				}

				String mb_address = req.getParameter("mb_address");
				String mb_addressReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,30}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_address == null || mb_address.trim().length() == 0) {
					errorMsgs.add("�|���a�}: �ФŪť�");
				} else if (!mb_address.trim().matches(mb_addressReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���a�}: �u��O���B�^��B�Ʀr, �B���ץ��ݦb2��30����");
				}

				String status = req.getParameter("status");

				int mb_point = Integer.parseInt(req.getParameter("mb_point"));

				String mb_level = req.getParameter("mb_level");

				java.sql.Date crt_dt = null;
				try {
					crt_dt = java.sql.Date.valueOf(req.getParameter("crt_dt").trim());
				} catch (IllegalArgumentException e) {
					crt_dt = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���");
				}

				Part part = req.getPart("mb_pic");
				System.out.println(part.getContentType());
				in = part.getInputStream();
				byte[] mb_pic = new byte[in.available()];
				in.read(mb_pic);
				in.close();

				MemVO memVO = new MemVO();
				memVO.setMember_no(member_no);
				memVO.setMb_name(mb_name);
				memVO.setMb_email(mb_email);
				memVO.setMb_pwd(mb_pwd);
				memVO.setMb_bd(mb_bd);
				memVO.setMb_pic(mb_pic);
				memVO.setMb_phone(mb_phone);
				memVO.setMb_city(mb_city);
				memVO.setStatus(status);
				memVO.setMb_point(mb_point);
				memVO.setMb_level(mb_level);
				memVO.setCrt_dt(crt_dt);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/update_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(member_no, mb_name, mb_email, mb_pwd, mb_bd, mb_pic, mb_phone, mb_city,
						mb_address, status, mb_point, mb_level, crt_dt);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				req.setAttribute("memVO", memVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/back-end/mem/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/update_mem.jsp");
				failureView.forward(req, res);
			}
		}
		if ("update_member".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			PrintWriter out = res.getWriter();
			try {
				String mb_name = req.getParameter("mb_name").trim();
				String mb_bd_str = req.getParameter("mb_bd").trim();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date mb_bd = new Date(df.parse(mb_bd_str).getTime());
				String mb_phone = req.getParameter("mb_phone").trim();
				String mb_city = req.getParameter("mb_city").trim();
				String mb_address = req.getParameter("mb_address").trim();
				int mb_no = new Integer(req.getParameter("mb_no").trim());
				Part part = req.getPart("mb_pic");
				MemService memberSvc = new MemService();
				if (part.getContentType() != null && part.getContentType().indexOf("image") >= 0) {
					in = req.getPart("mb_pic").getInputStream();
					byte[] mb_pic = new byte[in.available()];
					in.read(mb_pic);
					memberSvc.updateMemPic(mb_no, mb_pic);
				}

				memberSvc.forontUpdateMem(mb_no, mb_name, mb_bd, mb_phone, mb_city, mb_address);
				if (req.getSession().getAttribute("member") != null) {
					MemVO member = memberSvc.getOneMem(mb_no);
					req.getSession().setAttribute("member", member);
				}
				out.print("success");
			} catch (Exception e) {
				e.printStackTrace();
				out.print("fail");
			}
		}

		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				Integer member_no = new Integer(req.getParameter("member_no"));

				/*************************** 2.�}�l�R����� ***************************************/
				MemService memSvc = new MemService();
				memSvc.deleteMem(member_no);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/back-end/mem/listAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("view_memPic".equals(action)) {
			res.setContentType("image/gif, image/jpeg, image/png, image/jpg");
			Integer member_no = new Integer(req.getParameter("member_no"));

			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOnePic(member_no);
			byte[] mb_pic = memVO.getMb_pic();
			if (mb_pic != null) {
				mb_pic=ImageUtil.shrink(mb_pic,200);
				res.getOutputStream().write(mb_pic);
			} else {
				in = req.getServletContext().getResourceAsStream("/img/none.jpg");
				byte[] pic = new byte[in.available()];
				in.read(pic);
				res.getOutputStream().write(pic);
				in.close();
			}
		}

		if ("ajaxGetCityArea".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			PrintWriter out = res.getWriter();
			Integer member_no = new Integer(req.getParameter("member_no"));
			MemService memSvc = new MemService();
			String str = memSvc.getOneMem(member_no).getMb_city();
			String city = str.substring(0, 3);
			String area = str.substring(3);
			JSONObject cityarea = new JSONObject();
			try {
				cityarea.put("city", city);
				cityarea.put("area", area);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(cityarea.toString());

		}

		if ("email_confirm".equals(action)) {
			PrintWriter out = res.getWriter();
			try {
				String email = req.getParameter("email").trim();
				MemService memberSvc = new MemService();
				List<MemVO> members = memberSvc.getAll();
				for (MemVO member : members) {
					if (email.equals(member.getMb_email())) {
						res.setContentType("text; charset=utf-8");
						out.print("used");
						return;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.print("fail");
			}
		}

		if ("update_picture".equals(action)) {
			PrintWriter out = res.getWriter();
			try {
				int mb_no = new Integer(req.getParameter("mb_no").trim());
				in = req.getPart("mb_pic").getInputStream();
				byte[] mb_pic = new byte[in.available()];
				in.read(mb_pic);
				MemService memberSvc = new MemService();
				memberSvc.updateMemPic(mb_no, mb_pic);
				out.print("success");
			} catch (Exception e) {
				e.printStackTrace();
				out.print("fail");
			}
		}
		if ("update_password".equals(action)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text; charset=utf-8");
			PrintWriter out = res.getWriter();
			int mb_no = new Integer(req.getParameter("mb_no").trim());
			MemService memberSvc = new MemService();
			MemVO memvo = memberSvc.getOneMem(mb_no);
			String pwd = memvo.getMb_pwd();
			String old_mb_pwd = req.getParameter("old_mb_pwd");
			if (!old_mb_pwd.equals(pwd)) {
				out.print("pwd_incorrect");
				return;
			}
			try {
				String mb_pwd = req.getParameter("confirm_new_mb_pwd").trim();
				mb_no = new Integer(req.getParameter("mb_no").trim());
				memberSvc = new MemService();
				memberSvc.updatePwd(mb_no, mb_pwd);
				MemVO newmember = memberSvc.getOneMem(mb_no);
				req.getSession().setAttribute("member", newmember);
				out.print("success");
			} catch (Exception e) {
				e.printStackTrace();
				out.print("fail");
			}
			return;
		}

		if ("login_check".equals(action)) { // �Ӧ�MemLogin.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String mb_email = req.getParameter("mb_email");
				String mb_emailReg = "^[(a-zA-Z0-9_)]{2,20}[@][(a-zA-Z0-9)]{3,10}[.][(a-zA-Z)]{1,5}$"; // ^�O�W�w�}�Y���᭱���r(not
																										// sure)
				if (mb_email == null || mb_email.trim().length() == 0) {
					errorMsgs.add("�|���H�c: �ФŪť�");
				} else if (!mb_email.trim().matches(mb_emailReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���H�c: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				String mb_pwd = req.getParameter("mb_pwd");
				String mb_pwdReg = "^[(a-zA-Z0-9_)]{2,20}$"; // ^�O�W�w�}�Y���᭱���r(not sure)
				if (mb_pwd == null || mb_pwd.trim().length() == 0) {
					errorMsgs.add("�|���K�X: �ФŪť�");
				} else if (!mb_pwd.trim().matches(mb_pwdReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�|���K�X: �u��O�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��20����");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mem/select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.loginCheck(mb_email, mb_pwd);
				if (memVO == null) {
					errorMsgs.add("�b���K�X���~�A�Э��s��J");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				
				String checkstatus = memVO.getStatus();
				if (checkstatus.contentEquals("0")) {
					errorMsgs.add("�b���|���q�L�{�ҡA�жi�J�H�c�ҥαb���C");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				HttpSession session = req.getSession();
				session.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jsession
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("listRelationships_ByMemberno_A".equals(action) || "listRelationships_ByMemberno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer member_no = new Integer(req.getParameter("member_no"));
				
				/*************************** 2.�}�l�d�߸�� ****************************************/			
				MemService memSvc = new MemService();
				Set<RelationshipVO> set = memSvc.getRelationshipsByMemberno(member_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listRelationships_ByMemno", set);    // ��Ʈw���X��list����,�s�Jrequest

				String url = null;
				if ("listRelationships_ByMemberno_A".equals(action))
					url = "/front-end/relationship/select_page.jsp";        // ���\��� dept/listEmps_ByDeptno.jsp
				else if ("listRelationships_ByMemberno_B".equals(action))
					url = "/front-end/mem/listRelationships_ByMemno.jsp";              // ���\��� dept/listAllDept.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		if ("forgot_password".equals(action)) { // �Ӧ�MemLogin.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			List<String> successMsgs = new LinkedList<String>();
			req.setAttribute("successMsgs", successMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String mb_email = req.getParameter("mb_email");
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
				//System.out.println(mb_email);
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getPassword(mb_email);
				if (memVO == null) {
					errorMsgs.add("�|���H�c���~�A�Э��s��J�|���H�c");
				}else {
					SendEmail mailService = new SendEmail();
					String randomPwd = mailService.sendPassword(mb_email);
//					System.out.println(randomPwd);
					// �N�ӥΤ᪺�K�X�ק令�üƱK�X 
					memSvc.updateRandomPws(mb_email, randomPwd);
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				
				
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				successMsgs.add("�s�K�X�H�e���\! �ЦܫH�c�����s�K�X�A�í��s�n�J");
				String url = "/front-end/mem/MemLogin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);
				
				
				/*************************** 4.�üƱK�X�s�W�ܸ�Ʈw  *************/

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/mem/MemLogin.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("listMems_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.�N��J����ରMap**********************************/ 
				//�ĥ�Map<String,String[]> getParameterMap()����k 
				//�`�N:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				// �H�U�� if �϶��u��Ĥ@������ɦ���
				if (req.getParameter("whichPage") == null){
					Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				/***************************2.�}�l�ƦX�d��***************************************/
				MemService memSvc = new MemService();
				List<MemVO> list  = memSvc.getAll(map);
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listMems_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/mem/listMems_ByCompositeQuery.jsp"); // ���\���listMems_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/addMem.jsp");
				failureView.forward(req, res);
			}
		}
		
//		MemVO memVOI = new Gson().fromJson(req.getReader(), MemVO.class);
//		if(memVOI != null && "update_for_Ajax".equals(memVOI.getAction())) {
		if("update_for_Ajax".contentEquals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();

			try {
				String mb_status = req.getParameter("mb_status");
//				String mb_status = memVOI.getStatus();

				String mb_level = req.getParameter("mb_level");
//				String mb_level = memVOI.getMb_level();

				int member_no = new Integer(req.getParameter("member_no"));
//				int member_no = memVOI.getMember_no();

				MemService memSvc = new MemService();
				MemVO memVO=memSvc.getOneMem(member_no);
				MemService memSvc1 = new MemService();
				memSvc1.updateMem(member_no, memVO.getMb_name(), memVO.getMb_email(), memVO.getMb_pwd(), 
						memVO.getMb_bd(), memVO.getMb_pic(), memVO.getMb_phone(),
						memVO.getMb_city(), memVO.getMb_address(), mb_status, memVO.getMb_point(),
						mb_level, memVO.getCrt_dt());
				
				out.print("success");

			}
			catch(Exception e) {
				out.print("fail");
				errorMsgs.add("�ק�|�����A�B��������");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}finally {
				out.flush();
				out.close();
			}
			
			
		}
	}
}