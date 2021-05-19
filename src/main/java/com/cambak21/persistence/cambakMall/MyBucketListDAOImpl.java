package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MyBucketCheckdVO;
import com.cambak21.domain.MyBucketListVO;
import com.cambak21.domain.MyNonUserBucketVO;

@Repository
public class MyBucketListDAOImpl implements MyBucketListDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.mappers.cambakMain.MyMallMapper";

	/**
	 * @Method Name : getBucketList
	 * @작성일 : 2021. 4. 9.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 해당 유저의 장바구니 목록 불러오기
	 * @param member_id : 로그인한 유저 아이디
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<MyBucketListVO> getBucketList(String member_id) throws Exception {
		return ses.selectList(ns + ".getCartList", member_id);
	}

	/**
	  * @Method Name : changeQty
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 장바구니 수량 변경
	  * @param member_id
	  * @param product_id
	  * @param qty
	  * @return
	  * @throws Exception
	  */
	@Override
	public int changeQty(String member_id, int product_id, int qty) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		map.put("qty", qty);
		return ses.update(ns + ".changeQty", map);
	}

	/**
	  * @Method Name : checkOnOff
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @param product_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int checkOnOff(String member_id, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		return ses.update(ns + ".checkOnOff", map);
	}

	/**
	  * @Method Name : deleteItemB
	  * @작성일 : 2021. 4. 11.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 장바구니에서 선택삭제 했을 시 BuyProduct테이블에 있는 데이터 지우기
	  * @param member_id
	  * @param product_id
	  * @throws Exception
	  */
	@Override
	public void deleteItemB(String member_id, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		ses.update(ns + ".deleteItemB", map);
	}

	/**
	  * @Method Name : deleteItemAllB
	  * @작성일 : 2021. 4. 12.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :장바구니 아이템 전체삭제 시 Buckets테이블 데이터 지우기
	  * @param member_id
	  * @throws Exception
	  */
	@Override
	public void deleteItemAllB(String member_id) throws Exception {
		ses.update(ns + ".deleteItemAllB", member_id);
	}

	/**
	  * @Method Name : getCheckedY
	  * @작성일 : 2021. 4. 12.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 장바구니에서 주문하기 버튼을 누르면 Y체크된 것들만 가져오기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyBucketCheckdVO> getCheckedY(String member_id) throws Exception {
		return ses.selectList(ns + ".getBucketInfos", member_id);
	}

	/**
	  * @Method Name : insertBP
	  * @작성일 : 2021. 4. 12.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : BuyProducts테이블에 insert
	  * @param vo
	  * @throws Exception
	  */
	@Override
	public void insertBP(List<MyBucketCheckdVO> vo) throws Exception {
		// List를 Map에 담아서 mapper로 보낸다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		ses.insert(ns + ".insertBP", map);
	}
	
	@Override
	public int deletePastCart(String member_id) throws Exception {
		return ses.delete(ns + ".deletePastCart", member_id);
	}

//	***************************************** 도연 비회원 장바구니 *********************************************************
	
	@Override
	public List<MyNonUserBucketVO> getNonUserBucketList(String ssid) throws Exception {
		return ses.selectList(ns + ".getNonUserBucketList", ssid);
	}

	@Override
	public int changeNonUserQty(String ssid, int product_id, int qty) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ssid", ssid);
		map.put("product_id", product_id);
		map.put("qty", qty);
		return ses.update(ns + ".changeNonUserQty", map);
	}

	@Override
	public void nonUserDeleteItemAllB(String ssid) throws Exception {
		ses.delete(ns + ".nonUserDeleteItemAllB", ssid);	
	}

	@Override
	public void nonUserDeleteItem(String ssid, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ssid", ssid);
		map.put("product_id", product_id);
		ses.delete(ns + ".nonUserDeleteItem", map);		
	}

	@Override
	public Integer nonUserCheckOnOff(String ssid, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ssid", ssid);
		map.put("product_id", product_id);
		return ses.update(ns + ".nonUserCheckOnOff", map);
	}


}
