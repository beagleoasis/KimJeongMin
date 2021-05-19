package com.cambak21.service.resell;

import java.util.List;

import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardVO;

public interface ResellBoardReplyService {
	/**
	 * @Method Name : ResellBoardReplyInsert
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard에 댓글 달기
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardReplyInsert(ReplyResellVO vo)throws Exception;
	
	/**
	 * @Method Name : ResellBoardReplyRead
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoardReplyRead 댓글 보여주기
	 * @param bno
	 * @return
	 * @throws Exception
	 */
	public List<ReplyResellVO> ResellBoardReplyRead(int bno) throws Exception;
	
	/**
	 * @Method Name : ResellBoardUpadte
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoardReplyRead에 댓글 수정
	 * @param vo
	 * @throws Exception
	 */
	public void ResellBoardUpadte(ResellBoardVO vo)throws Exception;
	
	/**
	 * @Method Name : ResellBoardReplyDelete
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoardReplyRead에 댓글 삭제
	 * @param no
	 * @throws Exception
	 */
	public void ResellBoardReplyDelete(int no)throws Exception;

}
