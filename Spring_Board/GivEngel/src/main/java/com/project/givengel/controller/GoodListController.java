package com.project.givengel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.GoodListService;
import com.project.givengel.service.LogService;
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.PagingVO;
import com.project.givengel.vo.SearchCriteriaGood;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;

//**********************************************************
// 김민주 
// 상품 컨트롤러
@Controller
public class GoodListController {

	@Autowired
	private GoodListService goodListService;
	
	@Autowired
	private LogService logService;
	
	/*******************************************************
	 * 상품 영역
	*/	
	
	/*******************************************************
	 * 함수명 : getGoodList
	 * 
	 * 함수 기능 :  상품리스트 페이지 전체 상품 리스트(카테고리별 분류)
	 * 사용된 서비스 : GoodListService
	 * 마지막 수정 : 2021-07-26
	*/	
//	상품리스트 페이지 전체 상품 리스트(카테고리별 분류)
	@RequestMapping(value = "/buyList.giv", method=RequestMethod.GET)
	public void getGoodList(Model m, @ModelAttribute("searchCriteriaGood") SearchCriteriaGood cri)
	{
		//PagingVO 객체 생성
		PagingVO pagingVO = new PagingVO();
		pagingVO.setCri(cri);
		//검색 조건에 맞는 총 상품 개수 페이징 처리
		pagingVO.setTotalCount(goodListService.getGoodListCnt(cri));
		//검색 조건에 맞는 상품 리스트, 페이징 저장
		m.addAttribute("goodList", goodListService.getGoodList(cri));
		m.addAttribute("pagingVO", pagingVO);
		
		
		// 최신상품(date 순 정렬)
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		// 검색 조건에 맞춰 인기상품 저장(Like 순 정렬)
		m.addAttribute("getPopularGoodList", goodListService.getPopularGoodList());
		
	}
	
	
	/*******************************************************
	 * 함수명 : getGoodView
	 * 
	 * 함수 기능 :  상품 상세 페이지 + 댓글목록
	 * 사용된 서비스       :   getGoodView ,  listGoodCom, getlatestGood1, rankingGood
	 * 마지막 수정 : 2021-07-26
	*/		
	
//	상품 상세정보 + 댓글 가져오기
	@RequestMapping("/buyForm.giv")
	public Model getGoodView(Model m, GoodVO vo, Good_comVO comVO) {

//		상품 상세정보
		vo = goodListService.getGoodView(vo);
//		카테고리 분류 작업
		String[] categories =  vo.getGood_tag().split("#");

		if(vo != null) {
//		상품 상세정보 m에 키벨류 저장
		m.addAttribute("goodVO", vo);
//		카테고리 분류 키벨류 저장
		m.addAttribute("categories",categories[0]);
//		댓글 리스트 키벨류 저장
		m.addAttribute("comVO", goodListService.listGoodCom(comVO));

//		총 댓글수 키벨류 저장
		int totalGoodCom = goodListService.listGoodCom(comVO).size();
		m.addAttribute("totalGoodCom", totalGoodCom);
		
//		상품 상세정보 최하단 최신상품 리스트 키벨류 저장
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		
//		추천상품 리스트
		m.addAttribute("rankingGood", goodListService.rankingGood());
		}
		
		return m;
	}
	
	
	
