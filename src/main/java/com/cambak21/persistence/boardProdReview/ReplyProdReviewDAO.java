package com.cambak21.persistence.boardProdReview;

import java.util.List;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.dto.InsertReplyProdReviewDTO;

public interface ReplyProdReviewDAO {

	// 댓글번호 처리
	public int getMaxNo() throws Exception;

	// Max reforder 가져오기
	public int getMaxReforder(int replyProdReview_no) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 삭제/목록 출력/댓글 수 확인을 위한 Bno 가져오기
	public int getBno(int no) throws Exception;
	
	// reforder 가져오기
	
	
	// 댓글 정렬 순서 정리
	public void updateReforder(int ref, int reforder) throws Exception;
	
	
	
	// 상품후기 게시글에 대한 댓글 생성
	public int addProdReply(InsertReplyProdReviewDTO dto) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 전체 목록 조회
	public List<ReplyProdReviewVO> read(int bno) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 수정
	public void update(ReplyProdReviewVO vo) throws Exception;
	
	// 상품후기 게시글에 대한 댓글 삭제(update처리)
	public void delete(int no) throws Exception;

	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception;
	
	// 댓글 삭제처리
	public boolean deleteProdReviewReply(int replyProdReview_no) throws Exception;

	// 수정을 위한 댓글 조회
	public String readProdReviewReply(int replyProdReview_no) throws Exception;

	// 댓글 수정처리
	public boolean modifyProdReviewReply(int replyProdReview_no, String replyProdReview_content) throws Exception;
	

	
}
