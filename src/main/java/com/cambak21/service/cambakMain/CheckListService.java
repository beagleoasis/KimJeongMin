package com.cambak21.service.cambakMain;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListService {

	public List<CheckListVO> getCheckListAll(String member_id) throws Exception;
	
	public boolean changeCheckList(String checkList_checked, int check_List_no) throws Exception;
	
	public boolean deleteThis(int checkList_no) throws Exception;
	
	public boolean saveList(CheckListVO vo) throws Exception;
	
	public boolean deleteThisAll(String member_id) throws Exception;
	
	public int getChkListYet(String member_id) throws Exception;

	public int getChkListAll(String member_id) throws Exception;
}
