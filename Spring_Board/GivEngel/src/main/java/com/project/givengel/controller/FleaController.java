package com.project.givengel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.FleaServiceImpl;
import com.project.givengel.vo.Criteria;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;
import com.project.givengel.vo.PageVO;
import com.project.givengel.vo.SearchCriteria;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Controller
public class FleaController {
	
	@Autowired
	@Inject
	private FleaServiceImpl fleaService;
	

	@RequestMapping("{url}.giv") // 변수처리
	public String sample(@PathVariable String url, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		return url;
	}

	
	/*****************************************************
	    * 함수명          :    getFlea
	    * 
	    * 함수 기능       :   1. 중고장터 물품 목록 중 선택시 해당 뷰페이지 이동
	    * 
	    * 사용된 함수     :   getFlea
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-25
	*****************************************************/
	@RequestMapping("/fleaView.giv")
	public Model getFlea(FleaVO vo, Flea_comVO comVO, Model m, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		FleaVO flea = fleaService.getFlea(vo);
		m.addAttribute("flea", flea);
		m.addAttribute("countFleaCom", fleaService.countFleaCom(comVO));
		List<SponVO> list = new ArrayList<SponVO>();
		list = fleaService.campaignList();
		m.addAttribute("campaignList", list);
		
		return m;
		
	}
	
	
	
	/*****************************************************
	    * 함수명          :    insertFleaWrite
	    * 
	    * 함수 기능       :   1. 중고장터 게시판에 물품신청서 작성하면 해당 정보들을 DB에 저장
	    * 
	    * 사용된 함수     :   insertFleaWrite
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-26
	*****************************************************/
	@RequestMapping("/fleaWriteAction.giv")
	public String insertFleaWrite(FleaVO vo) {
		fleaService.insertFleaWrite(vo);
		
		return "redirect:fleaBoard.giv";
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    deleteFlea
	    * 
	    * 함수 기능       :   1. 중고장터 게시물 삭제
	    * 
	    * 사용된 함수     :   deleteFlea
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-26
	*****************************************************/
	 @RequestMapping(value = "/deleteFleaView.giv", produces = "application/text;charset=UTF-8")
	 @ResponseBody
	 public void deleteFlea(FleaVO vo) {
		 fleaService.deleteFlea(vo);
	 }
	 
	 
	 
	/*****************************************************
	    * 함수명          :    addFleaCom
	    * 
	    * 함수 기능       :   1. 댓글 입력하는 기능
	    * 
	    * 사용된 함수     :   addFleaCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-26
	*****************************************************/
	// 댓글 입력
	@RequestMapping(value = "/saveFleaCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	private void addFleaCom(Flea_comVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		fleaService.addFleaCom(vo);
	}
	
	
	
	/*****************************************************
	    * 함수명          :    listFleaCom
	    * 
	    * 함수 기능       :   1. 입력한 댓글 목록을 맵에 담아 반환
	    * 
	    * 사용된 함수     :   listFleaCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-26
	*****************************************************/
	@RequestMapping(value = "/listFleaCom.giv", produces = "application/json")
	@ResponseBody
	public Map<String, Object> listFleaCom(Flea_comVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");

		Map<String, Object> map = new HashMap<String, Object>();
		List<Flea_comVO> list = new ArrayList<Flea_comVO>();
		list = fleaService.listFleaCom(vo);
		map.put("listFleaCom", list);
		map.put("countFlea", list.size());
		
		return map;
	}
	
	
	
	/*****************************************************
	    * 함수명          :    deleteFleaCom
	    * 
	    * 함수 기능       :   1. 삭제 버튼을 누르면 해당 댓글을 DB에서 삭제
	    * 
	    * 사용된 함수     :   deleteFleaCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-26
	*****************************************************/
	@RequestMapping(value = "/deleteFleaCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void deleteFleaCom(Flea_comVO vo) {
		fleaService.deleteFleaCom(vo);
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    pageFleaList
	    * 
	    * 함수 기능       :   1. 게시판 페이징을 위한 게시물 리스트 (최신순)
	    * 
	    * 사용된 함수     :   pageFleaList
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-27
	*****************************************************/
	@RequestMapping(value = "/fleaBoard.giv")
	public Model pageFleaList(Criteria cri, Flea_comVO vo, Model m) {
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(fleaService.countFleaList());
		
		List<Map<String, Object>> list = fleaService.pageFleaList(cri);
		String countSponCom = Integer.toString(fleaService.countFleaCom(vo));
		
		m.addAttribute("list", list);
		m.addAttribute("page", pageVO);
		m.addAttribute("count", countSponCom);
		
		
		return m;
	}
	
	
	
	/*****************************************************
	    * 함수명          :    pageFleaListIsOkay
	    * 
	    * 함수 기능       :   1. 게시판 페이징을 위한 게시물 리스트 (확정순)
	    * 
	    * 사용된 함수     :   pageFleaListIsOkay
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-27
	*****************************************************/
	@RequestMapping("/fleaBoardIsOkay.giv")
	@ResponseBody
	public Map pageFleaListIsOkay(Criteria cri, FleaVO vo, Model m) {
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(fleaService.countFleaList());
		
		List<Map<String, Object>> listIsOkay = fleaService.pageFleaListIsOkay(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listIsOkay", listIsOkay);
		map.put("page", pageVO);
		
		return map;
	}
	
	
	
	/*****************************************************
	    * 함수명          :    list
	    * 
	    * 함수 기능       :   1. 검색을 위한 게시판 리스트, 페이징
	    * 
	    * 사용된 함수     :   list
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-28
	*****************************************************/
	@RequestMapping(value = "/fleaSearchList.giv")
	public Model list(SearchCriteria cri, Model m) {
		
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(fleaService.countSearch(cri.getSearchType(), cri.getKeyword()));
		
		List<FleaVO> searchList = fleaService.searchList(cri);
		int count = fleaService.countSearch(cri.getSearchType(), cri.getKeyword());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchList", searchList);
		map.put("count", count);
		map.put("searchType", cri.getSearchType());
		map.put("keyword", cri.getKeyword());
		m.addAttribute("page", pageVO);
		m.addAttribute("map", map);
		
		return m;
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    modifyFleaCom
	    * 
	    * 함수 기능       :   1. 수정한 댓글을 DB에 업데이트
	    * 
	    * 사용된 함수     :   modifyFleaCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-30
	*****************************************************/
	@RequestMapping(value = "/modifyFleaCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void modifyFleaCom(Flea_comVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		fleaService.modifyFleaCom(vo);
	}
	
	
	// 게시글 수정
	/*
	 * @RequestMapping("/fleaWriteModifyAction.giv") public void
	 * updateFleaWrite(FleaVO vo) { fleaService.updateFleaWrite(vo); }
	 */
	
	
	
	
	
	 

}
