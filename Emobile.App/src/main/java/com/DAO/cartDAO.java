package com.DAO;

import java.util.List;

import com.entity.MobileDtls;
import com.entity.cart;

public interface cartDAO {
	public boolean addCart(cart c);

	public List<cart> getMobileByUser(int userId);

	public boolean deleteMobile(int mid, int uid, int cid);
}
