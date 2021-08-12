
package com.kh.ensemble.reservation.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.reservation.model.vo.RvPagination;


public interface RvService {

	/**
	 *  회원 예약내역 페이지 조회
	 * @param pg
	 * @return
	 */
	RvPagination getPagination(RvPagination pg);

	/**
	 * 예약 목록조회
	 * @param pagination
	 * @param rvMemberNo 
	 * @return
	 */
	List<Rv> selectRvList(RvPagination pagination);



	
	//선택날짜 예약가능 시간 선택
	List<Rv> selectRvTimeList(Rv rv);

	///옵션정보 얻어오기
	List<Option> selectOption();

	int reservation(Rv rv);

	int setOptionNo(int optionNo,  int rvNo);

}