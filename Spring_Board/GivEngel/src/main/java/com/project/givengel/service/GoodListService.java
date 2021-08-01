package com.project.givengel.service;

import java.util.List;
import java.util.Map;

import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.SearchCriteriaGood;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;
//*******************************************************************
// 김민주
// 상품리스트 서비스
public interface GoodListService {
	
	// 전체상품
	public List<GoodVO> getGoodList(SearchCriteriaGood cri);
	// 인기상품
	public List<GoodVO> getPopularGoodList(SearchCriteriaGood cri);
	// 최신상품
	public List<GoodVO> getlatestGood1();
	// 총 상품 수 
	public int getGoodListCnt(SearchCriteriaGood cri);
	// 추천상품(댓글순)
	public List<Map<String,Object>> goodComRanking();
	
	

	// 상품 상세정보
	public GoodVO getGoodView(GoodVO vo);
	// 추천 상품(랭킹순)
	public List<GoodVO> rankingGood();
	
	
	
	
	
	// 상품 댓글 리스트
	public List<Good_comVO> listGoodCom(Good_comVO comVO);
	
	// 상품댓글 유효성
	public UserVO loginCheckCom(UserVO uvo);
	
	// 상품댓글 입력
	public void addGoodCom(Good_comVO gvo);
	
	// 상품댓글 삭제
	public void deleteGoodCom(Good_comVO gvo);
	
	// 상품 댓글 수정
	public void modifyGoodCom(Good_comVO gvo);
	
	
	
	
	
	// 유저 구매로그 저장
	public void addUserBuyLog(User_buylogVO vo);
	
	// 유저 마일리지 적립
	public void addUserM(String user_no,String buy_totalPrice,String good_no);

	//유저 마일리지 로그 업데이트
	public void addUserMLog(User_cashlogVO vo);
	
	// 상품 재고 업데이트
	public void countGoodStock(GoodVO gvo);
	
	
	
	
	
	
	
	// 장바구니 중복 확인
	public List<CartVO> checkCart(CartVO vo);
	
	// 장바구니 추가
	public void addCart(CartVO vo);
	
	
	
	
}
