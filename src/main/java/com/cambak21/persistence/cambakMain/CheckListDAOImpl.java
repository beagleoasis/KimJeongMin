package com.cambak21.persistence.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.CheckListVO;

@Repository
public class CheckListDAOImpl implements CheckListDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.cambakMain.CheckListMapper";
	
	@Override
	public List<CheckListVO> getCheckListAll(String member_id) throws Exception {
			return ses.selectList(namespace + ".getCheckListAll", member_id);
	}

	@Override
	public int changeCheckList(String checkList_checked, int checkList_no) throws Exception {
		Map<String, Object> para = new HashMap<String, Object>();
		para.put("checkList_checked", checkList_checked);
		para.put("checkList_no", checkList_no);
		
		return ses.update(namespace + ".changeCheckList", para);
	}

	@Override
	public int deleteThis(int checkList_no) throws Exception {
		return ses.delete(namespace + ".deleteThis", checkList_no);
	}

	@Override
	public int saveList(CheckListVO vo) throws Exception {
		return ses.insert(namespace + ".saveList", vo);
	}

	@Override
	public int deleteThisAll(String member_id) throws Exception {
		return ses.delete(namespace + ".deleteThisAll", member_id);
	}

	@Override
	public int getChkListYet(String member_id) throws Exception {
		return ses.selectOne(namespace + ".getChkListYet", member_id);
		
	}
	
	@Override
	public int getChkListAll(String member_id) throws Exception {
		return ses.selectOne(namespace + ".getChkListAll", member_id);
		
	}

}
