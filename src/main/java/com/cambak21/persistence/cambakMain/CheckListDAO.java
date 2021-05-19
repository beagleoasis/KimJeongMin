package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListDAO {
	
	public List<CheckListVO> getCheckListAll(String member_id) throws Exception;

	public int changeCheckList(String checkList_checked, int checkList_no) throws Exception;
	
	public int deleteThis(int checkList_no) throws Exception;

	public int saveList(CheckListVO vo) throws Exception;

	public int deleteThisAll(String member_id) throws Exception;
	
	public int getChkListYet(String member_id) throws Exception;
	
	public int getChkListAll(String member_id) throws Exception;
}
