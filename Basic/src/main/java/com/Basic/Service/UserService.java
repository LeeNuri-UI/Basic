package com.Basic.Service;

import java.util.List;
import com.Basic.Domain.UserVO;

public interface UserService {
	
	public void Insert(UserVO uv) throws Exception;
	
	public UserVO Login(UserVO uv) throws Exception;
	
}
