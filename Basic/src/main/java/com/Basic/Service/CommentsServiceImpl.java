package com.Basic.Service;


import java.util.List;

import javax.inject.Inject;
 
import com.Basic.DAO.CommentsDAO;
import com.Basic.Domain.BoCommentVO;

import org.springframework.stereotype.Service;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Inject
	private CommentsDAO cdao;
	
	//댓글 작성
	@Override
    public void commentsIsert(BoCommentVO bcv) throws Exception {
    	
		cdao.commentsIsert(bcv);  
	}	
	
	//댓글 조회
	@Override
    public List<BoCommentVO> list(int bnum) throws Exception {
		
		return cdao.list(bnum);	
    }
	
	//댓글 수정
	@Override
    public void updateComments(BoCommentVO bcv) throws Exception {
    	
		cdao.updateComments(bcv);	
    }
	
	//댓글 삭제
	@Override
    public void deleteComments(int conum) throws Exception {
    	
		cdao.deleteComments(conum);	
    }
}
