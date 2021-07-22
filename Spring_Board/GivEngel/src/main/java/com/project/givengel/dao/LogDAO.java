package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.LogVO;

public interface LogDAO {
	
	public List<LogVO> selectLog();
	public void insertLog(LogVO vo);
	public int deleteLog(LogVO vo);

}
