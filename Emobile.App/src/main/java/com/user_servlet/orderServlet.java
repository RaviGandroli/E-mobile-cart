package com.user_servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOImpl;
import com.DAO.mobileOrderDAOImpl;
import com.DB.DBconnect;
import com.entity.MobileDtls;
import com.entity.Mobile_order;
import com.entity.cart;

@WebServlet("/order")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fulladd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
			List<cart> list = dao.getMobileByUser(id);
			if (list.isEmpty()) {
				session.setAttribute("failedmsg", "Add Item");
				resp.sendRedirect("checkout.jsp");
			} else {
				mobileOrderDAOImpl dao2 = new mobileOrderDAOImpl(DBconnect.getConn());
				Mobile_order o = null;

				ArrayList<Mobile_order> orderList = new ArrayList<Mobile_order>();
				Random r = new Random();
				for (cart c : list) {
					o = new Mobile_order();
					o.setOrderId("Mobile-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhoneno(phoneno);
					o.setFulladd(fulladd);
					o.setMobilename(c.getMobileName());
					o.setCompany(c.getCompany());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);

				}
				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedmag", "Please Choose your Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedmag", " your order failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
