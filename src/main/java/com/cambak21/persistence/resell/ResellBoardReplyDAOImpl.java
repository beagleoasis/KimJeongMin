package com.cambak21.persistence.resell;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardVO;
@Repository
public class ResellBoardReplyDAOImpl implements ResellBoardReplyDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.cambak21.mapper.ResellBoardReplyMapper";
	@Override
	public int ResellBoardReplyInsert(ReplyResellVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardReplyInsert",vo);
	}

	@Override
	public List<ReplyResellVO> ResellBoardReplyRead(int bno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(bno);
		return ses.selectList(namespace+".ResellBoardReplyRead",bno);
	}

	@Override
	public void ResellBoardUpadte(ResellBoardVO vo) throws Exception {
		ses.update(namespace+".ResellBoardVO",vo);
	}

	@Override
	public void ResellBoardReplyDelete(int no) throws Exception {
		ses.delete(namespace+".ResellBoardReplyDelete",no);

	}

	@Override
	public int ResellBoardGetBno(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReplyDelete",no);
	}

}
