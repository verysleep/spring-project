package org.zerock.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface BoardMapper {

	// 일반 게시판 리스트 출력
	public List<BoardVO> list(PageObject pageObject);

	// 일반 게시판 리스트 페이지처리를 위한 전체 데이터 개수 
	public Long getTotalRow(PageObject pageObject);
	
	// 글보기 조회수 1증가
	public Integer increase(Long no);
	
	// 글보기
	public BoardVO view(Long no);
	
	// 글등록
	public Integer write(BoardVO vo);
	
	// 글등록 트랜잭션 처리 테스트
	// public Integer writeTx(BoardVO vo);
	
	// 글수정
	public Integer update(BoardVO vo);
	
	// 글삭제
	public Integer delete(BoardVO vo);
	
}
