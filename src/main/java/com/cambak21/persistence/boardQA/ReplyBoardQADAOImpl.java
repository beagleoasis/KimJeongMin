package com.cambak21.persistence.boardQA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyQABoardDTO;
import com.cambak21.dto.UpdateReplyQABoardDTO;

@Repository
public class ReplyBoardQADAOImpl implements ReplyBoardQADAO {
	
	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mapper.ReplyBoardQA";

	@Override
	public int getRefMax() throws Exception {
		return ses.selectOne(ns + ".maxBoardNo");
	}

	@Override
	public void updateRefOrder(GetReplyInfo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyBoard_ref", vo.getReplyBoard_ref());
		map.put("replyBoard_refOrder", vo.getReplyBoard_refOrder());
		map.put("board_no", vo.getBoard_no());

		ses.update(ns + ".refOrderUpdate", map);

	}

	@Override
	public void insertReplyBoardQA(InsertReplyQABoardDTO dto, int replyBoard_ref) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", dto.getBoard_no());
		map.put("member_id", dto.getMember_id());
		map.put("replyBoard_content", dto.getReplyBoard_content());
		map.put("replyBoard_ref", replyBoard_ref);

		ses.insert(ns + ".parentReply", map);

	}

	@Override
	public void insertChildReplyBoardQA(GetReplyInfo vo, InsertReplyQABoardDTO dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", vo.getBoard_no());
		map.put("member_id", dto.getMember_id());
		map.put("replyBoard_content", dto.getReplyBoard_content());
		map.put("replyBoard_ref", vo.getReplyBoard_ref());
		map.put("replyBoard_refOrder", vo.getReplyBoard_refOrder());
		map.put("replyBoard_step", vo.getReplyBoard_step());
		
		ses.insert(ns + ".insertReply", map);

	}

	@Override
	public int updateReplyBoardQA(UpdateReplyQABoardDTO dto) throws Exception {
		return ses.update(ns + ".updateReply", dto);
	}

	@Override
	public int deleteReplyBoardQA(int replyBoard_no) throws Exception {
		return ses.delete(ns + ".deleteReply", replyBoard_no);
	}

	@Override
	public List<ReplyBoardVO> getReplyListBoardQA(int board_no) throws Exception {
		return ses.selectList(ns + ".replyList", board_no);
	}

	@Override
	public GetReplyInfo getParentReplyInfo(int replyBoard_no) throws Exception {
		return ses.selectOne(ns + ".getParentReply", replyBoard_no);
	}

	@Override
	public int getReplyCnt(int board_no) throws Exception {
		return ses.selectOne(ns + ".getReplyCnt", board_no);
	}

}