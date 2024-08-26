package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface MemberMapper {

	// 일반 게시판 리스트 출력
	public List<MemberVO> list(PageObject pageObject);

	// 일반 게시판 리스트 페이지처리를 위한 전체 데이터 개수 
	public Long getTotalRow(PageObject pageObject);
	
	// 회원정보 보기
	public MemberVO view(Long no);
	
	// 회원가입
	public Integer write(MemberVO vo);
	
	// 글등록 트랜잭션 처리 테스트
	// public Integer writeTx(MemberVO vo);
	
	// 글수정
	public Integer update(MemberVO vo);
	
	// 글삭제
	public Integer delete(MemberVO vo);
	
	// 로그인
	public LoginVO login(LoginVO vo);
	
}

