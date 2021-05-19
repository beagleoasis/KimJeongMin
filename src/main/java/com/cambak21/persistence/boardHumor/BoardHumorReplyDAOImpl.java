package com.cambak21.persistence.boardHumor;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyBoardVO;

@Repository
public class BoardHumorReplyDAOImpl implements BoardHumorReplyDAO {
	
	@Inject
	private SqlSession ses;
	
	private static final String namespace = "com.cambak21.mapper.boardHumorReplyMapper";
	
	@Override
	public List<ReplyBoardVO> read(int board_no) throws Exception {
		System.out.println(board_no);
		return ses.selectList(namespace + ".read", board_no);
		
	}

	@Override
	public void create(ReplyBoardVO vo) throws Exception {
		ses.insert(namespace + ".insert", vo);
		
	}

	@Override
	public void delete(int board_no) throws Exception {
		System.out.println(board_no);
		ses.delete(namespace + ".delete", board_no);
		
	}

	@Override
	public void update(ReplyBoardVO vo) throws Exception {
		ses.update(namespace + ".update", vo);
		
		
	}

	@Override
	public void deleteAll(int board_no) throws Exception {
		ses.delete(namespace + ".deleteAll", board_no);
		
	}

}
