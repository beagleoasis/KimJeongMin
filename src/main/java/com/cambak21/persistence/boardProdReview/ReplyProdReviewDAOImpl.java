package com.cambak21.persistence.boardProdReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.dto.InsertReplyProdReviewDTO;

@Repository
public class ReplyProdReviewDAOImpl implements ReplyProdReviewDAO {

	@Inject
	private SqlSession ses;
	private static final String namespace = "com.cambak21.mappers.cambakBoard.ReplyProdReviewMapper";
	
	@Override
	public int addProdReply(InsertReplyProdReviewDTO dto) throws Exception {
		return ses.insert(namespace + ".addProdReply", dto);
	}

	@Override
	public List<ReplyProdReviewVO> read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ReplyProdReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getBno(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMaxNo() throws Exception {
		return ses.selectOne(namespace + ".getMaxNo");
	}

	@Override
	public void updateReforder(int ref, int reforder) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReplyProdReviewVO> getListReply(int prodReview_no) throws Exception {
		return ses.selectList(namespace + ".getListReply", prodReview_no);
	}

	@Override
	public int getMaxReforder(int replyProdReview_no) throws Exception {
		return ses.selectOne(namespace + ".getMaxReforder", replyProdReview_no);
	}

	// 댓글 삭제 처리
	@Override
	public boolean deleteProdReviewReply(int replyProdReview_no) throws Exception {
		boolean result = false;
		if(ses.update(namespace + ".deleteProdReviewReply", replyProdReview_no) == 1) {
			result = true;
		}
		
		return result;
	}

	// 댓글 조회 처리
	@Override
	public String readProdReviewReply(int replyProdReview_no) throws Exception {
		return ses.selectOne(namespace + ".readProdReviewReply", replyProdReview_no);
	}

	// 댓글 수정 처리
	@Override
	public boolean modifyProdReviewReply(int replyProdReview_no, String replyProdReview_content) throws Exception {
		boolean modifyResult = false;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("replyProdReview_no", replyProdReview_no);
		params.put("replyProdReview_content", replyProdReview_content);
		if(ses.update(namespace + ".modifyProdReviewReply", params) == 1) {
			modifyResult = true;
		}
		
		return modifyResult;
	}

}
