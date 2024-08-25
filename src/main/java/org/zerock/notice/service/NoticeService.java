package org.zerock.notice.service;

import java.util.List;

import org.zerock.notice.vo.NoticeVO;

public interface NoticeService {

	// 1. 공지사항 리스트
	public List<NoticeVO> list();
	
	// 2. 공지사항 상세보기
	public NoticeVO view();
	
	// 3. 공지사항 등록
	public Integer write();
	
	// 4. 공지사항 수정
	public Integer update();
	
	// 5. 공지사항 삭제
	public Integer delete();
	
}
