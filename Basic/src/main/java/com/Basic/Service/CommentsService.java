package com.Basic.Service;

import java.util.List;

import com.Basic.Domain.BoCommentVO;


public interface CommentsService {
	public void commentsIsert(BoCommentVO bcv) throws Exception; //댓글 작성

	public List<BoCommentVO> list(int bnum) throws Exception; //댓글 조회
}
