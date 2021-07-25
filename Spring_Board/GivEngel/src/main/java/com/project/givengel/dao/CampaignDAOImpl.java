package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;
 
@Repository("CampaignDAO") 
public class CampaignDAOImpl implements CampaignDAO {
	   
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public String nowSysdate() {
		return mybatis.selectOne("CampaignDAO.nowSysdate");
	}
	
	public int countReview(Spon_comVO vo) {
		return mybatis.selectOne("CampaignDAO.countReview", vo);
	}
	 
	public List<SponVO> campaignList() {
		return mybatis.selectList("CampaignDAO.campaignList");
	}   
	
	public void camSponCash(SponVO vo) {
		mybatis.update("CampaignDAO.camSponCash", vo);
	}
	
	public void camUserCash(UserVO vo) {
		System.out.println("호출" + vo.getUser_cash());
		mybatis.update("CampaignDAO.camUserCash", vo);
	}
	  
	public List<Spon_comVO> reviewList(Spon_comVO vo){
		  
		return mybatis.selectList("CampaignDAO.reviewList", vo);
	} 
	
	public void campaignLog(User_cashlogVO cashvo) {
		mybatis.insert("CampaignDAO.campaignLog", cashvo);
	}
	
	public void deleteReview(Spon_comVO vo) {
		mybatis.delete("CampaignDAO.deleteReview", vo);
	}
	
	@Override
	public SponVO sponView(SponVO vo) {
		 return mybatis.selectOne("CampaignDAO.sponView", vo);
		  	  
	}
   
	@Override 
	public void reviewInsert(Spon_comVO vo) {
			mybatis.insert("CampaignDAO.reviewInsert", vo);
	}  
	
	public void updateReview(Spon_comVO vo) {
		mybatis.update("CampaignDAO.updateReview", vo);
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
