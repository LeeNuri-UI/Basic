package com.Basic.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.Basic.Domain.BoardVO;
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
    public void insert(UserVO uv) throws Exception {
        
        sqlSession.insert(namespace+".userInsert", uv);
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
    public UserVO login(UserVO uv) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".login", uv);
    }
    
    //비밀번호 확인하기
    @Override
    public int pwUdate(UserVO uv) throws Exception {
    	
    	int result = sqlSession.selectOne(namespace+".pwUdate", uv);
    	return result;
    }
    
    //비밀번호 변경하기
    @Override
    public void pwUdateGo(UserVO uv) throws Exception {
    	
    	sqlSession.update(namespace+".pwUdateGo", uv);     	
	}
    
    //닉네임 변경하기
    @Override
    public void nickUpdateGo(UserVO uv) throws Exception {
    	
    	sqlSession.update(namespace+".nickUpdateGo", uv);     	
	}
   

}
