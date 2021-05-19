package com.cambak21.persistence.boardCS;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;

@Repository
public class ReplyBoardCsDAOImpl implements ReplyBoardCsDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.cambakBoard.ReplyBoardCS";

	/**
	  * @Method Name : getRefMax
	  * @작성일 : 2021. 3. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 부모댓글의 ref를 넣기위한 메서드
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getRefMax() throws Exception {

		return ses.selectOne(ns + ".maxBoardNo");
	}

	/**
	  * @Method Name : updateRefOrder
	  * @작성일 : 2021. 3. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 계층형을 위한 refOrder 업데이트 메서드
	  * @param vo : 부모 댓글의 정보들이 담긴 객체
	  * @throws Exception
	  */
	@Override
	public void updateRefOrder(GetReplyInfo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyBoard_ref", vo.getReplyBoard_ref());
		map.put("replyBoard_refOrder", vo.getReplyBoard_refOrder());
		map.put("board_no", vo.getBoard_no());

		ses.update(ns + ".refOrderUpdate", map);
	}
	
	/**
	  * @Method Name : insertReplyBoardCS
	  * @작성일 : 2021. 3. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 부모 댓글 insert
	  * @param dto : 컨트롤러단에서 넘어온 객체
	  * @param replyBoard_ref : getRefMax() + 1
	  * @throws Exception
	  */
	@Override
	public void insertReplyBoardCS(InsertReplyCSBoardDTO dto, int replyBoard_ref) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", dto.getBoard_no());
		map.put("member_id", dto.getMember_id());
		map.put("replyBoard_content", dto.getReplyBoard_content());
		map.put("replyBoard_ref", replyBoard_ref);

		ses.insert(ns + ".parentReply", map);
	}

	/**
	  * @Method Name : insertChildReplyBoardCs
	  * @작성일 : 2021. 3. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 자식댓글 insert 메서드
	  * @param vo : 부모댓글의 정보가 담긴 객체
	  * @param dto : 컨트롤러 단에서 넘어온 자식댓글의 정보가 담긴 객체
	  * @throws Exception
	  */
	@Override
	public void insertChildReplyBoardCs(GetReplyInfo vo, InsertReplyCSBoardDTO dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", vo.getBoard_no());
		map.put("member_id", dto.getMember_id());
		map.put("replyBoard_content", dto.getReplyBoard_content());
		map.put("replyBoard_ref", vo.getReplyBoard_ref());
		map.put("replyBoard_refOrder", vo.getReplyBoard_refOrder());
		map.put("replyBoard_step", vo.getReplyBoard_step());
		System.out.println("다오단 vo : " + vo.toString());
		System.out.println("다오단 dto : " + dto.toString());
		ses.insert(ns + ".insertReply", map);
	}

	@Override
	public int updateReplyBoardCS(UpdateReplyCSBoardDTO dto) throws Exception {
		
		return ses.update(ns + ".updateReply", dto);
	}

	@Override
	public int deleteReplyBoardCS(int replyBoard_no) throws Exception {
		
		return ses.delete(ns + ".deleteReply", replyBoard_no);
	}

	@Override
	public List<ReplyBoardVO> getReplyListBoardCS(int board_no) throws Exception {
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
