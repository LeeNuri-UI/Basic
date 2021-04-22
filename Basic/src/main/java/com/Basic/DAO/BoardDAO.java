package com.Basic.DAO;

import java.util.List;
import java.util.Map;

import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;

public interface BoardDAO {
	public void boardInsert(BoardVO bv) throws Exception; //글 작성
	
	public List<BoardVO> listAll(Criteria cri) throws Exception; //리스트
	
	public int listCount() throws Exception; //총 갯수
	
	public void bcoCount(int bnum) throws Exception; //댓글수
	
	public BoardVO detail(Integer bnum) throws Exception; //상세보기
	
	public void viewCount(int bnum) throws Exception; //조회수
	
	public void update(BoardVO bv) throws Exception; //수정하기
	
	public void delete(int bnum) throws Exception; //삭제하기
	
	public Integer before(Integer bnum) throws Exception; //이전글
	
	public Integer after(Integer bnum) throws Exception; //다음글
	
	public List<BoardVO> listAllY(Criteria cri) throws Exception; //마이 페이지 리스트
	
	public int listCountY() throws Exception; //마이 페이지 총 갯수
	
	public void deleteReal(int bnum) throws Exception; //글 완전히 삭제하기
	
	public void restoreGo(BoardVO bv) throws Exception; //글 다시 복구하기
	
	
}
