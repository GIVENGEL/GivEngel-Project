package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.CampaignDAOImpl;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Service("CampaignService")
public class CampaignServiceImpl implements CampaignService {
	   
	@Autowired
	private CampaignDAOImpl CampaignDAO;
	public String nowSysdate() {
		return CampaignDAO.nowSysdate();
	} 
	
	public int countReview(Spon_comVO vo) {
		return CampaignDAO.countReview(vo);
	}
	
	public List<SponVO> campaignList(){
		return CampaignDAO.campaignList();
	}  
	 
	public void camSponCash(SponVO vo) {
		CampaignDAO.camSponCash(vo);
	}
	
	public void camUserCash(UserVO vo) {
		System.out.println("호출" + vo.getUser_cash());
		CampaignDAO.camUserCash(vo);
	}
	 
	public void campaignLog(User_cashlogVO cashvo) {
		CampaignDAO.campaignLog(cashvo);
	}
	
	public void updateReview(Spon_comVO vo) {
		CampaignDAO.updateReview(vo); 
	}
	
	public void deleteReview(Spon_comVO vo) {
		CampaignDAO.deleteReview(vo);
	}
	 
	public List<Spon_comVO> reviewList(Spon_comVO vo){
		return CampaignDAO.reviewList(vo);
		 
	}
	
	  
	public SponVO sponView(SponVO vo) {
		return CampaignDAO.sponView(vo);
		   	
	} 
  
	@Override
	public void reviewInsert(Spon_comVO vo) {
		CampaignDAO.reviewInsert(vo);
		   
	}
 
	@Override
	public void camTotalGive(int spon_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void camTotalReview() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fleaTotal() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void camSpon(String spon_name) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void camUpdate(int user_cash) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void directCamSell(int good_no) {
		// TODO Auto-generated method stub
		
	}

}
