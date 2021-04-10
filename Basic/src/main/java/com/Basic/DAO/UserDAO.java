package com.Basic.DAO;

import java.util.List;
import com.Basic.Domain.UserVO;

public interface UserDAO {
	public void Insert(UserVO uv) throws Exception;
	
	public UserVO Login(UserVO uv) throws Exception;
}
