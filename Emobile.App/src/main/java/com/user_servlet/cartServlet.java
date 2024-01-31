package com.user_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOImpl;
import com.DAO.mobilesDAOImpl;
import com.DB.DBconnect;
import com.entity.MobileDtls;
import com.entity.cart;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cart")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int mid = Integer.parseInt(req.getParameter("mid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			mobilesDAOImpl dao = new mobilesDAOImpl(DBconnect.getConn());
			MobileDtls m = dao.getMobileById(mid);

			cart c = new cart();

			c.setmid(mid);
			c.setUserId(uid);
			c.setMobileName(m.getMobilename());
			c.setCompany(m.getCampany());
			c.setPrice(Double.parseDouble(m.getPrice()));
			c.setTotalPrice(Double.parseDouble(m.getPrice()));

			cartDAOImpl dao2 = new cartDAOImpl(DBconnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Mobile Added to cart");
				resp.sendRedirect("all_new_mobile.jsp");
			} else {
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_new_mobile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
