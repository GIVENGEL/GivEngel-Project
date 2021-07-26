package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.FleaDAOImpl;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;

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


}
