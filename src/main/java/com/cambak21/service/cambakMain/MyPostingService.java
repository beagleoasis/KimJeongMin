
package com.cambak21.service.cambakMain;

import java.util.List;


import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageAllCountVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

public interface MyPostingService {
	// ------------------------------------ 김정민 service ------------------------------------
	// 내가 쓴 글
	List<BoardVO> getMyPosting(String member_id, PagingCriteria cri, String board_category) throws Exception;
	
	// 내가 쓴 글 카운트
	int getMyPostingCnt(String member_id, String board_category) throws Exception;
	
	// 내가 좋아요 누른 글
	List<MyLikeBoardListVO> getMyLikePostng(String member_id, PagingCriteria cri, String category) throws Exception;

	// 내가 좋아요 누른 글 카운트
	int getMyLikePostngCnt(String member_id, String category) throws Exception;
	
	// ------------------------------------ 서효원 service ------------------------------------
	
	// 내 댓글
	List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception;
	
	// 가져온 내 댓글 총 개수
	int myReplyTotal(String member_id, String board_category) throws Exception;
	
	// 마이페이지 내 댓글 페이지 로딩 시 전체 게시글, 댓글, 좋아요, 문의 개수 가져오기
	MyPageAllCountVO myPageAllCount(String member_id) throws Exception;
	
	// ------------------------------------ 박종진 service ------------------------------------
	
	// 내 체크리스트 불러오기
	public List<CheckListVO> getCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 삭제하기
	public List<CheckListVO> delCheckList(String member_id) throws Exception;
	
	// 내 체크리스트 수정하기
	public List<CheckListVO> modyCheckList(String member_id) throws Exception;
		
	// 내 체크리스트 등록하기
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception;
	
	// ------------------------------------ 김정민 service ------------------------------------
	// 내가 작성한 중고캠핑마켓 리스트 가져오기
	List<ResellBoardVO> getMyResellPosting(String member_id, PagingCriteria cri, String category) throws Exception;

	// 총 게시글 수 가져오기
	int getMyPageResellList(String member_id, String category) throws Exception;
	// 내가 작성한 중고캠핑마켓 댓글 리스트 가져오기
	List<ReplyResellVO> getMyResellReply(String member_id, PagingCriteria cri, String category) throws Exception;

	//
	ResellBoardCntVO getMyResellCnt(String member_id) throws Exception;

		
	
	
	
}
