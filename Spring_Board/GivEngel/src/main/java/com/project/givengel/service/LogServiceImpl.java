package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.LogDAOImpl;
import com.project.givengel.dao.LoginDAOImpl;
import com.project.givengel.vo.LogVO;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDAOImpl logDAO;
	
	
	
	/************************************************
	 * 로그 데이터 관리 DAO								*
	 ************************************************/
	@Override
	public List<LogVO> selectLog() {
		return logDAO.selectLog();
	}
	@Override
	public void insertLog(LogVO vo) {
		// TODO Auto-generated method stub
		logDAO.insertLog(vo);
	}
	@Override
	public int deleteLog(LogVO vo) {
		return logDAO.deleteLog(vo);
	}

}
