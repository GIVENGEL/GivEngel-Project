package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;

public interface AdminService {
		AdminVO login(AdminVO vo);
		
		public int userCount();
		
		public int priceCount();
		public int cashCount();
		
		public List<GoodVO> selectGood();
		
		public List<SponVO> selectSpon();
		
		public void insertGood(GoodVO vo);
		
		public AdminVO selectAdmin(String admin_id);

}
