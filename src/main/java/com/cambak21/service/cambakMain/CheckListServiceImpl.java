package com.cambak21.service.cambakMain;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.CheckListVO;
import com.cambak21.persistence.cambakMain.CheckListDAO;



@Service
public class CheckListServiceImpl implements CheckListService {

	@Inject
	private CheckListDAO dao;
	
	
	@Override
	public List<CheckListVO> getCheckListAll(String member_id) throws Exception {
		 return dao.getCheckListAll(member_id);
	}


	@Override
	public boolean changeCheckList(String checkList_checked, int check_List_no) throws Exception {
		boolean result = false;
		int i = dao.changeCheckList(checkList_checked, check_List_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
		
	}


	@Override
	public boolean deleteThis(int checkList_no) throws Exception {
		boolean result = false;
		int i = dao.deleteThis(checkList_no);
		
		if(i == 1) {
			result = true;
		}
		return result;
	}


	@Override
	public boolean saveList(CheckListVO vo) throws Exception {
		boolean result = false;
		int i = dao.saveList(vo);
		
		if(i == 1) {
			result = true;
		}
		return result;
	}


	@Override
	public boolean deleteThisAll(String member_id) throws Exception {
		boolean result = false;
		int i = dao.deleteThisAll(member_id);
		
		if(i >= 1) {
			result = true;
		}
		return result;
	}


	@Override
	public int getChkListYet(String member_id) throws Exception {
			return dao.getChkListYet(member_id);
	}


	@Override
	public int getChkListAll(String member_id) throws Exception {
		return dao.getChkListAll(member_id);
	}
	

}
