package com.cambak21.service.myorder;

import java.util.List;

import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.util.PagingCriteria;

public interface MemberOrderServivce {

	/**
	 * @Method Name : MemberLittleOrder
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 유저가 자신의 주문내역을 볼수있음
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public List<MemberLittleOrderVO> MemberLittleOrder(String userName,PagingCriteria cri)throws Exception;
	/**
	 * @Method Name : MemberLittleOrder
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 유저가 볼수 있는 주문내역의 갯수
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public int MemberLittleOrderCnt(String userName)throws Exception;
	
	/**
	 * @Method Name : MemberLittleOrder
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 유저가 자신의 상세한 주문내역을 볼수있음
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	
	
	public List<MemberOrderVO> MemberDetailOrder(String userName)throws Exception;

	

	/**
	 * @Method Name : MemberPointAndpaymentUpdate
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 맴버의 총 oint 와 총 사용 금액을 업데이트
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public boolean MemberPointAndpaymentUpdate(String userName)throws Exception;
	

	/**
	 * @Method Name : MemeberPointDateUpdate
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 맴버의 포인트가 업데이트되면 point테이블에 날짜 업데이트
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public boolean MemeberPointDateUpdate(String userName)throws Exception;
	

	/**
	 * @Method Name : MemeberGradeUpdate
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 맴버의 총 사용금액에 따라 등급 업데이트
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public boolean MemeberGradeUpdate(String userName)throws Exception;
}
