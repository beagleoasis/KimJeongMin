package com.cambak21.persistence.cambakMain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.ChangeMemberInfoDTO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.dto.UpdateMemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession ses;
	private String namespace = "com.mappers.cambakMain.memeberMapper";

	@Override
	public int memberUpdate(UpdateMemberDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".MemberUpdate",dto);
	}
	@Override
	public MemberVO memberSelect(String memberId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(memberId);
		return ses.selectOne(namespace+".memberSelect",memberId);
	}
	@Override
	public int memberDelete(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int memberDelCheck(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace + ".memberDelCheck", dto);
	}


	//--------------------------------------------------------------- 서효원 dao ---------------------------------------------------------------
	@Override
	public int checkUserId(String member_id) throws Exception {
		// 유저가 작성한 ID 중복 확인
		return ses.selectOne(namespace + ".checkUserId", member_id);
	}
	
	@Override
	public int checkRegisterEmail(String userEmail) throws Exception {
		// 작성한 ID가 사용가능한지 확인하는 메서드
		return ses.selectOne(namespace + ".registerEmailChk", userEmail);
	}
	
	@Override
	public int memberInsert(MemberVO vo) throws Exception {
		// 유저가 작성한 회원 정보 저장
		return ses.insert(namespace + ".MemberInsert", vo);
	}
	
	@Override
	public int loginRequestCheck(LoginDTO dto) throws Exception {
		return ses.selectOne(namespace + ".loginRequestCheck", dto);
	}
	
	@Override
	public int updateMemberInfo(ChangeMemberInfoDTO dto) throws Exception {
		return ses.update(namespace + ".updateMemberInfo", dto);
	}
	
	@Override
	public MemberVO sesUserInfoChange(String member_id) throws Exception {
		return ses.selectOne(namespace + ".memberSelect", member_id);
	}
	
	@Override
	public int modifyCheckUser(String member_id, String member_password) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("member_password", member_password);
		return ses.selectOne(namespace + ".modifyCheckUser", param);
	}
	
	@Override
	public int userKakaoInterlock(Date interlockDate, String userKakaoId, String member_id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("interlockDate", interlockDate);
		param.put("userKakaoId", userKakaoId);
		return ses.update(namespace + ".userKakaoInterlock", param);
	}
	
	@Override
	public int kakaoRelease(String member_id, Date defaultDate) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("defaultDate", defaultDate);
		return ses.update(namespace + ".kakaoRelease", param);
	}
	
	//--------------------------------------------------------------- 서효원 dao ---------------------------------------------------------------
	
	@Override
	public List<FindIdVO> findId(FindIdVO fId) throws Exception {
		return ses.selectList(namespace + ".findId", fId);
	}

	@Override
	public FindIdVO findPwd(FindIdVO fId) throws Exception {
		return ses.selectOne(namespace + ".findPwd", fId);
	}

	@Override
	public int updatePwd(FindIdVO fId) throws Exception {
		return ses.update(namespace + ".updatePwd", fId);
	}

	@Override
	public int checkEmail(FindIdVO fId) throws Exception {
		return ses.selectOne(namespace + ".checkEmail", fId);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return ses.selectOne(namespace + ".login", dto);
	}

	@Override
	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception {
		return ses.selectOne(namespace + ".checkUserWithSesKey", member_cookie);
	}

	@Override
	public void keepLogin(String member_id, String member_cookie, Date member_cookieAge) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("member_id", member_id);
		paraMap.put("member_cookie", member_cookie);
		paraMap.put("member_cookieAge", member_cookieAge);
		ses.update(namespace + ".keepLogin", paraMap);
	}

	@Override
	public int memberDel(LoginDTO dto) throws Exception {
		return ses.update(namespace + ".MemberDelete", dto);
	}
	@Override
	public MemberVO kakaoLogin(String userKakaoId) throws Exception {
		return ses.selectOne(namespace + ".kakaoLogin", userKakaoId);
	}
	
}
