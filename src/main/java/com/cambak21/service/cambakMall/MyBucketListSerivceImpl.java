package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.MyBucketCheckdVO;
import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.MyNonUserBucketVO;
import com.cambak21.persistence.cambakMall.MyBucketListDAO;

@Service
public class MyBucketListSerivceImpl implements MyBucketListService {

	@Inject
	private MyBucketListDAO dao;
	
	/**
	  * @Method Name : getBucketList
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id : 로그인한 유저 아이디
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyBucketListVO> getBucketList(String member_id) throws Exception {
		return dao.getBucketList(member_id);
	}

	/**
	  * @Method Name : changeQty
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 수량 변경
	  * @param member_id
	  * @param product_id
	  * @param qty
	  * @return
	  * @throws Exception
	  */
	@Override
	public int changeQty(String member_id, int product_id, int qty) throws Exception {
		return dao.changeQty(member_id, product_id, qty);
	}

	/**
	  * @Method Name : checkOnOff
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 체크 여부
	  * @param member_id
	  * @param product_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int checkOnOff(String member_id, int product_id) throws Exception {
		return dao.checkOnOff(member_id, product_id);
	}

	@Override
	@Transactional
	public void deleteItem(String member_id, int product_id) throws Exception {
//		dao.deleteItemBP(member_id, product_id);
		dao.deleteItemB(member_id, product_id);
	}

	@Override
	@Transactional
	public void deleteItemAll(String member_id) throws Exception {
//		dao.deleteItemAllBP(member_id);
		dao.deleteItemAllB(member_id);
	}

	/**
	  * @Method Name : goOrder
	  * @작성일 : 2021. 4. 12.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 주문 이벤트 발생 시, 
	  * 				1. Buckets 테이블에서 isChecked Y인것만 가져온다
	  * 				2. 가져온 데이터를 BuyProducts테이블에 insert 시킨다
	  * @param member_id
	  * @throws Exception
	  */
	@Override
	public void goOrder(String member_id) throws Exception {
//		dao.deleteItemAllBP(member_id);
		dao.insertBP(dao.getCheckedY(member_id));
	}
	
	@Override
	public boolean deletePastCart(String member_id) throws Exception {
		boolean result = false;
		
		int i = dao.deletePastCart(member_id);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

//	***************************************** 도연 비회원 장바구니 
	
	@Override
	public List<MyNonUserBucketVO> getNonUserBucketList(String ssid) throws Exception {
		return dao.getNonUserBucketList(ssid);
	}

	@Override
	public Integer changeNonUserQty(String ssid, int product_id, int qty) throws Exception {
		return dao.changeNonUserQty(ssid, product_id, qty);
	}

	@Override
	public void nonUserDeleteItemAll(String ssid) throws Exception {
		dao.nonUserDeleteItemAllB(ssid);
	}

	@Override
	public void nonUserDeleteItem(String ssid, int product_id) throws Exception {
		dao.nonUserDeleteItem(ssid, product_id);
		
	}

	@Override
	public Integer nonUserCheckOnOff(String ssid, int product_id) throws Exception {
		return dao.nonUserCheckOnOff(ssid, product_id);
	}


}
