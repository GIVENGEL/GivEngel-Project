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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.LogService;
import com.project.givengel.service.MypageServiceImpl;
import com.project.givengel.service.SponService;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Controller
public class SponsorController {

	@Autowired
	private SponService sponService;
	
	@Autowired
	private MypageServiceImpl mypageService;
	
	@Autowired
	private LogService logService;

	
	/*****************************************************
	    * 함수명          :    getSponList
	    * 
	    * 함수 기능       :   1. 후원단체 메뉴에 후원단체 목록 불러오기
	    * 
	    * 사용된 함수     :   getSponList
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping("/sponsorList.giv")
	public String getSponList(SponVO vo, Spon_comVO comVO, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		m.addAttribute("sponList", sponService.getSponList(vo));
		
		List<Integer> listString = new ArrayList<Integer>();
		for(int i=0;i<sponService.getSponList(vo).size();i++) {
			int temp_sponNum = sponService.getSponList(vo).get(i).getSpon_no();
			Spon_comVO com = new Spon_comVO();
			com.setSpon_no(temp_sponNum);
			
			int result = sponService.countSponCom(com);
			listString.add(result);
		}
		
		
		
		m.addAttribute("countSponCom", listString);
		
		List<SponVO> list = new ArrayList<SponVO>();
		list = sponService.campaignList();
		m.addAttribute("campaignList", list);
		
		
		return "/sponsorList";

	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    getSpon
	    * 
	    * 함수 기능       :   1. 후원단체 목록을 클릭하면 해당 후원단체의 뷰페이지로 이동
	    * 			   2. 해당 후원단체의 정보를 불러옴
	    * 
	    * 사용된 함수     :   getSpon
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping("/sponsorView.giv")
	public Model getSpon(SponVO vo, Spon_comVO comVO, Model m, HttpServletRequest request) {
		m.addAttribute("spon", sponService.getSpon(vo));
		String countSponCom = Integer.toString(sponService.countSponCom(comVO));
		m.addAttribute("countSponCom", countSponCom);
		
		HttpSession session = request.getSession();
		UserVO id = (UserVO)session.getAttribute("user");
		if(id!=null) {
		UserVO uvo = mypageService.userInfoView(id);
		m.addAttribute("uvo", uvo);
		}
		
		return m;
	}

	
	
	
	/*****************************************************
	    * 함수명          :    addSponCom
	    * 
	    * 함수 기능       :   1. 댓글 입력하는 기능
	    * 
	    * 사용된 함수     :   addSponCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	// 댓글 입력
	@RequestMapping(value = "/saveSponsorCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	private void addSponCom(Spon_comVO vo) {
		sponService.addSponCom(vo);
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    deleteSponCom
	    * 
	    * 함수 기능       :   1. 삭제 버튼을 누르면 해당 댓글을 DB에서 삭제
	    * 
	    * 사용된 함수     :   deleteSponCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping(value = "/deleteSponCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void deleteSponCom(Spon_comVO vo) {
		sponService.deleteSponCom(vo);
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    modifySponCom
	    * 
	    * 함수 기능       :   1. 수정한 댓글을 DB에 업데이트
	    * 
	    * 사용된 함수     :   modifySponCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping(value = "/modifySponCom.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void modifySponCom(Spon_comVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		
		sponService.modifySponCom(vo);

	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    listSponCom
	    * 
	    * 함수 기능       :   1. 입력한 댓글 목록을 맵에 담아 반환
	    * 
	    * 사용된 함수     :   listSponCom
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-23
	*****************************************************/
	@RequestMapping(value = "/listSponsorCom.giv", produces = "application/json")
	@ResponseBody
	public Map<String, Object> listSponCom(Spon_comVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");

		Map<String, Object> map = new HashMap<String, Object>();
		List<Spon_comVO> list = new ArrayList<Spon_comVO>();
		list = sponService.listSponCom(vo);
		map.put("listSponCom", list);
		
		
		return map;
	}
	
	
	/*****************************************************
	    * 함수명          :    addCashLog
	    * 
	    * 함수 기능       :   1. 마일리지 사용시 사용내역을 DB에 저장
	    * 
	    * 사용된 함수     :   addCashLog
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping(value = "/addCashLog.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void addCashLog(User_cashlogVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
	
		sponService.addCashLog(vo);
	}
	
	
	
	/*****************************************************
	    * 함수명          :    minusCash
	    * 
	    * 함수 기능       :   1. 마일리지 사용시 사용한 금액만큼 DB에서 차감
	    * 
	    * 사용된 함수     :   minusCash
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	@RequestMapping(value = "/minusCash.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void minusCash(UserVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
        UserVO sessionUservo = (UserVO)session.getAttribute("user");
        sessionUservo.setUser_cash(sessionUservo.getUser_cash()-vo.getUser_no());
        session.setAttribute("User", sessionUservo); 
        
        LogVO logvo = new LogVO();
		logvo.setLog_detail("[USER_SPON#"+sessionUservo.getUser_id()+"#"+vo.getUser_no());
		logService.insertLog(logvo);
        
		sponService.minusCash(vo);
	}
	
	
	
	
	/*****************************************************
	    * 함수명          :    addSponTotal
	    * 
	    * 함수 기능       :   1. 마일리지를 사용하여 후원했을때 사용한 금액만큼 후원단체 DB에 누적금액에 누적
	    * 
	    * 사용된 함수     :   addSponTotal
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	 @RequestMapping("/addSponsorTotal.giv") 
	 @ResponseBody 
	 public void addSponTotal(SponVO vo, HttpServletRequest request) { 		 
		 HttpSession session = request.getSession();
		UserVO sessionUserVO = (UserVO)session.getAttribute("user");
		 sponService.addSponTotal(vo);
		}
	 
	 
	 
	 
	 /*****************************************************
	    * 함수명          :    showSponTotal
	    * 
	    * 함수 기능       :   1. 후원하기 버튼 클릭시 후원한 만큼의 금액을 누적한 값을 전달
	    * 
	    * 사용된 함수     :   showSponTotal
	    * 사용된 서비스   :   -
	    * 마지막 수정      :   2021-07-22
	*****************************************************/
	 @RequestMapping(value = "/showSponTotal.giv", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public void showSponTotal(SponVO vo, HttpServletRequest request) {
		
			sponService.showSponTotal(vo);
		}
	 
	 
	 
	 

}
