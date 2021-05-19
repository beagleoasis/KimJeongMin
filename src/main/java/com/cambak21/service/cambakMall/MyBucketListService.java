package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.MyNonUserBucketVO;

public interface MyBucketListService {
	
	List<MyBucketListVO> getBucketList(String member_id) throws Exception;
	
	int changeQty(String member_id, int product_id, int qty) throws Exception;
	
	int checkOnOff(String member_id, int product_id) throws Exception;
	
	void deleteItem(String member_id, int product_id) throws Exception;
	
	void deleteItemAll(String member_id) throws Exception;
	
	void goOrder(String member_id) throws Exception;
	
	boolean deletePastCart(String member_id) throws Exception;
	
//	***************************************** 도연 비회원 장바구니
	List<MyNonUserBucketVO> getNonUserBucketList(String ssid) throws Exception;

	Integer changeNonUserQty(String ssid, int product_id, int qty) throws Exception;

	void nonUserDeleteItemAll(String ssid) throws Exception;

	void nonUserDeleteItem(String ssid, int product_id) throws Exception;

	Integer nonUserCheckOnOff(String ssid, int product_id) throws Exception;

}
