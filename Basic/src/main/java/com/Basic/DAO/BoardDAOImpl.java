package com.Basic.DAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;
import com.Basic.Domain.SearchCriteria;

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
    public List<BoardVO> listAll(SearchCriteria scri) throws Exception {
        
        return sqlSession.selectList(namespace+".listAll",scri);    
    } 
    
    //리스트 총 갯수
    @Override
    public int listCount(SearchCriteria scri) throws Exception {
        
        return sqlSession.selectOne(namespace+".listCount",scri);    
    }
     
    //상세보기
    @Override
    public BoardVO detail(Integer bnum) throws Exception {
    	
    	return sqlSession.selectOne(namespace+".detailView", bnum);    	
    }
    
    //댓글수
    @Override
	public void bcoCount(int bnum) throws Exception {
    	
		sqlSession.update(namespace+".bcoCount", bnum);
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
    
    //마이 페이지 리스트
    @Override
    public List<BoardVO> listAllY(Criteria cri) throws Exception {
        
        return sqlSession.selectList(namespace+".listAllY",cri);    
    } 
    
    //마이 페이지 총 갯수
    @Override
    public int listCountY() throws Exception {
        
        return sqlSession.selectOne(namespace+".listCountY");    
    }
    
    //글 완전히 삭제하기
    @Override
    public void deleteReal(int bnum) throws Exception {
    	
    	sqlSession.delete(namespace+".deleteReal", bnum);    	
	}
    
    //글 다시 복구하기
    @Override
    public void restoreGo(BoardVO bv) throws Exception {
    	
    	sqlSession.update(namespace+".restoreGo", bv);     	
	}
    

}
