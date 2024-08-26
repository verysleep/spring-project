package org.zerock.member.service;

import java.util.List;

import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

public interface MemberService {

	// 일반게시판 리스트
	public List<MemberVO> list(PageObject pageObject);
	
	// 일반게시판 글보기
	public MemberVO view(Long no, int inc);
	
	// 일반게시판 글등록
	public Integer write(MemberVO vo);
	
	// 일반게시판 글수정
	public Integer update(MemberVO vo); 
	
	// 일반게시판 글수정
	public Integer delete(MemberVO vo); 
	
	// 로그인
	public LoginVO login(LoginVO vo);
	
	
}
