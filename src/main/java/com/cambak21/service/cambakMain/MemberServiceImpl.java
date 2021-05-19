package com.cambak21.service.cambakMain;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.ChangeMemberInfoDTO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.dto.UpdateMemberDTO;
import com.cambak21.persistence.cambakMain.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public boolean memberUpdate(UpdateMemberDTO dto) throws Exception {
		boolean result = false;
		int i = dao.memberUpdate(dto);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}
	public MemberVO memberSelect(String memberId) throws Exception{
		return dao.memberSelect(memberId);
	}
	

	@Override
	public boolean memberDelCheck(LoginDTO dto) throws Exception {
		boolean result = false;
		int i = dao.memberDelCheck(dto);
		if(i == 1) {
			result = true;
		}
		return result;
	}
	
	//--------------------------------------------------------------- 서효원 service ---------------------------------------------------------------
	@Override
	public boolean checkUserId(String member_id) throws Exception {
		// 유저가 작성한 ID 중복 확인
		boolean result = false;
		if (dao.checkUserId(member_id) == 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean checkRegisterEmail(String userEmail) throws Exception {
		// 작성한 ID가 사용가능한지 확인하는 메서드
		boolean result = false;
		
		if (dao.checkRegisterEmail(userEmail) == 0) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean memberInsert(MemberVO vo) throws Exception {
		// 유저가 작성한 회원 정보 저장
		boolean result = false;
		
		if (dao.memberInsert(vo) == 1) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean loginRequestCheck(LoginDTO dto) throws Exception {
		boolean result = false;
		if (dao.loginRequestCheck(dto) == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean updateMemberInfo(ChangeMemberInfoDTO dto) throws Exception {
		boolean result = false;
		int i = dao.updateMemberInfo(dto);
		if(i == 1) {
			
			
			result = true;
		}
		return result;
	}
	
	@Override
	public MemberVO sesUserInfoChange(String member_id) throws Exception {
		return dao.sesUserInfoChange(member_id);
	}
	
	@Override
	public boolean modifyCheckUser(String member_id, String member_password) throws Exception {
		boolean result = false;
		if (dao.modifyCheckUser(member_id, member_password) == 1) result = true;
		return result;
	}
	
	@Override
	public boolean userKakaoInterlock(Date interlockDate, String userKakaoId, String member_id) throws Exception {
		boolean result = false;
		if (dao.userKakaoInterlock(interlockDate, userKakaoId, member_id) != 0) result = true;
		return result;
	}
	
	@Override
	public boolean kakaoRelease(String member_id, Date defaultDate) throws Exception {
		boolean result = false;
		if (dao.kakaoRelease(member_id, defaultDate) != 0) result = true;
		return result;
	}
	
	@Override
	public MemberVO kakaoLogin(String userKakaoId) throws Exception {
		return dao.kakaoLogin(userKakaoId);
	}
	
	//--------------------------------------------------------------- 서효원 service ---------------------------------------------------------------
	
	@Override
	public List<FindIdVO> findId(FindIdVO fId) throws Exception {
		return dao.findId(fId);
	}

	@Override
	public FindIdVO findPwd(FindIdVO fId) throws Exception {
		return dao.findPwd(fId);
	}

	@Override
	public boolean updatePwd(FindIdVO fId) throws Exception {
		boolean result = false;
		
		int i = dao.updatePwd(fId);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean checkEmail(FindIdVO fId) throws Exception {
		boolean result = false;
		
		int i = dao.checkEmail(fId);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}	

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception {
		return dao.checkUserWithSesKey(member_cookie);
	}

	@Override
	public void keepLogin(String member_id, String sesId, Date cookieAge) throws Exception {
		dao.keepLogin(member_id, sesId, cookieAge);
	}

	@Override
	public boolean memberDelete(LoginDTO dto) throws Exception {
		dao.login(dto);
		boolean result = false;
		int i = dao.memberDel(dto);
		if(i == 1) {
			
			result = true;
			
		}
		System.out.println(result);
		return result;
	}
	@Override
	public boolean memberDelete(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	

}
