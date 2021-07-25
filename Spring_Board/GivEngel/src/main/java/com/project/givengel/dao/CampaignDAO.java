package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;
 
public interface CampaignDAO {
	public String nowSysdate();
	
	public int countReview(Spon_comVO vo);
	
	public List<SponVO> campaignList(); 
	 
	public void camSponCash(SponVO vo);
	
	public void camUserCash(UserVO vo); 
	
	public void campaignLog(User_cashlogVO cashvo);
	
	public void updateReview(Spon_comVO vo);
	
	public void deleteReview(Spon_comVO vo); 
	
	public List<Spon_comVO> reviewList(Spon_comVO vo); 
	
	public SponVO sponView(SponVO vo);
	  
	public void reviewInsert(Spon_comVO vo);
	 
	public void camTotalGive(int spon_no); //캠페인 기부액
	public void camTotalReview(); // //캠페인 토탈댓글
	 
	public void fleaTotal(); //중고장터 토탈
	
	public void camSpon(String spon_name); //캠페인 스폰서 설정
	public void camUpdate(int user_cash); //캠페인 업데이트
	
	public void directCamSell(int good_no); //다이렉트 캠페인에서 다이렉트? 이건 ㅣㅇㄹ단 보류
	

	
	 
}
