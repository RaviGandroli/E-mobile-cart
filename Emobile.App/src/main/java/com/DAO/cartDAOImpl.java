package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.MobileDtls;
import com.entity.cart;

public class cartDAOImpl implements cartDAO {

	private Connection conn;

	public cartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(cart c) {

		boolean f = false;

		try {
			String sql = "insert into cart(mid,uid,mobileName,company, price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getmid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getMobileName());
			ps.setString(4, c.getCompany());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());

			int i = ps.executeUpdate();
			if (i > 0) {
				f = true;
			} else {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<cart> getMobileByUser(int userId) {

		List<cart> list = new ArrayList<cart>();
		cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select *from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new cart();
				c.setCid(rs.getInt(1));
				c.setmid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setMobileName(rs.getString(4));
				c.setCompany(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteMobile(int mid, int uid, int cid) {

		boolean f = false;
		try {
			String sql = "delete from cart where mid=? and uid=? and cid=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

}
