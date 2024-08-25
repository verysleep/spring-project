package org.zerock.board.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// Mapper 메서드 동작 테스트(단위테스트)
// test 에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	// lombok 의 setter를 이용해서 Spring 의 Autowired 를 이용안 자동 DI 적용
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	// list() test
	@Test
	public void testList() {
		
		log.info("----------------- [일반게시판 리스트 테스트] -----------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드 코딩한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.list(pageObject));
		
	}
	
	// getTotalRow() test
	@Test
	public void testGetTotalRow() {
		
		log.info("----------------- [일반게시판 리스트 전체 개수 카운트 테스트] -----------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드 코딩한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.getTotalRow(pageObject));
		
	}
	
	// increase() test
	@Test
	public void testIncrease() {
		
		log.info("----------------- [일반게시판 글보기 조회수 1증가 테스트] -----------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드 코딩한다.
		Long no = 81L;
		log.info(mapper.increase(no));
		
	}
	
	// view() test
	@Test
	public void testView() {
		
		log.info("----------------- [일반게시판 글보기 테스트] -----------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드 코딩한다.
		Long no = 81L;
		log.info(mapper.view(no));
		
	}
	
	// write() test
//	@Test
//	public void testWrite() {
//		
//		log.info("----------------- [일반게시판 글등록 테스트] -----------------");
//		
//		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드 코딩한다.
//		Long no = 81L;
//		log.info(mapper.view(no));
//		
//	}
	
}
