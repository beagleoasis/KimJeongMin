package com.cambak21.persistence.adminOrder;

import java.util.List;

import com.cambak21.domain.AdminRefundnExchangeVO;
import com.cambak21.util.PagingCriteria;

public interface AdminOrderDAO {
	public List<AdminRefundnExchangeVO> AdminOrderList(PagingCriteria cri)throws Exception;
	
	public int AdminOrderListCnt()throws Exception;
	
	public int AdminRefundnExchangeChecked(int no)throws Exception;
	
	public int AdmiPaymentChecked(int no)throws Exception;
}
