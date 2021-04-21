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
	
    //댓글 작성
    @Override
    public void commentsIsert(BoCommentVO bcv) throws Exception {
        sqlSession.insert(namespace+".commentsIsert", bcv);
	} 
    
    //댓글 조회
    @Override
    public List<BoCommentVO> list(int bnum) throws Exception {
    	
    	return sqlSession.selectList(namespace+".commectsList", bnum);
	}
    
    //댓글 수정
    @Override
    public void updateComments(BoCommentVO bcv) throws Exception {
    	sqlSession.update(namespace+".updateComments", bcv);
	}
    
    //댓글 삭제
    @Override
    public void deleteComments(int conum) throws Exception {
    	sqlSession.update(namespace+".deleteComments", conum);
	}
}
