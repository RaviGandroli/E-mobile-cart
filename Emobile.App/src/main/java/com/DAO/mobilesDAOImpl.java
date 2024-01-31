package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.MobileDtls;

public class mobilesDAOImpl implements mobilesDAO {

	private Connection conn;

	public mobilesDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addMobiles(MobileDtls m) {
		// TODO Auto-generated method stub
		boolean f = false;

		try {
			String sql = "insert into mobile_details(mobilename,price,company,status,photo,user_email,mobile_category)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMobilename());
			ps.setString(2, m.getPrice());
			ps.setString(3, m.getCampany());
			ps.setString(4, m.getStatus());
			ps.setString(5, m.getPhoto());
			ps.setString(6, m.getEmail());
			ps.setString(7, m.getMobilecategory());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<MobileDtls> getAllMobiles() {

		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public MobileDtls getMobileById(int id) {
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details where mobileid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	@Override
	public boolean updateEditMobile(MobileDtls m) {

		boolean f = false;
		try {
			String sql = "update mobile_details set mobilename=?,company=?,price=?,status=? where mobileid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMobilename());
			ps.setString(2, m.getCampany());
			ps.setString(3, m.getPrice());
			ps.setString(4, m.getStatus());
			ps.setInt(5, m.getMobileid());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<MobileDtls> getNewMobile() {

		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where mobile_category=? and status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MobileDtls> getRecentMobile() {

		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<MobileDtls> getOldMobile() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where mobile_category=? and status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MobileDtls> getAllRecentMobiles() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MobileDtls> getAllNewMobiles() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where mobile_category=? and status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MobileDtls> getAllOldMobiles() {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details  where mobile_category=? and status=? order by mobileid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MobileDtls> getMobileByOld(String email, String cate) {

		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details where mobile_category=? and user_email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String sql = "delete from mobile_details where mobile_category=? and user_email=? and mobileid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<MobileDtls> getMobileBySearch(String ch) {
		List<MobileDtls> list = new ArrayList<MobileDtls>();
		MobileDtls m = null;

		try {
			String sql = "select * from mobile_details where mobilename like ? or company like ? or mobile_category like ? and status=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new MobileDtls();
				m.setMobileid(rs.getInt(1));
				m.setMobilename(rs.getString(2));
				m.setCampany(rs.getString(4));
				m.setPrice(rs.getString(3));
				m.setMobilecategory(rs.getString(8));
				m.setStatus(rs.getString(5));
				m.setPhoto(rs.getString(6));
				m.setEmail(rs.getString(7));
				list.add(m);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteMobiles(int id) {

		boolean f = false;
		try {

			String sql = "delete from mobile_details where mobileid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
