package com.cambak21.service.adminOrder;

import java.util.List;

import com.cambak21.domain.AdminRefundnExchangeVO;
import com.cambak21.util.PagingCriteria;

public interface AdminOrderService {
	public List<AdminRefundnExchangeVO> AdminOrderList(PagingCriteria cri)throws Exception;
	
	public int AdminOrderListCnt()throws Exception;
	
	public boolean AdminRefundnExchangeChecked(int no)throws Exception;
	
	public boolean AdmiPaymentChecked(int no)throws Exception;
}
