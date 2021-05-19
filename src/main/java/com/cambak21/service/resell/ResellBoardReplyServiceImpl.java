package com.cambak21.service.resell;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.persistence.resell.ResellBoardDAO;
import com.cambak21.persistence.resell.ResellBoardReplyDAO;
@Service
public class ResellBoardReplyServiceImpl implements ResellBoardReplyService {
	@Inject
	private ResellBoardReplyDAO rdao;
	@Inject
	private ResellBoardDAO bdao;
	@Override	
	public boolean ResellBoardReplyInsert(ReplyResellVO vo) throws Exception {
		System.out.println("service : "+vo);
		boolean result = false;
		int i = rdao.ResellBoardReplyInsert(vo);
		if (i == 1) {
			result = true;
			bdao.ResellBoardUpdateReply(vo.getResellBoard_no(), 1);
		}
	
		return result;
		
	}

	@Override
	public List<ReplyResellVO> ResellBoardReplyRead(int bno) throws Exception {
		List<ReplyResellVO> vo = rdao.ResellBoardReplyRead(bno);
		return vo;
	}

	@Override
	public void ResellBoardUpadte(ResellBoardVO vo) throws Exception {
		rdao.ResellBoardUpadte(vo);

	}

	@Override
	public void ResellBoardReplyDelete(int no) throws Exception {
		int bno = rdao.ResellBoardGetBno(no);
		rdao.ResellBoardReplyDelete(no);
		bdao.ResellBoardUpdateReply(bno, -1);
	}


}
