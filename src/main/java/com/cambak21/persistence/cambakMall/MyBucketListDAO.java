package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.MyBucketCheckdVO;
import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.MyNonUserBucketVO;

public interface MyBucketListDAO {
	List<MyBucketListVO> getBucketList(String member_id) throws Exception;
	
	int changeQty(String member_id, int product_id, int qty) throws Exception;

	int checkOnOff(String member_id, int product_id) throws Exception;
	
//	void deleteItemBP(String member_id, int product_id) throws Exception;
	
	void deleteItemB(String member_id, int product_id) throws Exception;
	
//	void deleteItemAllBP(String member_id) throws Exception;
	
	void deleteItemAllB(String member_id) throws Exception;
	
	List<MyBucketCheckdVO> getCheckedY(String member_id) throws Exception;
	
	void insertBP(List<MyBucketCheckdVO> vo) throws Exception;
	
//	************************************************** 도연 비회원 장바구니
	List<MyNonUserBucketVO> getNonUserBucketList(String ssid) throws Exception;
	
	public int changeNonUserQty(String ssid, int product_id, int qty) throws Exception;

	void nonUserDeleteItemAllB(String ssid) throws Exception;

	void nonUserDeleteItem(String ssid, int product_id) throws Exception;

	Integer nonUserCheckOnOff(String ssid, int product_id) throws Exception;

	int deletePastCart(String member_id) throws Exception;
}
