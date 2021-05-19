package com.cambak21.persistence.resell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.util.PagingCriteria;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.SearchCriteria;
import com.cambak21.dto.ResellBoardDeteDTO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.dto.ResellLikeBoardInsertDTO;
@Repository
public class ResellBoardDAOImpl implements ResellBoardDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.cambak21.mapper.ResellBoardMapper";
	@Override
	public int ResellBoardInsert(ResellBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardInsert",vo);
	}
	@Override
	public List<ResellBoardVO> ResellBoardReadAll(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		System.out.println((cri.getPage()-1)*cri.getPerPageNum());
		param.put("pageStart",(cri.getPage()-1)*cri.getPerPageNum());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(namespace+".ResellBoardReadAll",param);
	}
	@Override
	public int ResellBoardReadAllCnt() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReadAllCnt");
	}
	@Override
	public List<ResellBoardVO> ResellBoardRead(PagingCriteria cri, SearchCriteria scri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchType", scri.getSearchType());
		param.put("searchWord", scri.getSearchWord());
		param.put("pageStert", cri.getPageStart());
		param.put("pageNum", cri.getPerPageNum());
		
		return ses.selectList(namespace+".ResellBoardRead",param);
	}
	@Override
	public int ResellBoardReadCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReadCnt",scri);
	}
	@Override
	public int ResellBoardUpdate(ResellBoardUpdateDTO dto) throws Exception {
		System.out.println(dto);
		// TODO Auto-generated method stub
		return ses.update(namespace+".ResellBoardUpdate",dto);
	}
	@Override
	public int ResellBoardDelete(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".ResellBoardDelete",no);
	}
	@Override
	public void ResellBoardViewcnt(int no) throws Exception {
		ses.update(namespace+".ResellBoardViewcnt",no);
		
	}
	@Override
	public void ResellBoardUpdateReply(int no, int amount) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("amount", amount);
		param.put("no", no);
		ses.update(namespace+".ResellBoardUpdateReply",param);
		
	}
	@Override
	public ResellBoardVO ResellBoardReadDetail(int no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReadDetail",no);
	}

	


}
