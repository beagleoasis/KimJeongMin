package com.cambak21.service.cambakMain;

import java.util.Date;
import java.util.List;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.ChangeMemberInfoDTO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.dto.UpdateMemberDTO;

public interface MemberService {
	
	/**
	 * @Method Name : MemberUpdate
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김태훈
	 * @변경이력 : 
	 * @Method 설명 : 멤버 정보를 수정하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean memberUpdate(UpdateMemberDTO dto) throws Exception;
	
	public MemberVO memberSelect(String memberId) throws Exception;
	
	/**
	 * @Method Name : memberDelete
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김대기
	 * @변경이력 : 
	 * @Method 설명 : 회원 탈퇴시, 탈퇴 컬럼을 변경하는 메서드
	 * @param member_id
	 * @return
	 * @throws Exception
	 */
	public boolean memberDelete(String member_id) throws Exception;
	

	public boolean memberDelCheck(LoginDTO dto)throws Exception;
	
	/**
	 * @Method Name : memberInsert
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 작성한 ID가 사용가능한지 확인하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean checkUserId(String member_id) throws Exception;
	
	/**
	 * @Method Name : memberInsert
	 * @작성일 : 2021. 4. 9.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 작성한 email이 사용가능한지 확인하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean checkRegisterEmail(String userEmail) throws Exception;
	
	/**
	 * @Method Name : memberInsert
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 회원 가입시, 회원 정보를 저장하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean memberInsert(MemberVO vo) throws Exception;
	
	/**
	 * @Method Name : findId
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 김도연 / 2021.03.30 / String -> FindIdVo로 반환값 변경
	 * 2021. 3. 31 / 도연 / return 값 & 매개변수 변경
	 * @Method 설명 : 아이디 찾기시, 유저 이름과 이메일을 확인하여 일치하면 해당 아이디를 보여주는 메서드
	 * @param fId
	 * @return
	 * @throws Exception
	 */
	public List<FindIdVO> findId(FindIdVO fId) throws Exception;
	
	/**
	 * @Method Name : findPwd
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 2021. 3. 17 / 도연 / VO삭제로 인한 매개변수 변경
	 * 2021. 3. 31 / 도연 / return 값 & 매개변수 변경
	 * @Method 설명 : 비밀번호 찾기시, 유저 이름과 전화번호를 확인하여 일치하면 비밀번호 변경 페이지로 넘겨주는 메서드
	 * @param fId
	 * @return
	 * @throws Exception
	 */
	public FindIdVO findPwd(FindIdVO fId) throws Exception;
	
	/**
	 * @Method Name : updatePwd
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 2021. 3. 17 / 도연 / DTO 삭제로 인한 매개변수 변경
	 * 2021. 3. 31 / 도연 / 매개변수 변경
	 * @Method 설명 : 비밀번호 찾기시, 비밀번호를 변경해주는 메서드
	 * @param fId
	 * @return
	 * @throws Exception
	 */
	public boolean updatePwd(FindIdVO fId) throws Exception;
	
	/**
	 * @Method Name : checkEmail
	 * @작성일 : 2021. 3. 26.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 아이디/비밀번호 찾기시, 회원가입할때 등록한 이메일 번호가 맞는지 확인하는 메서드
	 * @param fId
	 * @return
	 * @throws Exception
	 */
	public boolean checkEmail(FindIdVO fId) throws Exception;
	
	/**
	 * @Method Name : login
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 장원영
	 * @변경이력 : 
	 * @Method 설명 : 로그인시, 일치하는 아이디와 비번이 있는지 확인하여 로그인상태로 변경해주는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public MemberVO checkUserWithSesKey(String member_cookie) throws Exception;
	
	public void keepLogin(String member_id, String sesId, Date cookieAge) throws Exception;
	
	public boolean memberDelete(LoginDTO dto) throws Exception;
	
//	서효원 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	public boolean loginRequestCheck(LoginDTO dto) throws Exception;
	public boolean updateMemberInfo(ChangeMemberInfoDTO dto) throws Exception;
	public MemberVO sesUserInfoChange(String member_id) throws Exception;
	public boolean modifyCheckUser(String member_id, String member_password) throws Exception;
	public boolean userKakaoInterlock(Date interlockDate, String userKakaoId, String member_id) throws Exception;
	public boolean kakaoRelease(String member_id, Date defaultDate) throws Exception;
	public MemberVO kakaoLogin(String userKakaoId) throws Exception;
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 서효원 파트

}
