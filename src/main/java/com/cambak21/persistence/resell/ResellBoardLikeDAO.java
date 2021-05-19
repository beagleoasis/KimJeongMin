package com.cambak21.persistence.resell;

import java.util.List;

import com.cambak21.domain.ResellLikeBoardVO;

public interface ResellBoardLikeDAO {
	/**
	 * @Method Name : ResellBoardLikeInsert
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 유저가 좋아요 누르면 좋아요테이블에 insert
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardLikeInsert(ResellLikeBoardVO vo) throws Exception;
	

	/**
	 * @Method Name : ResellBoardLikeDelete
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 좋아요 취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int  ResellBoardLikeDelete(ResellLikeBoardVO vo)throws Exception;
	
	/**
	 * @Method Name : ResellBoardLikeCnt
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 좋아요수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardLikeCnt(ResellLikeBoardVO vo)throws Exception;
	
	public ResellLikeBoardVO ResellBoardlikeRead(ResellLikeBoardVO vo)throws Exception;
	
}
