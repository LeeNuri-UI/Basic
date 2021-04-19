package com.Basic.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Basic.Domain.BoCommentVO;


@Repository
public class CommentsDAOImpl implements CommentsDAO{
	
	@Inject
    private SqlSession sqlSession;
	
    private static String namespace = "com.Basic.Mapper.UserMapper";
	
    @Override
    public void commentsIsert(BoCommentVO bcv) throws Exception {
        sqlSession.insert(namespace+".commentsIsert", bcv);
	} 
    
    @Override
    public List<BoCommentVO> list(int bnum) throws Exception {
    	return sqlSession.selectList(namespace+".commectsList", bnum);
	}
}
