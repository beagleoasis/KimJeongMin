package com.cambak21.service.myorder;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.persistence.myorder.MemberOrderDAO;
import com.cambak21.util.PagingCriteria;
@Service
public class MemberOrderServivceImpl implements MemberOrderServivce {
	@Inject 
	private MemberOrderDAO dao;

	@Override
	public List<MemberLittleOrderVO> MemberLittleOrder(String userName, PagingCriteria cri) throws Exception {
		List<MemberLittleOrderVO> vo = dao.MemberLittleOrder(userName,cri);
		return vo;
	}

	@Override
	public int MemberLittleOrderCnt(String userName) throws Exception {
		return dao.MemberLittleOrderCnt(userName);
	}

	@Override
	public List<MemberOrderVO> MemberDetailOrder(String userName) throws Exception {
		List<MemberOrderVO> vo = dao.MemberDetailOrder(userName);
		return null;
	}

	@Override
	public boolean MemberPointAndpaymentUpdate(String userName) throws Exception {
		boolean result = false;
		int i = dao.MemberPointAndpaymentUpdate(userName);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean MemeberPointDateUpdate(String userName) throws Exception {
		boolean result = false;
		int i = dao.MemeberPointDateUpdate(userName);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean MemeberGradeUpdate(String userName) throws Exception {
		boolean result = false;
		int i = dao.MemeberGradeUpdate(userName);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

}
