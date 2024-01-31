package com.DAO;

import java.util.List;

import com.entity.Mobile_order;

public interface mobileOrderDAO {

	public boolean saveOrder(List<Mobile_order> mlist);

	public List<Mobile_order> getMobile(String email);

	public List<Mobile_order> getAllMobile();
}
