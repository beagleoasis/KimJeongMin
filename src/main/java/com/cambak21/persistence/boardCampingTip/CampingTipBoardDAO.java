package com.cambak21.persistence.boardCampingTip;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipLikeDTO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.util.PagingCriteria;

public interface CampingTipBoardDAO {
	
	// 캠핑팁 게시판 전체 조회
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception;
	
	// 캠핑팁 게시판 전체 게시물 개수 가져오기
	public int totalTipBoard() throws Exception;
	
	// 캠핑팁 게시판 검색
	public List<BoardVO> tipBoardSearch(SearchCampingTipVO word, PagingCriteria cri) throws Exception;
	
	// 캠핑팁 게시판 검색 결과 개수 가져오기
	public int totalTipBoardSearch(SearchCampingTipVO word) throws Exception;
	
	// 캠핑팁 게시판 상세 글 조회 수 + 1
	public boolean upViewCount(int board_no) throws Exception;
	
	// 캠핑팁 게시판 상세 조회
	public BoardVO viewCampingTipBoard(int board_no, String board_category) throws Exception;
	
	// 게시글 쓰기 insert
	public boolean writeCampingTipBoard(CamBoardTipWriteDTO writeDTO) throws Exception;
	public int searchBoardLastNum(CamBoardTipWriteDTO writeDTO) throws Exception; // 방금 작성한 게시글번호 가져오기기
	
	// 게시글 수정 update
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO) throws Exception;
	
	// 게시글 삭제 delete
	public int deleteCampingTipBoardReply(int board_no) throws Exception;
	public boolean deleteCampingTipBoard(int board_no) throws Exception;
	
	// 게시글 상세 보기 시 댓글 select
	public List<ReplyBoardVO> readReplyCampingTipBoard(int board_no) throws Exception;
	
	// 상세 게시글 댓글 작성 insert
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception;
	public int getCampingTipReplyNextNum(CamBoardTipReplyDTO replyDTO) throws Exception;
	public boolean updateCampingTipReplyRef(int replyBoard_no) throws Exception;
	public boolean updateCampingTipReplyCnt(int board_no) throws Exception;
	
	// 상세 게시글 댓글 수정 update
	public boolean modifyCampingTipReply(int replyBoard_no, String replyBoard_content) throws Exception;
	
	// 상세 게시글 댓글 삭제 delete
	public boolean deleteCampingTipReply(int replyBoard_no) throws Exception;
	public boolean deleteCampingTipReplyCount(int board_no) throws Exception;
	
	// 상세 게시글 대댓글 보기 select
	public List<ReplyBoardVO> readRereplyCampingTipBoard(int board_no) throws Exception;
	
	// 상세 게시글 대댓글 작성 insert
	public int checkReforderMax(CamBoardTipRereplyDTO dto) throws Exception;
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception;
	public boolean upRereplyCount(CamBoardTipRereplyDTO rereplyDTO) throws Exception;
	
	// 상세 게시글 대댓글 수정 update
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception;
	
	//  상세 게시글 대댓글 삭제 delete
	public boolean downRereplyCount(int replyBoard_no) throws Exception;
	
	// 상세 게시글 댓글 개수 select
	public int checkReplyCount(int board_no) throws Exception;
	
	// 캠핑팁 상세글 대댓글이 없는 댓글의 구역 체크를 위한 기능
	public List<ReplyBoardVO> noRereplyAreaBlock(int board_no) throws Exception;
	
	// 로그인한 유저의 상세게시글 추천 여부 확인
	public int readLikeInfo(int board_no, String member_id) throws Exception;
	
	// 로그인한 유저가 추천하기, 추천취소 버튼 클릭시 게시글 DB 정보 변경
	public boolean boardLikeUpdate(CamBoardTipLikeDTO dto) throws Exception;
	
	// 로그인한 유저가 추천하기, 추천취소 버튼 클릭시 게시글 추천 수 +- 1
	public boolean boardLikeCntUpdate(CamBoardTipLikeDTO dto) throws Exception;
	
	// 추천 수 업데이트 후 상세 게시글 총 추천 수 select
	public int totalViewBoardLike(CamBoardTipLikeDTO dto) throws Exception;
}
