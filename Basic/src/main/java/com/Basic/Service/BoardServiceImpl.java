package com.Basic.Service;

import java.util.List;

import javax.inject.Inject;
 
import com.Basic.DAO.BoardDAO;
import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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
	    public List<BoardVO> ListAll(Criteria cri) throws Exception {
	 
	        return dao.ListAll(cri);
	    }
	 	
	 	//총 갯수
	 	@Override
	    public int listCount() throws Exception {
	 
	        return dao.listCount();
	    }
	 	
	 	//상세보기
	 	@Transactional(isolation = Isolation.READ_COMMITTED)
	 	@Override
	    public BoardVO Detail(Integer bnum) throws Exception {
	 		//조회수
	 		dao.ViewCount(bnum);
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
	 	
	 	//이전글
	 	@Override
	    public Integer Before(Integer bnum) throws Exception {
	 		System.out.println("서비스"+bnum);
	        return dao.Before(bnum);
	    }
	 	
	 	//다음글
	 	@Override
	    public Integer After(Integer bnum) throws Exception {
	 		System.out.println("서비스"+bnum);
	        return dao.After(bnum);
	    }

}
