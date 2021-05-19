package com.cambak21.service.boardQA;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyQABoardDTO;
import com.cambak21.dto.UpdateReplyQABoardDTO;
import com.cambak21.persistence.boardQA.ReplyBoardQADAO;

@Service
public class ReplyBoardQAServiceImpl implements ReplyBoardQAService {
	
	@Inject
	private ReplyBoardQADAO dao;

	@Transactional
	@Override
	public void insertReplyBoardQA(InsertReplyQABoardDTO dto) throws Exception {
		// 부모댓글과 대댓글을 여기서 처리함
		// 부모댓글과 대댓글 구분은 board_no가 0인지 아닌지로 판단
		// board_no가 0이면 부모댓글, 아니면 대댓글임
		
		if (dto.getBoard_no() == 0) {
			// replyBoard_no(부모댓글의no)로 부모댓글의 작성자, ref, reforder, step, board_no 가져온다
			GetReplyInfo parentReplyInfo = dao.getParentReplyInfo(dto.getReplyBoard_no()); 
			// 부모댓글의 정보가 담긴 객체를 보내서 reforder를 업데이트 시켜준다
			dao.updateRefOrder(parentReplyInfo);
			// 부모댓글의 정보가 담긴객체와 컨트롤러단에서 넘어온 dto(대댓글 댓글내용, 대댓글 작성자)를 보내줌
			dao.insertChildReplyBoardQA(parentReplyInfo, dto);
		} else {
			// getRefMax : 현재 댓글 번호들의 max()
			dao.insertReplyBoardQA(dto, dao.getRefMax() + 1);
		}
	}

	@Override
	public int updateReplyBoardQA(UpdateReplyQABoardDTO dto) throws Exception {
		return dao.updateReplyBoardQA(dto);
	}

	@Override
	public int deleteReplyBoardQA(int replyBoard_no) throws Exception {
		return dao.deleteReplyBoardQA(replyBoard_no);
	}

	@Override
	public List<ReplyBoardVO> getReplyListBoardQA(int board_no) throws Exception {
		return dao.getReplyListBoardQA(board_no);
	}
	
}