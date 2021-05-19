package com.cambak21.persistence.adminOrder;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.AdminRefundnExchangeVO;
import com.cambak21.util.PagingCriteria;
@Repository
public class AdminOrderDAOImpl implements AdminOrderDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.cambak21.mappers.AdminOrderMapper";
	@Override
	public List<AdminRefundnExchangeVO> AdminOrderList(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace+".AdminOrderList",cri);
	}

	@Override
	public int AdminOrderListCnt() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".AdminOrderListCnt");
	}

	@Override
	public int AdminRefundnExchangeChecked(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".AdminRefundnExchangeChecked",no);
	}

	@Override
	public int AdmiPaymentChecked(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".AdmiPaymentChecked",no);
	}
	
}
