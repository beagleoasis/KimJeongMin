package com.cambak21.service.resell;

import java.util.List;

import com.cambak21.util.PagingCriteria;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.SearchCriteria;
import com.cambak21.dto.ResellBoardDeteDTO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.dto.ResellLikeBoardInsertDTO;

public interface ResellBoardService {
	/**
	 * @Method Name : ResellBoardInsert
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 Insert하기 위한 Method
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardInsert(ResellBoardVO vo)throws Exception;
	
	
	/**
	 * @Method Name : ResellBoardReadAll
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 모든 내용을 가져옴
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<ResellBoardVO> ResellBoardReadAll(PagingCriteria cri)throws Exception;

	/**
	 * @Method Name : ResellBoardReadAllCnt
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 전체 개시물들의 갯수를 가져옴
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardReadAllCnt()throws Exception;
	
	/**
	 * @Method Name : ResellBoardRead
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 특정 내용만 가져옴
	 * @param cri
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public List<ResellBoardVO> ResellBoardRead(PagingCriteria cri,SearchCriteria scri)throws Exception;
	
	/**
	 * @Method Name : ResellBoardReadAllCnt
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 특정 개시물들의 갯수를 가져옴
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardReadCnt(SearchCriteria scri)throws Exception;
	
	/**
	 * @Method Name : ResellBoardUpdate
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 특정 컬럼만 Update
	 * @param vo
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardUpdate(ResellBoardUpdateDTO dto)throws Exception;
	
	/**
	 * @Method Name : ResellBoardDelete
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 resellBoard_isDelete컬림을 Update
	 * @param vo
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardDelete(int no)throws Exception;
	
	/**
	 * @Method Name : viewcnt
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard의 조회수 업데이트
	 * @param no
	 * @throws Exception
	 */
	public void ResellBoardViewcnt(int no) throws Exception;

	/**
	 * @Method Name : ResellBoardUpdateReply
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard댓글 개수 업데이트
	 * @param no
	 * @param amount
	 * @throws Exception
	 */
	public void ResellBoardUpdateReply(int no,int amount) throws Exception;
	/**
	 * @Method Name : ResellBoardRead
	 * @작성일 : 2021. 3. 20.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 :ResellBoard안에 특정 글의 자세한 내용을 자져옴
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public ResellBoardVO ResellBoardReadDetail(int no) throws Exception;
}
