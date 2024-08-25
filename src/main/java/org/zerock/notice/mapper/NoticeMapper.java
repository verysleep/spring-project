package org.zerock.notice.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.notice.vo.NoticeVO;

@Repository
public interface NoticeMapper {

	// 1-1. 전체 데이터 개수 세기
	public Long getTotalRow();
	
	// 1-2. 공지사항 리스트
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
