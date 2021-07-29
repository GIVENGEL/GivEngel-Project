package com.project.givengel.dao;

import java.util.List;
import java.util.Map;

import com.project.givengel.vo.Criteria;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;
import com.project.givengel.vo.SearchCriteria;

public interface FleaDAO {
	
	// 중고장터 리스트 불러오기
	public List<FleaVO> getFleaList(FleaVO vo);
	public List<FleaVO> okayFleaList(FleaVO vo);
	
	// 중고장터 뷰페이지
	public FleaVO getFlea(FleaVO vo);
	
	// 중고장터 신청서 작성
	public void insertFleaWrite(FleaVO vo);
	
	// 중고장터 게시물 삭제
	public void deleteFlea(FleaVO vo);
	
	// 댓글 입력
	public void addFleaCom(Flea_comVO vo);
	
	// 댓글 목록
	public List<Flea_comVO> listFleaCom(Flea_comVO vo);
	
	// 댓글 삭제
	public void deleteFleaCom(Flea_comVO vo);
	
	// 게시물 총 갯수
	public int countFleaList();
	
	// 페이징 리스트 (최신순)
	public List<Map<String, Object>> pageFleaList(Criteria cri);
	
	// 페이징 리스트 (확정순)
	public List<Map<String, Object>> pageFleaListIsOkay(Criteria cri);
	
	// 검색에 대한 게시글 수
	public int countSearch(String searchType, String keyword);
	
	// 검색 리스트
	public List<FleaVO> searchList(SearchCriteria cri);
		
}
