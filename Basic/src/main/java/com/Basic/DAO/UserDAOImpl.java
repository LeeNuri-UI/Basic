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
    
    @Override
    public UserVO Login(UserVO uv) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".Login", uv);
    }

}
