package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.LogVO;

@Repository("logDAO")
public class LogDAOImpl implements LogDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	
	
	/************************************************
	 * 로그 데이터 관리 DAO								*
	 ************************************************/
	@Override
	public List<LogVO> selectLog() {
		return mybatis.selectList("LogDAO.selectLog");
	}
	@Override
	public void insertLog(LogVO vo) {
		mybatis.insert("LogDAO.insertLog", vo);
	}
	@Override
	public int deleteLog(LogVO vo) {
		System.out.println("[deleteLog] vo체크" + vo.getLog_no());
		return mybatis.delete("LogDAO.deleteLog",vo);
	}
	
	
	
	
}