	/*******************************************************
	 * 함수명 : loginCheckCom
	 * 
	 * 함수 기능 :  로그인 여부 확인(user_no로 가져온 user_pw와  입력받은 패스워드 대조 )
	 * 마지막 수정 : 2021-07-26
	*/		
	// 로그인 여부 확인
	@RequestMapping(value="/loginCheckCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String loginCheckCom(HttpServletRequest request, String user_pw) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		System.out.println(uvo.getUser_no());
		int result = -1;
		UserVO resultvo = goodListService.loginCheckCom(uvo);
		
		if(resultvo.getUser_pw().equals(user_pw)) {
			result = 1;
		}
		
		System.out.println(result);
		return Integer.toString(result);
		
	}
	/*******************************************************
	 * 함수명 : addGoodCom
	 * 
	 * 함수 기능 :  상품 댓글 입력
	 * 사용된 함수 : loginCheckCom
	 * 마지막 수정 : 2021-07-26 // com_content 유효성 검사 추가
	*/		
	//상품 댓글 입력
	@RequestMapping(value="/saveGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
    public String addGoodCom(Good_comVO gvo,String loginresult) {
		
		gvo.setGood_com_content(gvo.getGood_com_content().replaceAll(" ","&nbsp;"). replaceAll("< ","&lt;").replaceAll("> ","&gt;").replaceAll("\n ","<br>"));
		String result = "-1";
		if(loginresult.equals("1")) {
			goodListService.addGoodCom(gvo);
			result =	"1";
		}
		return result;
	}
	
	/*******************************************************
	 * 함수명 : addGoodCom
	 * 
	 * 함수 기능 :  상품 댓글 삭제
	 * 마지막 수정 : 2021-07-26
	*/		

	//상품 댓글 삭제
	@RequestMapping(value="/deleteGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String deleteGoodCom(Good_comVO gvo, HttpServletRequest requset) {
		HttpSession session = requset.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(vo != null) {
			gvo.setGood_com_writer(vo.getUser_id());
			goodListService.deleteGoodCom(gvo);
			result = "1";
		}
		return result;
	}
	
	/*******************************************************
	 * 함수명 : addGoodCom
	 * 
	 * 함수 기능 :  상품 댓글 수정
	 * 마지막 수정 : 2021-07-26 //com_content 유효성 검사 추가
	*/		
	//상품 댓글 수정
	@RequestMapping(value="/modifyGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String modifyGoodCom(Good_comVO gvo, HttpServletRequest requset) {
		HttpSession session = requset.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		gvo.setGood_com_content(gvo.getGood_com_content().replaceAll("< ","&lt;").replaceAll("> ","&gt;").replaceAll("\n ","<br>"));
		String result = "-1";
		if(vo != null) {
			gvo.setGood_com_writer(vo.getUser_id());
			goodListService.modifyGoodCom(gvo);
			result = "1";
		}
		return result;
	}
	
	
	
	/*******************************************************
	 * 구매 시 실행되는 메소드
	 * 함수명 : addUserBuyLog, addUserM, addUserMLog, countGoodStock
	 * 함수 기능 : 1. 상품 구매 로그 추가 (상품번호, 유저번호, 구매 총 금액 , 구매날짜)
	 * 			2. 유저 마일리지 적립 후 유저세션정보 갱신
	 * 			3. 유저 마일리지 로그 추가 (로그명 : "상품 구매")
	 * 			4. 상품 구매개수에 따른 재고현황 업데이트
	 * 마지막 수정 : 2021-07-26
	*/		

	// 유저 구매로그 입력
	@RequestMapping(value="/addUserBuyLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserBuyLog(User_buylogVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			vo.setUser_no(uvo.getUser_no());
			goodListService.addUserBuyLog(vo);
			result = "1";
			
			LogVO logvo = new LogVO();
			logvo.setLog_detail("[USER_BUY_GOOD]#"+uvo.getUser_id()+"#"+vo.getGood_no());
			logService.insertLog(logvo);
		}
		
	
		
		return result;
	}
	
	// 유저 마일리지 적립
	@RequestMapping(value="/addUserM.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserM(HttpServletRequest request,String buy_totalPrice,String good_no) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			String user_no = Integer.toString(uvo.getUser_no());
		    goodListService.addUserM(user_no,buy_totalPrice,good_no);
			result = "1";
		}
		if(result=="1") {
		int cash =  (uvo.getUser_cash() + (Integer.parseInt(buy_totalPrice) / 10));
		uvo.setUser_cash(cash);
		session.setAttribute("user", uvo);
		}
		
		return result;
	}

	// 유저 마일리지 로그 업데이트
	@RequestMapping(value="/addUserMLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserMLog(User_cashlogVO vo ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			int user_no = uvo.getUser_no();
			vo.setUser_no(user_no);
			goodListService.addUserMLog(vo);
			result = "1";
		}
		return result;
	}
	
	//상품 재고 업데이트
	@RequestMapping(value="/countGoodStock.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String countGoodStock(GoodVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		
		String result = "-1"; 
		if(uvo != null) {
		goodListService.countGoodStock(vo);
			result = "1";
		}
		
		return result;
	}
	
	/*******************************************************
	 * 	구매 관련 메소드 종료
	*********************************************************/	
	
	
	/*******************************************************
	 * 함수명 : addCart
	 * 
	 * 함수 기능 :  1. 로그인 세션 여부 확인 후 세션 유저번호 CartVO에 저장
	 * 		  	 2. 장바구니에 같은 상품 존재여부 확인
	 * 			 3. 없으면 장바구니 추가, 이미 같은 상품이 존재한다면 추가 X
	 * 사용된 서비스       :   checkCart, addCart (Service, dao)  
	 * 마지막 수정 : 2021-07-26
	*/		
	
	// 장바구니 추가
	@RequestMapping(value="/addCart.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addCart(CartVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			vo.setUser_no(uvo.getUser_no());
			List<CartVO> temp = goodListService.checkCart(vo);
			if(temp.size() == 0) {
				goodListService.addCart(vo);
				result="1";				
			}else {
				result = "0";
			}
		}
		return result;
	}
	




	
}
