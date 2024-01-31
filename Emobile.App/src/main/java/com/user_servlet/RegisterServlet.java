package com.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.DB.DBconnect;
import com.entity.user;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//			System.out.println(name+email+phoneno+password+check);

			HttpSession session = req.getSession();

			user us = new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);

			if (check != null) {
				userDAOImpl dao = new userDAOImpl(DBconnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {

					boolean f = dao.userRegister(us);

					if (f) {
//						System.out.println("user register successfull");

						session.setAttribute("succMsg", "user register successfull");
						resp.sendRedirect("register.jsp");
					} else {
//						System.out.println("something wrong on server...");
						session.setAttribute("failMsg", "something wrong on server...");
						resp.sendRedirect("register.jsp");
					}

				} else {
					session.setAttribute("failMsg", "User Already  Exist Try another Email...");
					resp.sendRedirect("register.jsp");
				}
			} else {
//				System.out.println("please check box");
				session.setAttribute("failMsg", "please Agree terms & condition");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

//		doGet(request, response);
	}

}
