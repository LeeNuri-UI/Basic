package com.Basic.Service;

import java.util.List;

import com.Basic.Domain.BoCommentVO;
import com.Basic.Domain.BoardVO;


public interface CommentsService {
	
	public void commentsIsert(BoCommentVO bcv) throws Exception; //댓글 작성

	public List<BoCommentVO> list(int bnum) throws Exception; //댓글 조회
	
	public void updateComments(BoCommentVO bcv)throws Exception; //댓글 수정
	
	public void deleteComments(int conum)throws Exception; //댓글 삭제
}
