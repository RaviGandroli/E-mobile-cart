package com.DAO;

import java.util.List;

import com.entity.MobileDtls;

public interface mobilesDAO {

	public boolean addMobiles(MobileDtls b);

	public List<MobileDtls> getAllMobiles();

	public MobileDtls getMobileById(int id);

	public boolean updateEditMobile(MobileDtls m);

	public boolean deleteMobiles(int id);

	public List<MobileDtls> getNewMobile();

	public List<MobileDtls> getRecentMobile();

	public List<MobileDtls> getOldMobile();

	public List<MobileDtls> getAllRecentMobiles();

	public List<MobileDtls> getAllNewMobiles();

	public List<MobileDtls> getAllOldMobiles();

	public List<MobileDtls> getMobileByOld(String email, String cate);

	public boolean oldBookDelete(String email, String cat, int id);

	public List<MobileDtls> getMobileBySearch(String ch);

}
