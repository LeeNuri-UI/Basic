package com.Basic.DAO;

import java.util.List;

import javax.inject.Inject;

import com.Basic.Domain.BoardVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
    private SqlSession sqlSession;
	
    private static String namespace = "com.Basic.Mapper.UserMapper";
    
    //게시판추가
	@Override
    public void BoardInsert(BoardVO bv) throws Exception {
        sqlSession.insert(namespace+".BoardInsert", bv);
	}    
	
    @Override
    public List<BoardVO> ListAll() throws Exception {
        
        return sqlSession.selectList(namespace+".ListBoard");
        
    }
    
    @Override
    public BoardVO Detail(Integer bnum) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".DetailView", bnum);    
    	
    }
    
    @Override
    public void Update(BoardVO bv) throws Exception {
    	
    	sqlSession.update(namespace+".UpdateBoard", bv);    
    	
	}
    
    @Override
    public void delete(int bnum) throws Exception {
    	
    	sqlSession.update(namespace+".delete", bnum);    
    	
	}

}
