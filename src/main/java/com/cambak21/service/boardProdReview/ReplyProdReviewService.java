package com.cambak21.service.boardProdReview;

import java.util.List;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.dto.InsertReplyProdReviewDTO;

public interface ReplyProdReviewService {
	// 댓글 추가
	public int addProdReply(InsertReplyProdReviewDTO dto) throws Exception;
	
	// 댓글 목록 가져오기
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception;
	
	// Max replyProdReview_no 가져오기
	public int getMaxNo() throws Exception;
	
	// Max reforder 가져오기
	public int getMaxReforder(int replyProdReview_no) throws Exception;

	// 댓글 삭제처리 하기
	public boolean deleteProdReviewReply(int replyProdReview_no) throws Exception;

	// 댓글 수정을 위한 댓글 조회하기
	public String readProdReviewReply(int replyProdReview_no) throws Exception;

	// 댓글 수정
	public boolean modifyProdReviewReply(int replyProdReview_no, String replyProdReview_content) throws Exception;
	
	

}
