package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Mobile_order;

public class mobileOrderDAOImpl implements mobileOrderDAO {

	private Connection conn;

	public mobileOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<Mobile_order> mlist) {

		boolean f = false;

		try {
			String sql = "insert into mobile_order(order_id,user_name,email,address,phone,mobile_name,company,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Mobile_order mb : mlist) {
				ps.setString(1, mb.getOrderId());
				ps.setString(2, mb.getUsername());
				ps.setString(3, mb.getEmail());
				ps.setString(4, mb.getFulladd());
				ps.setString(5, mb.getPhoneno());
				ps.setString(6, mb.getMobilename());
				ps.setString(7, mb.getCompany());
				ps.setString(8, mb.getPrice());
				ps.setString(9, mb.getPaymentType());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Mobile_order> getMobile(String email) {

		List<Mobile_order> list = new ArrayList<Mobile_order>();
		Mobile_order o = null;
		try {

			String sql = "select * from mobile_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Mobile_order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setMobilename(rs.getString(7));
				o.setCompany(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mobile_order> getAllMobile() {
		List<Mobile_order> list = new ArrayList<Mobile_order>();
		Mobile_order o = null;
		try {

			String sql = "select * from mobile_order";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Mobile_order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhoneno(rs.getString(6));
				o.setMobilename(rs.getString(7));
				o.setCompany(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
