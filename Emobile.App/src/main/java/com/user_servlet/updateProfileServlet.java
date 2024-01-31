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

@WebServlet("/update_profile")
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");

			user us = new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);

			HttpSession session = req.getSession();

			userDAOImpl dao = new userDAOImpl(DBconnect.getConn());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succmsg", "profile update successfull");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failedmsg", "something wrong on server");
					resp.sendRedirect("edit_profile.jsp");
				}
			} else {
				session.setAttribute("failedmsg", "your password is incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}

		} catch (Exception e) {

		}
	}

}
