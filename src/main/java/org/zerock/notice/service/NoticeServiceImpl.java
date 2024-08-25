package org.zerock.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> list() {
		// TODO Auto-generated method stub
		log.info("Notice.list() 실행 ------------");
		return mapper.list();
	}

	@Override
	public NoticeVO view() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer write() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete() {
		// TODO Auto-generated method stub
		return null;
	}

}
