package org.zerock.boardreply.service;

import java.util.List;

import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

public interface BoardReplyService {

	// 1. list
	public List<BoardReplyVO> list(PageObject pageObject, Long no);
	// 2. write
	public Integer write(BoardReplyVO vo);
	// 3. update
	public Integer update(BoardReplyVO vo);
	// 4. delete
	public Integer delete(BoardReplyVO vo);
	
}
