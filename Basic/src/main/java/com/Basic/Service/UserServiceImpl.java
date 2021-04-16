package com.Basic.Service;

import java.util.List;
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
    public void Insert(UserVO uv) throws Exception {
		
		ud.Insert(uv); 
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
    public UserVO Login(UserVO uv) throws Exception {
		
		return ud.Login(uv);
    }

}
