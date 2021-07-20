package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Repository("sponDAO")
public class SponDAOImpl implements SponDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 후원단체 불러오기
	@Override
	public List<SponVO> getSponList(SponVO vo) {
		System.out.println("===> Mybatis getSponList() 호출");
		return mybatis.selectList("SponDAO.getSponList", vo);
	}
	
	// 후원단체 글 불러오기
	@Override
	public SponVO getSpon(SponVO vo) {
		System.out.println("===> Mybatis getSpon() 호출");
		return (SponVO) mybatis.selectOne("SponDAO.getSpon", vo);
	}

	// 댓글 등록
	@Override
	public void addSponCom(Spon_comVO vo) {
		System.out.println("===> Mybatis addSponCom() 호출");
		mybatis.insert("SponDAO.addSponCom", vo);
	}
	
	// 댓글 목록
	public List<Spon_comVO> listSponCom(Spon_comVO vo) {
		System.out.println("===> Mybatis listSponCom() 호출");
		return mybatis.selectList("SponDAO.listSponCom", vo);
	}
	
	// 댓글 삭제
	public void deleteSponCom(Spon_comVO vo) {
		System.out.println("===> Mybatis deleteSponCom() 호출");
		mybatis.delete("SponDAO.deleteSponCom", vo);
	}
	
	// 마일리지 사용내역
	public void addCashLog(User_cashlogVO vo) {
		System.out.println("===> Mybatis addCashLog() 호출");
		mybatis.insert("SponDAO.addCashLog", vo);
	}
	
	// 마일리지 사용한만큼 차감
	public void minusCash(UserVO vo) {
		System.out.println("===> Mybatis minusCash() 호출");
		mybatis.update("SponDAO.minusCash", vo);
	}

	
	
} 