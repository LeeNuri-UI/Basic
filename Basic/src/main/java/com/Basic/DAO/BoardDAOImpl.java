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
	
	//리스트
    @Override
    public List<BoardVO> ListAll() throws Exception {
        
        return sqlSession.selectList(namespace+".ListBoard");    
    }
    
    //상세보기
    @Override
    public BoardVO Detail(Integer bnum) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".DetailView", bnum);    	
    }
    
    //조회수
    @Override
	public void ViewCount(int bnum) throws Exception {
    	
		sqlSession.update(namespace+".ViewCount", bnum);
	}
    
    //수정하기
    @Override
    public void Update(BoardVO bv) throws Exception {
    	
    	sqlSession.update(namespace+".UpdateBoard", bv);     	
	}
    
    //삭제하기
    @Override
    public void delete(int bnum) throws Exception {
    	
    	sqlSession.update(namespace+".delete", bnum);    	
	}
    
    //이전글
    @Override
    public Integer Before(Integer bnum) throws Exception {
    	System.out.println("DAO"+bnum);
    	return sqlSession.selectOne(namespace+".Before", bnum);    	
	}
    
    //다음글
    @Override
    public Integer After(Integer bnum) throws Exception {
    	System.out.println("DAO"+bnum);
    	return sqlSession.selectOne(namespace+".After", bnum);    	
	}

}
