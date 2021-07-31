package com.project.givengel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.FleaDAOImpl;
import com.project.givengel.vo.Criteria;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;
import com.project.givengel.vo.SearchCriteria;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;

@Service("fleaService")
public class FleaServiceImpl implements FleaService {

	@Autowired
	private FleaDAOImpl fleaDAO;

	@Override
	public List<FleaVO> getFleaList(FleaVO vo) {
		return fleaDAO.getFleaList(vo);
	}

	public List<FleaVO> okayFleaList(FleaVO vo) {
		return fleaDAO.okayFleaList(vo);
	}

	// 중고장터 뷰페이지
	public FleaVO getFlea(FleaVO vo) {
		return fleaDAO.getFlea(vo);
	}

	// 중고장터 신청서 작성
	public void insertFleaWrite(FleaVO vo) {
		fleaDAO.insertFleaWrite(vo);
	}

	public void deleteFlea(FleaVO vo) {
		fleaDAO.deleteFlea(vo);
	}

	// 댓글 입력
	public void addFleaCom(Flea_comVO vo) {
		fleaDAO.addFleaCom(vo);
	}

	// 댓글 목록
	public List<Flea_comVO> listFleaCom(Flea_comVO vo) {
		return fleaDAO.listFleaCom(vo);
	}

	// 댓글 삭제
	public void deleteFleaCom(Flea_comVO vo) {
		fleaDAO.deleteFleaCom(vo);
	}
	
	// 댓글 수정
	public void modifyFleaCom(Flea_comVO vo) {
		fleaDAO.modifyFleaCom(vo);
	}

	// 게시글 수
	public int countFleaList() {
		return fleaDAO.countFleaList();
	}

	// 페이징 리스트 (최신순)
	public List<Map<String, Object>> pageFleaList(Criteria cri) {
		return fleaDAO.pageFleaList(cri);
	}

	// 페이징 리스트 (확정순)
	public List<Map<String, Object>> pageFleaListIsOkay(Criteria cri) {
		return fleaDAO.pageFleaListIsOkay(cri);
	}

	// 검색
	public List<FleaVO> searchList(SearchCriteria cri) {
		return fleaDAO.searchList(cri);
	}

	// 검색에 대한 게시글 수
	public int countSearch(String searchType, String keyword) {
		return fleaDAO.countSearch(searchType, keyword);
	}
	
	// 총 댓글 수
	public int countFleaCom(Flea_comVO vo) {
		return fleaDAO.countFleaCom(vo);
	}
	
	// 캠페인 리스트
	public List<SponVO> campaignList(){
		return fleaDAO.campaignList();
	} 
	
	// 중고장터 게시글 수정
	public void updateFleaWrite(FleaVO vo) {
		fleaDAO.updateFleaWrite(vo);
	}
	

}
