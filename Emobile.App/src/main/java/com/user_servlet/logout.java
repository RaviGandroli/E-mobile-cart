package com.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logo")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			
			HttpSession session = req.getSession();
			session.removeAttribute("userobj");

			HttpSession session2 = req.getSession();
			session.setAttribute("succmsg", "Logout Successfully");

			resp.sendRedirect("login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
