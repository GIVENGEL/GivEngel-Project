package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;

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
}
