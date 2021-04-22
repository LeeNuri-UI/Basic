package com.Basic.Service;

import java.util.List;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.UserVO;
import com.Basic.DAO.UserDAO;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
    private UserDAO ud;
	
	//회원가입
	@Override
    public void insert(UserVO uv) throws Exception {
		
		ud.insert(uv); 
    }
	
	//아이디 중복체크
	@Override
	public int idChk(UserVO uv) throws Exception {
		
		int result = ud.idChk(uv);
		return result;
	}
	
	//닉네임 중복체크
	@Override
	public int unameChk(UserVO uv) throws Exception {
		
		int result = ud.unameChk(uv);
		return result;
	}
	
	//로그인
	@Override
    public UserVO login(UserVO uv) throws Exception {
		
		return ud.login(uv);
    }
	
	//비밀번호 확인
	@Override
	public int pwUdate(UserVO uv) throws Exception {
		
		int result = ud.pwUdate(uv);
		return result;
	}
	
	//비밀번호 변경하기
 	@Override
    public void pwUdateGo(UserVO uv) throws Exception {
 		
 		ud.pwUdateGo(uv);
    }
 	
 	//닉네임 변경하기
 	@Override
    public void nickUpdateGo(UserVO uv) throws Exception {
 		
 		ud.nickUpdateGo(uv);
    }

}
