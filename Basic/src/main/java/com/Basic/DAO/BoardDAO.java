package com.Basic.DAO;

import java.util.List;

import com.Basic.Domain.BoardVO;

public interface BoardDAO {
	public void BoardInsert(BoardVO bv) throws Exception; //글 작성
	
	public List<BoardVO> ListAll() throws Exception; //리스트
	
	public BoardVO Detail(Integer bnum) throws Exception; //상세보기
	
	public void ViewCount(int bnum) throws Exception; //조회수
	
	public void Update(BoardVO bv) throws Exception; //수정하기
	
	public void delete(int bnum) throws Exception; //삭제하기
	
	public Integer Before(Integer bnum) throws Exception; //이전글
	
	public Integer After(Integer bnum) throws Exception; //다음글
	
}
