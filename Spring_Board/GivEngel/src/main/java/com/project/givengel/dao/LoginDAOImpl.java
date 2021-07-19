package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.UserVO;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public UserVO login(UserVO vo) {
		// TODO Auto-generated method stub
		UserVO vos = mybatis.selectOne("LoginDAO.login",vo);
			System.out.println("DAO 파라미터 체크 : " + vos.getUser_id()); 
			return vos;
	}

	// 0이 아니면 중복아이디 있음
	@Override
	public int idChk(UserVO vo) {
		System.out.println("id 체크 : " + vo.getUser_id()); 
		int result = mybatis.selectOne("LoginDAO.idChk",vo);
		return result;
	}
	
	// 0 : 성공, -1 : 아이디 실패, -2: 패스워드 실패
	@Override
	public String join(UserVO vo,String confirm_pw) {
		System.out.println("[LoginDAOImpl - join] 실행 : ");
	
		if(idChk(vo)==0) {
			System.out.println("[LoginDAOImpl - 비밀번호체크] 실행 : " +vo.getUser_pw() +" && " + confirm_pw);

			if(vo.getUser_pw().equals(confirm_pw))
			{
				System.out.println("[LoginDAOImpl - join] 성공 : ");
				mybatis.insert("LoginDAO.join",vo);
				return "index";
			}
			else {
				System.out.println("[LoginDAOImpl - 아이디체크] 실패 : " +vo.getUser_pw() +" && " + confirm_pw);
				return "joinForm";
			}
			
		}
		else {
			System.out.println("[LoginDAOImpl - 아이디체크] 실패  : " +vo.getUser_id());

			return "joinForm";
		}
		
		

	}
	
	@Override
	public UserVO idFind(UserVO vo) {
		System.out.println("[LoginDAOImpl - idFind] 실행 : " + vo.getUser_name());
		UserVO result = mybatis.selectOne("LoginDAO.idFind",vo);
		return result;
	}
	@Override
	public UserVO pwFind(UserVO vo) {
		System.out.println("[LoginDAOImpl - pwFind] 실행 : " + vo.getUser_name());
		UserVO result = mybatis.selectOne("LoginDAO.pwFind",vo);
		return result;
	}
	@Override
	public UserVO findId(UserVO vo) {
		System.out.println("[LoginDAOImpl - findId] 실행 : " + vo.getUser_name());
		UserVO result = mybatis.selectOne("LoginDAO.findId",vo);
		return result;
	}
	
	@Override
	public UserVO findPw(UserVO vo) {
		System.out.println("[LoginDAOImpl - findPw] 실행 : " + vo.getUser_name());
		UserVO result = mybatis.selectOne("LoginDAO.findPw",vo);
		return result;
	}
	

	@Override
	public void find(UserVO vo) {
		// TODO Auto-generated method stub

	}

	
	

}
