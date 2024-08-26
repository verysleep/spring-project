package org.zerock.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

// 자동 생성을 위한 어노테이션
@Service
@Log4j
// type 이 같으면 식별할 수 있는 문자열 지정 >> id 를 지정한다.
@Qualifier("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	// 자동 DI 적용 - @Setter, @Autowired, @Inject
	@Inject
	private MemberMapper mapper;
	
	// 일반게시판 리스트
	@Override
	public List<MemberVO> list(PageObject pageObject) {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	// 일반게시판 글보기
	@Override
	public MemberVO view(Long no, int inc) {
		log.info("view() 실행");
		// if (inc != 0) mapper.increase(no);
		return mapper.view(no);
	}
	
	// 일반게시판 글등록
	// @Transactional - insert 2번이 성공해야 commit됨, 한개라도 오류나면 rollback.
	// @Transactional
	@Override
	public Integer write(MemberVO vo) {
		Integer result = mapper.write(vo); // 글번호를 시퀀스해서 새로운 번호 사용
		// log.info(vo);
		// vo.setNo(10000L);
		// mapper.writeTx(vo); // 위에서 사용한 글번호 재사용 - PK 예외 발생
		return result;
	}
	
	// 일반게시판 글수정
	@Override
	public Integer update(MemberVO vo) {
		log.info(vo);
		return mapper.update(vo);
	}
	
	// 일반게시판 글삭제
	@Override
	public Integer delete(MemberVO vo) {
		log.info(vo);
		return mapper.delete(vo);
	}

	@Override
	public LoginVO login(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}
	
}
