package com.cambak21.persistence.boardHumor;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface BoardHumorReplyDAO {
	public List<ReplyBoardVO> read(int bno) throws Exception;
	
	public void create(ReplyBoardVO vo) throws Exception;
	
	public void delete(int board_no) throws Exception;
	
	public void update(ReplyBoardVO vo) throws Exception;
	
	public void deleteAll(int board_no) throws Exception;
}
