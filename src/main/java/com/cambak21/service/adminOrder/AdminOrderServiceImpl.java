package com.cambak21.service.adminOrder;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.AdminRefundnExchangeVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.persistence.adminOrder.AdminOrderDAO;
@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	@Inject 
	private AdminOrderDAO dao;
	@Override
	public List<AdminRefundnExchangeVO> AdminOrderList(PagingCriteria cri) throws Exception {
		List<AdminRefundnExchangeVO> vo = dao.AdminOrderList(cri);
		return vo;
	}

	@Override
	public int AdminOrderListCnt() throws Exception {
		return dao.AdminOrderListCnt();
	}

	@Override
	public boolean AdminRefundnExchangeChecked(int no) throws Exception {
		boolean result = false;
		int i = dao.AdminRefundnExchangeChecked(no);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean AdmiPaymentChecked(int no) throws Exception {
		boolean result = false;
		int i = dao.AdminRefundnExchangeChecked(no);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

}
