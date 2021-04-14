package com.Basic.Service;

import java.util.List;

import javax.inject.Inject;
 
import com.Basic.DAO.BoardDAO;
import com.Basic.Domain.BoardVO;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	    
	 	@Override
	    public void BoardInsert(BoardVO bv) throws Exception {
	    	
	        dao.BoardInsert(bv);
	        
	    }
	 	
	 	//리스트
	 	@Override
	    public List<BoardVO> ListAll() throws Exception {
	 
	        return dao.ListAll();
	    }
	 	
	 	//상세보기
	 	@Override
	    public BoardVO Detail(Integer bnum) throws Exception {
	 		
	        return dao.Detail(bnum);
	    }
	 	
	 	//수정하기
	 	@Override
	    public void Update(BoardVO bv) throws Exception {
	 		
	        dao.Update(bv);
	    }
	 	
	 	//삭제하기
	 	@Override
	    public void delete(int bnum) throws Exception {
	 		
	        dao.delete(bnum);
	    }

}
