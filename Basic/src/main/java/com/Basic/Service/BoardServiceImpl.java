package com.Basic.Service;

import java.util.List;
import javax.inject.Inject;
 
import com.Basic.DAO.BoardDAO;
import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;
import com.Basic.Domain.SearchCriteria;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	    //글 작성
	 	@Override
	    public void boardInsert(BoardVO bv) throws Exception {
	 		
	 		dao.boardInsert(bv);
	    }
	 	
	 	//리스트
	 	@Override
	    public List<BoardVO> listAll(SearchCriteria scri) throws Exception {
	 
	        return dao.listAll(scri);
	    }
	 	
	 	//총 갯수
	 	@Override
	    public int listCount(SearchCriteria scri) throws Exception {
	 
	        return dao.listCount(scri);
	    }
	 	
	 	//상세보기
	 	@Transactional(isolation = Isolation.READ_COMMITTED)
	 	@Override
	    public BoardVO detail(Integer bnum) throws Exception {
	 		//조회수
	 		dao.viewCount(bnum);
	 		dao.bcoCount(bnum);
	        return dao.detail(bnum);
	    }
	 	
	 	//수정하기
	 	@Override
	    public void update(BoardVO bv) throws Exception {
	 		
	        dao.update(bv);
	    }
	 	
	 	//삭제하기
	 	@Override
	    public void delete(int bnum) throws Exception {
	 		
	        dao.delete(bnum);
	    }
	 	
	 	//이전글
	 	@Override
	    public Integer before(Integer bnum) throws Exception {
	 		System.out.println("서비스"+bnum);
	        return dao.before(bnum);
	    }
	 	
	 	//다음글
	 	@Override
	    public Integer after(Integer bnum) throws Exception {
	 		System.out.println("서비스"+bnum);
	        return dao.after(bnum);
	    }
	 	
	 	//마이 페이지 리스트
	 	@Override
	    public List<BoardVO> listAllY(Criteria cri) throws Exception {
	 
	        return dao.listAllY(cri);
	    }
	 	
	 	//마이 페이지 총 갯수
	 	@Override
	    public int listCountY() throws Exception {
	 
	        return dao.listCountY();
	    }
	 	
	 	//글 완전히 삭제하기
	 	@Override
	    public void deleteReal(int bnum) throws Exception {
	 		
	        dao.deleteReal(bnum);
	    }
	 	
	 	//글 다시 복구하기
	 	@Override
	    public void restoreGo(BoardVO bv) throws Exception {
	 		
	        dao.restoreGo(bv);
	    }

}
