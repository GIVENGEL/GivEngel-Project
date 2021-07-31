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
	
	// 댓글 삭제하기
	public void deleteSponCom(Spon_comVO vo); 
	
	// 댓글 수정하기
	public void modifySponCom(Spon_comVO vo); 
	
	// 마일리지 사용내역
	public void addCashLog(User_cashlogVO vo);
	
	// 마일리지 사용한만큼 차감
	public void minusCash(UserVO vo);
	
	// 사용한 마일리지만큼 후원단체 누적
	public void addSponTotal(SponVO vo);
	
	// 후원단체 누적금액 바로보여주기
	public void showSponTotal(SponVO vo);
	
	// 총 댓글 수
	public int countSponCom(Spon_comVO vo);
	
	// 캠페인 리스트
	public List<SponVO> campaignList();
	


}
 