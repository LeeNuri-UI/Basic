package com.Basic.Service;

import java.util.List;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;

public interface BoardService {
	public void BoardInsert(BoardVO bv) throws Exception; //글 작성
	
	public List<BoardVO> ListAll(Criteria cri) throws Exception; //리스트
	
	public int listCount() throws Exception; //총 갯수
	
	public BoardVO Detail(Integer bnum) throws Exception; //상세보기
	
	public void Update(BoardVO bv)throws Exception; //수정하기
	
	public void delete(int bnum)throws Exception; //삭제하기
	
	public Integer Before(Integer bnum)throws Exception; //이전글
	
	public Integer After(Integer bnum)throws Exception; //다음글
	
}
