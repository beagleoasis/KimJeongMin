package com.cambak21.service.boardNotice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.persistence.boardNotice.BoardNoticeDAO;
import com.cambak21.persistence.boardNotice.NoticeReplyDAO;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {

	@Inject
	private NoticeReplyDAO rdao;
	
	@Inject
	private BoardNoticeDAO bdao;
	
	@Override
	public List<ReplyBoardVO> listNoticeReply(int bno) throws Exception {
		return rdao.listNoticeReply(bno);  	
	}

	@Override
	public void modiReplyBoard(ReplyBoardVO vo) throws Exception {
			rdao.modiReplyBoard(vo);
	}
	
	@Transactional
	@Override
	public void insertReplyBoard(ReplyBoardVO vo) throws Exception {
		rdao.insertReplyBoard(vo);
		bdao.updateNoticeReivewCnt(vo.getBoard_no(), 1);
		
		
	}
	
	
	@Transactional
	@Override
	public boolean dropReply(int no) throws Exception {
		boolean result = false;
		
		
		int i = rdao.dropReply(no);
		if(i == 1) {
			result = true;
		}
		
		
		return result;
	}

}
