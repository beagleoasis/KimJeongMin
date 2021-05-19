/**
 * 
 */
package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

public interface MyPostingDAO {
	// 내가 쓴 글
	List<BoardVO> getMyPosting(String member_id, PagingCriteria cri, String board_category) throws Exception;
	
	// 내가 쓴 글 카운트
	int getMyPostingCnt(String member_id, String board_category) throws Exception;
	
	// ------------------------------------ 서효원 dao ------------------------------------
	
	// 내 댓글
	List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception;
	
	// 가져온 내 댓글 총 개수
	int myReplyTotal(String member_id, String board_category) throws Exception;
	
	// 내가 작성한 총 게시글
	int bringBoardCnt(String member_id) throws Exception;
	
	// 내가 작성한 중고마켓 총 게시글
	int bringResellBoardCnt(String member_id) throws Exception;
	
	// 내가 작성한 총 댓글
	int bringReplyCnt(String member_id) throws Exception;
	
	// 내가 작성한 중고마켓 총 댓글
	int bringResellReplyCnt(String member_id) throws Exception;
	
	// 내가 작성한 총 좋아요
	int bringLikeCnt(String member_id) throws Exception;
	
	// 내가 작성한 중고마켓 총 좋아요
	int bringResellLikeCnt(String member_id) throws Exception;
	
	// 내가 작성한 총 문의글
	int bringMyQuestion(String member_id) throws Exception;
	
	// ------------------------------------ 서효원 dao ------------------------------------
	
	// 내가 좋아요 누른 글
	List<MyLikeBoardListVO> getMyLikePostng(String member_id, PagingCriteria cri, String category) throws Exception;
	 
	// 내가 좋아요 누른 글 카운트
	int getMyLikePostngCnt(String member_id, String category) throws Exception;
	
	// 내 체크리스트 불러오기
	public List<CheckListVO> getCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 삭제하기
	public List<CheckListVO> delCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 수정하기
	public List<CheckListVO> modyCheckList(String member_id) throws Exception;
		
	// 내 체크리스트 등록하기
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception;

	// ------------------------------------ 김정민 dao ------------------------------------
	// 내가 작성한 중고캠핑마켓 리스트 가져오기
	List<ResellBoardVO> getMyResellPosting(String member_id, PagingCriteria cri, String category) throws Exception;
	// 총 게시글 수
	int getMyPageResellList(String member_id, String category) throws Exception;

	// 내가 작성한 중고캠핑마켓 댓글 리스트 가져오기
	List<ReplyResellVO> getMyResellReply(String member_id, PagingCriteria cri, String category) throws Exception;
	
	// 중고마켓 카운트
	ResellBoardCntVO getMyResellCnt(String member_id) throws Exception;
		
	
	
	
}
