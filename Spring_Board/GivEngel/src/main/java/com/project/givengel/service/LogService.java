package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.LogVO;

public interface LogService {
	
	/************************************************
	 * 로그 데이터 관리 DAO								*
	 ************************************************/
	public List<LogVO> selectLog();
	public void insertLog(LogVO vo);
	public int deleteLog(LogVO vo);

}
