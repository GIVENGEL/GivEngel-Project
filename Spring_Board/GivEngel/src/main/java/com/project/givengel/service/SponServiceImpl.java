package com.project.givengel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.SponDAOImpl;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Service("sponService")
public class SponServiceImpl implements SponService {
	
	@Autowired
	@Inject
	private SponDAOImpl sponDAO;
	
		
	@Override
	public List<SponVO> getSponList(SponVO vo) {
		return sponDAO.getSponList(vo);
	}
	
	@Override
	public SponVO getSpon(SponVO vo) {
		return sponDAO.getSpon(vo);
	}
	
	// 댓글 작성 
	@Override
	public void addSponCom(Spon_comVO vo) {
		sponDAO.addSponCom(vo);		
	}
	
	// 댓글 목록
	@Override
	public List<Spon_comVO> listSponCom(Spon_comVO vo) {
		return sponDAO.listSponCom(vo);
		}
	
	// 댓글 삭제
	public void deleteSponCom(Spon_comVO vo) {
		sponDAO.deleteSponCom(vo);
	}
	
	// 댓글 수정
	public void modifySponCom(Spon_comVO vo) {
		sponDAO.modifySponCom(vo);
	}
	
	// 마일리지 사용내역
	public void addCashLog(User_cashlogVO vo) {
		sponDAO.addCashLog(vo);
	}
	
	// 마일리지 사용한만큼 차감
	public void minusCash(UserVO vo) {
		sponDAO.minusCash(vo);
	}
	
	// 사용한 마일리지만큼 후원단체에 누적
	public void addSponTotal(SponVO vo) {
		sponDAO.addSponTotal(vo);
	}
	
	
	// 후원단체 누적금액
	public void showSponTotal(SponVO vo) {
		sponDAO.showSponTotal(vo);
	}
	
	
	// 총 댓글 수
	public Spon_comVO countSponCom(Spon_comVO vo) {
		return sponDAO.countSponCom(vo);
	}
	
	

}
 