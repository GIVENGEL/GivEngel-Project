package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;

@Repository("fleaDAO")
public class FleaDAOImpl implements FleaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 중고장터 리스트 불러오기
	public List<FleaVO> getFleaList(FleaVO vo) {
		System.out.println("===> Mybatis getFleaList() 호출");
		return mybatis.selectList("FleaDAO.getFleaList", vo);
	}
	public List<FleaVO> okayFleaList(FleaVO vo) {
		System.out.println("===> Mybatis okayFleaList() 호출");
		return mybatis.selectList("FleaDAO.okayFleaList", vo);
	}
	
	// 중고장터 뷰페이지
	public FleaVO getFlea(FleaVO vo) {
		System.out.println("===> Mybatis getFlea() 호출");
		return mybatis.selectOne("FleaDAO.getFlea", vo);
	}
	public FleaVO okayFlea(FleaVO vo) {
		System.out.println("===> Mybatis getFlea() 호출");
		return mybatis.selectOne("FleaDAO.okayFlea", vo);
	}
	
	// 중고장터 신청서 작성
	public void insertFleaWrite(FleaVO vo) {
		mybatis.insert("FleaDAO.insertFleaWrite", vo);
	}
	
	// 중고장터 게시물 삭제
	public void deleteFlea(FleaVO vo) {
		mybatis.delete("FleaDAO.deleteFlea", vo);
	}
	
	// 댓글 입력
	public void addFleaCom(Flea_comVO vo) {
		mybatis.insert("FleaDAO.addFleaCom", vo);
	}
	
	// 댓글 목록
	public List<Flea_comVO> listFleaCom(Flea_comVO vo) {
		return mybatis.selectList("FleaDAO.listFleaCom", vo);
	}
	
	// 댓글 삭제
	public void deleteFleaCom(Flea_comVO vo) {
		mybatis.delete("FleaDAO.deleteFleaCom", vo);
	}

}