package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;

public interface AdminDAO {

	public AdminVO login(AdminVO vo);

	public int userCount();
	public int priceCount();
	public int cashCount();

	public List<GoodVO> selectGood();

	public List<SponVO> selectSpon();

	public void insertGood(GoodVO vo);
	
	public void insertSpon(SponVO vo);

	public AdminVO selectAdmin(String admin_id);


}
