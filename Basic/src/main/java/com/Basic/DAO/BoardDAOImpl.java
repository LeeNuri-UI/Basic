package com.Basic.DAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
    private SqlSession sqlSession;
	
    private static String namespace = "com.Basic.Mapper.UserMapper";
    
    //게시판추가
	@Override
    public void boardInsert(BoardVO bv) throws Exception {
        sqlSession.insert(namespace+".boardInsert", bv);
	}
	
	//리스트
    @Override
    public List<BoardVO> listAll(Criteria cri) throws Exception {
        
        return sqlSession.selectList(namespace+".listAll",cri);    
    } 
    
    //리스트 총 갯수
    @Override
    public int listCount() throws Exception {
        
        return sqlSession.selectOne(namespace+".listCount");    
    }
     
    //상세보기
    @Override
    public BoardVO detail(Integer bnum) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".detailView", bnum);    	
    }
    
    //조회수
    @Override
	public void viewCount(int bnum) throws Exception {
    	
		sqlSession.update(namespace+".viewCount", bnum);
	}
    
    //수정하기
    @Override
    public void update(BoardVO bv) throws Exception {
    	
    	sqlSession.update(namespace+".updateBoard", bv);     	
	}
    
    //삭제하기
    @Override
    public void delete(int bnum) throws Exception {
    	
    	sqlSession.update(namespace+".delete", bnum);    	
	}
    
    //이전글
    @Override
    public Integer before(Integer bnum) throws Exception {
    	System.out.println("DAO"+bnum);
    	return sqlSession.selectOne(namespace+".before", bnum);    	
	}
    
    //다음글
    @Override
    public Integer after(Integer bnum) throws Exception {
    	System.out.println("DAO"+bnum);
    	return sqlSession.selectOne(namespace+".after", bnum);    	
	}
    

}
