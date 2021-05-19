package com.cambak21.service.boardCS;

import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;
import com.cambak21.persistence.boardCS.ReplyBoardCsDAO;

@Service
public class ReplyBoardCsServiceImpl implements ReplyBoardCsService {

	@Inject
	private ReplyBoardCsDAO dao;

	/**
	 * @Method Name : insertReplyBoardCS
	 * @작성일 : 2021. 3. 18.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 
	 * 1. Controller단에서 dto를 보냄
	 * 2. dto.getBoard_no로 부모댓글 작성인지, 자식댓글인지 판단
	 * 3. board_no가 -1일 경우 대댓글
	 * @param dto : view단에서 부터 넘어온 댓글 정보
	 * @throws Exception
	 */
	@Transactional
	@Override
	public void insertReplyBoardCS(InsertReplyCSBoardDTO dto) throws Exception {
		// 부모댓글과 대댓글을 여기서 처리함
		// 부모댓글과 대댓글 구분은 board_no가 0인지 아닌지로 판단
		// board_no가 -1이면 자식댓글, 아니면 부모댓글임
		
		if (dto.getBoard_no() == -1) {
			// replyBoard_no(부모댓글의no)로 부모댓글의 작성자, ref, reforder, step, board_no 가져온다
			GetReplyInfo parentReplyInfo = dao.getParentReplyInfo(dto.getReplyBoard_no());
			// 부모댓글의 정보가 담긴 객체를 보내서 reforder를 업데이트 시켜준다
			dao.updateRefOrder(parentReplyInfo);
			// 부모댓글의 정보가 담긴객체와 컨트롤러단에서 넘어온 dto(대댓글 댓글내용, 대댓글 작성자)를 보내줌
			dao.insertChildReplyBoardCs(parentReplyInfo, dto);
		} else {
			// getRefMax : 현재 댓글 번호들의 max()
			dao.insertReplyBoardCS(dto, dao.getRefMax() + 1);
		}
	}

	@Override
	public int updateReplyBoardCS(UpdateReplyCSBoardDTO dto) throws Exception {
		
		return dao.updateReplyBoardCS(dto);
		
	}

	@Override
	public int deleteReplyBoardCS(int replyBoard_no) throws Exception {
		
		return dao.deleteReplyBoardCS(replyBoard_no);
	}

	@Override
	public Map<String, Object> getReplyListBoardCS(int board_no) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyList", dao.getReplyListBoardCS(board_no));
		map.put("replyCnt", dao.getReplyCnt(board_no));
		return map;
	}
}
