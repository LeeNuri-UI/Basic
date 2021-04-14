package com.Basic.Service;

import java.util.List;

import com.Basic.Domain.BoardVO;

public interface BoardService {
	public void BoardInsert(BoardVO bv) throws Exception;
	
	public List<BoardVO> ListAll() throws Exception;
	
	public BoardVO Detail(Integer bnum) throws Exception;
	
	public void Update(BoardVO bv)throws Exception;
	
	public void delete(int bnum)throws Exception;
}