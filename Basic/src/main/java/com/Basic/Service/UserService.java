package com.Basic.Service;

import java.util.List;
import com.Basic.Domain.UserVO;

public interface UserService {
	
	public void insert(UserVO uv) throws Exception; //회원가입
	
	public int idChk(UserVO uv) throws Exception; //아이디 중복 체크
	
	public int unameChk(UserVO uv) throws Exception; //닉네임 중복 체크
	
	public UserVO login(UserVO uv) throws Exception; //로그인
	
}
