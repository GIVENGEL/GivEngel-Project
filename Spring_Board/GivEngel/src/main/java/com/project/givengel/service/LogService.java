package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.LogVO;

public interface LogService {
	public List<LogVO> selectLog();
	public void insertLog(LogVO vo);
	public int deleteLog(LogVO vo);

}
