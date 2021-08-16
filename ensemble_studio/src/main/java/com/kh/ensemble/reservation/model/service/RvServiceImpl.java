package com.kh.ensemble.reservation.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.dao.RvDAO;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.reservation.model.vo.RvPagination;

@Service
public class RvServiceImpl implements RvService{

	@Autowired
	private RvDAO dao;

	//회원 예약 내역 조회 service
	@Override
	public RvPagination getPagination(RvPagination pg) {

		
	
		RvPagination selectPg=dao.getRvListCount(pg);
		
		
		//System.out.println(selectPg);
		
		System.out.println("serviceImpl" + selectPg);
		
		return new RvPagination(pg.getCurrentPage(), selectPg.getRvListCount());
	}

	//예약 내역 목록 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Rv> selectRvList(RvPagination pagination) {
		
		return dao.selectRvLIst(pagination);
	}



	//선택일 예약 가능 시간 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Rv> selectRvTimeList(Rv rv) {
		
		return dao.selectRvTimeList(rv);
	}

	@Override
	public List<Option> selectOption() {
		// TODO Auto-generated method stub
		return dao.selectOption();
	}

	@Override
	public int reservation(Rv rv) {
		
		int result = dao.reservation(rv);
		if(result>0) return rv.getRvNo();
		else 	return 0;				
	}

	@Override
	public int setOptionNo(int optionNo,  int rvNo) {
		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optionNo", optionNo);
		map.put("rvNo",rvNo);
		
		return dao.setOptionNo(map);
	}

	@Override
	public List<Rv> rvStatusList() {
		// TODO Auto-generated method stub
		return dao.rvStatusList();
	}
	
	
	
	
	
	
	
	
	


	
	
}