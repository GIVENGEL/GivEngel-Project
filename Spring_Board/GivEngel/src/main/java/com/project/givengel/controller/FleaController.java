package com.project.givengel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.FleaServiceImpl;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.Flea_comVO;
import com.project.givengel.vo.UserVO;

@Controller
public class FleaController {
	
	@Autowired
	private FleaServiceImpl fleaService;
	

	@RequestMapping("{url}.giv") // 변수처리
	public String sample(@PathVariable String url, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		return url;
	}
	
	
	/*****************************************************
	    * 함수명          :    getFleaList
	    * 
	    * 함수 기능       :   1. 중고장터 메뉴에 중고장터 리스트 불러오기
	    * 
	    * 사용된 함수     :   getFleaList
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-25
	*****************************************************/
	@RequestMapping("/fleaBoard.giv")
	public Map<String, Object> getFleaList(FleaVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<FleaVO> fleaList = new ArrayList<FleaVO>();
		fleaList = fleaService.getFleaList(vo);
		map.put("fleaList", fleaList);
		
		List<FleaVO> okayFleaList = new ArrayList<FleaVO>();
		okayFleaList = fleaService.okayFleaList(vo);
		map.put("okayFleaList", okayFleaList);
		
		return map;
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
	public void getFlea(FleaVO vo, Model m, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		FleaVO flea = fleaService.getFlea(vo);
		m.addAttribute("flea", flea);
		
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
		map.put("count", list.size());
		
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
	
	
	
	
	
	
	
	
	
	 

}
