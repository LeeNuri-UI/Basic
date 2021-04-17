package com.Basic.DAO;

import java.util.List;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;

public interface BoardDAO {
	public void boardInsert(BoardVO bv) throws Exception; //글 작성
	
	public List<BoardVO> listAll(Criteria cri) throws Exception; //리스트
	
	public int listCount() throws Exception; //총 갯수
	
	public BoardVO detail(Integer bnum) throws Exception; //상세보기
	
	public void viewCount(int bnum) throws Exception; //조회수
	
	public void update(BoardVO bv) throws Exception; //수정하기
	
	public void delete(int bnum) throws Exception; //삭제하기
	
	public Integer before(Integer bnum) throws Exception; //이전글
	
	public Integer after(Integer bnum) throws Exception; //다음글
	
	
	
}
