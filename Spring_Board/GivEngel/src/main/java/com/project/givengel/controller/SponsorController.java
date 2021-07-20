package com.project.givengel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.SponService;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Controller
public class SponsorController {

	@Autowired
	private SponService sponService;

	@RequestMapping("/sponsorList.giv")
	public void getSponList(SponVO vo, Model m) {
		m.addAttribute("sponList", sponService.getSponList(vo));
	}

	@RequestMapping("/sponsorView.giv") 
	public void getSpon(SponVO vo, Spon_comVO comVO,  Model m) {
		m.addAttribute("spon", sponService.getSpon(vo));
		m.addAttribute("listSponCom", sponService.listSponCom(comVO));	
	}

	// 댓글 입력
	@RequestMapping(value="/saveSponsorCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
    private void addSponCom(Spon_comVO vo) {
		sponService.addSponCom(vo);
	}
	
	// 댓글 삭제
	@RequestMapping(value="/deleteSponCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void deleteSponCom(Spon_comVO vo) {
		sponService.deleteSponCom(vo);
	}
	
	// 마일리지 사용 내역
	@RequestMapping(value="/addCashLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void addCashLog(User_cashlogVO vo) {
		sponService.addCashLog(vo);
	}
	
	// 마일리지 사용한만큼 차감
	@RequestMapping(value="/minusCash.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void minusCash(UserVO vo) {
		sponService.minusCash(vo);
		 
	}
	
	/*
	 * @RequestMapping("/listSponsorCom.giv")
	 * 
	 * @ResponseBody public ModelAndView listSponCom(Spon_comVO vo, ModelAndView mv)
	 * {
	 * 
	 * }
	 */

}
