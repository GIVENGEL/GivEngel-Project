package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.Criteria;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;
import com.project.givengel.vo.SearchCriteria;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;

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
	
	// 댓글 수정
	public void modifyFleaCom(Flea_comVO vo) {
		System.out.println("===> Mybatis modifyFleaCom() 호출");
		mybatis.update("FleaDAO.modifyFleaCom", vo);
	}
	
	// 게시글 총 개수
	public int countFleaList() {
		return mybatis.selectOne("FleaDAO.countFleaList");
	}
	
	// 페이징 리스트 (최신순)
	public List<Map<String, Object>> pageFleaList(Criteria cri) {
		return mybatis.selectList("FleaDAO.pageFleaList", cri);
	}
	
	// 페이징 리스트 (확정순)
	public List<Map<String, Object>> pageFleaListIsOkay(Criteria cri) {
		return mybatis.selectList("FleaDAO.pageFleaListIsOkay", cri);
	}
	
	// 검색에 대한 게시글 수
	public int countSearch(String searchType, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return mybatis.selectOne("FleaDAO.countSearch", map);
	}
	
	// 검색
	public List<FleaVO> searchList(SearchCriteria cri) {
		return mybatis.selectList("FleaDAO.searchList", cri);
	}
	
	// 총 댓글 수
	public int countFleaCom(Flea_comVO vo) {
		return mybatis.selectOne("FleaDAO.countFleaCom", vo);
	}
	
	// 캠페인 리스트
	public List<SponVO> campaignList() {
		return mybatis.selectList("FleaDAO.campaignList");
	} 
	
	// 중고장터 게시글 수정
	public void updateFleaWrite(FleaVO vo) {
		System.out.println("===> Mybatis updateFleaWrite() 호출");
		mybatis.update("FleaDAO.updateFleaWrite", vo);
	}

}
