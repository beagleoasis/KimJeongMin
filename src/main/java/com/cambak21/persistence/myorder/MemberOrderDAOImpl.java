package com.cambak21.persistence.myorder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.util.PagingCriteria;
@Repository
public class MemberOrderDAOImpl implements MemberOrderDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.mapper.MemberOrderMapper";
	@Override
	public List<MemberLittleOrderVO> MemberLittleOrder(String userName, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userName",userName);
		param.put("pageStert", cri.getPageStart());
		param.put("pageNum", cri.getPerPageNum());
		return ses.selectList(userName+".MemberLittleOrder",param);
	}

	@Override
	public int MemberLittleOrderCnt(String userName) throws Exception {
		return ses.selectOne(namespace+".MemberLittleOrderCnt",userName);
	}

	@Override
	public List<MemberOrderVO> MemberDetailOrder(String userName) throws Exception {
		return ses.selectList(namespace+".MemberDetailOrder",userName);
	}

	@Override
	public int MemberPointAndpaymentUpdate(String userName) throws Exception {
		return ses.update(namespace+".MemberPointAndpaymentUpdate",userName);
	}

	@Override
	public int MemeberPointDateUpdate(String userName) throws Exception {
		return ses.update(namespace+".MemeberPointDateUpdate",userName);
	}

	@Override
	public int MemeberGradeUpdate(String userName) throws Exception {
		return ses.update(namespace+".MemeberGradeUpdate",userName);
	}

}
