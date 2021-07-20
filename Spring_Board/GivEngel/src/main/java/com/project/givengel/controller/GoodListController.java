package com.project.givengel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.givengel.service.GoodListService;

//**********************************************************
// 김민주 
// 상품리스트 컨트롤러
@Controller
public class GoodListController {

	@Autowired
	private GoodListService goodListService;
	
//	전체 상품 리스트 가져오는 메소드(카테고리별 분류)
	@RequestMapping("/buyList.giv")
	public void getGoodList(Model m, String categories, String color, String sorting) {
		// 최신상품(date 순 정렬) 가져오고 Model에 저장
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		m.addAttribute("latestGood2", goodListService.getlatestGood2());
		m.addAttribute("latestGood3", goodListService.getlatestGood3());
		// 전체상품(카테고리 별 정렬) 가져오고 Model에 저장
		m.addAttribute("goodList", goodListService.getGoodList(categories,color,sorting));
		// 인기상품(인기순 고정)
		m.addAttribute("getPopularGoodList", goodListService.getPopularGoodList(categories,color));
		
		
	}
	
//	
//	@RequestMapping("/buyForm.giv")
//	public void getGoodView() {
//		
//	}
	
	@RequestMapping("/buyForm.giv")
	public void buyForm() {
		
	}
	
	


	
}
