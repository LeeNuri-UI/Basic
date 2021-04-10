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
	 	
	@Override
    public void Insert(UserVO uv) throws Exception {
		
		ud.Insert(uv); 
    }
	
	@Override
    public UserVO Login(UserVO uv) throws Exception {
		System.out.println("/LoginAction POST방식 입니다. 왔나요?22");
		return ud.Login(uv);
    }

}
