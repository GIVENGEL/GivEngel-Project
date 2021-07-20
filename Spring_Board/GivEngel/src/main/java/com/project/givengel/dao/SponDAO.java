package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

public interface SponDAO {
	
	// 후원단체 리스트 불러오기
	public List<SponVO> getSponList(SponVO vo);
	
	// 후원단체 글 불러오기
	public SponVO getSpon(SponVO vo);
	
	// 댓글 등록
	public void addSponCom(Spon_comVO vo);
	
	// 댓글 목록 불러오기
	public List<Spon_comVO> listSponCom(Spon_comVO vo);
	
	public void deleteSponCom(Spon_comVO vo); 
	
	// 마일리지 사용내역
	public void addCashLog(User_cashlogVO vo);
	
	// 마일리지 사용한만큼 차감
	public void minusCash(UserVO vo);
	

}
 