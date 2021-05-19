package com.cambak21.persistence.boardNotice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyBoardVO;

@Repository
public class NoticeReplyDAOImpl implements NoticeReplyDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.cambakBoard.BoardNotice";
	
	
	@Override
	public List<ReplyBoardVO> listNoticeReply(int bno) throws Exception {
		System.out.println("ReplyBoard 불러오기~~ ~~");
		return ses.selectList(namespace + ".listNoticeReply", bno);
	}


	@Override
	public void modiReplyBoard(ReplyBoardVO vo) throws Exception {
		System.out.println("replyBoard 수정~");
			ses.update(namespace + ".modiReplyBoard", vo);
		
	}


	@Override
	public void insertReplyBoard(ReplyBoardVO vo) throws Exception {
			ses.insert(namespace + ".insertReplyBoard", vo);
		
	}


	@Override
	public int getboard_no(int replyBoard_no) throws Exception {
		return ses.selectOne(namespace + ".getboard_no", replyBoard_no);
	}


	@Override
	public int dropReply(int replyBoard_no) throws Exception {
		return ses.delete(namespace + ".dropReply", replyBoard_no);
		
	}


	@Override
	public void dropReplyAll(int board_no) throws Exception {
			ses.delete(namespace + ".dropReplyAll", board_no);
	}

}
