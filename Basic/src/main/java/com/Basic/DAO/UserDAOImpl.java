package com.Basic.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import com.Basic.Domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	
	private SqlSession sqlSession;

	@Inject
    public UserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static String namespace = "com.Basic.Mapper.UserMapper";
	
	//회원가입
    @Override
    public void Insert(UserVO uv) throws Exception {
        
        sqlSession.insert(namespace+".UserInsert", uv);
    }
    //아이디 중복 체크
    @Override
    public int idChk(UserVO uv) throws Exception {
    	
    	int result = sqlSession.selectOne(namespace+".idChk", uv);
    	return result;
    }
    
    //닉네임 중복 체크
    @Override
    public int unameChk(UserVO uv) throws Exception {
    	
    	int result = sqlSession.selectOne(namespace+".unameChk", uv);
    	return result;
    }
    
    //로그인
    @Override
    public UserVO Login(UserVO uv) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".Login", uv);
    }
    
   

}
