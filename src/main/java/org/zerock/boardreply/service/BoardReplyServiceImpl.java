package org.zerock.boardreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.boardreply.mapper.BoardReplyMapper;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;

@Service
@Qualifier("boardReplyServiceImpl")
public class BoardReplyServiceImpl implements BoardReplyService {

	// 자동 DI
	@Setter(onMethod_ = @Autowired)
	private BoardReplyMapper mapper;
	
	@Override
	public List<BoardReplyVO> list(PageObject pageObject, Long no) {
		// TODO Auto-generated method stub
		// 전체 데이터 세팅
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, no)); // for. 페이지 처리
		return mapper.list(pageObject, no);
	}

	@Override
	public Integer write(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public Integer update(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public Integer delete(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}
