package org.zerock.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.TodoDTO;

import com.webjjang.util.file.FileUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 자동 생성 어노테이션
// @Controller, @RestController - uri, @Service - 처리, @Repository - 데이터 저장
// @~Advice - 예외처리
@Controller // 꼭 위에
@RequestMapping("/sample/*") // = @RequestMapping("/sample")
@Log4j // 실행 로그 출력
public class SampleController {

	@RequestMapping("") // /sample/
	// reuturn 없으면(void) uri 정보를 jsp 정보로 사용
	// return 이 String 이면 redirect: > redirect 시킨다. 없으면 jsp 로 forward 시킨다.
	public void basic() { 
		log.info("basic --------------------------- ");
	}
	
	// uri 매핑이 get / post 방식만 허용
	@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		log.info("basic get / post --------------------------- ");
	}
	
	// uri 매핑이 only.get
	// value 속성 하나만 남으면 기본으로 데이터가 들어가는 속성이 된다. 생략 가능
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic only get --------------------------- ");
	}
	
	@GetMapping("/ex01")
	// property(VO = DTO) 로 넘어오는 데이터 받기 (setter 이름과 name이 같으면 자동으로 받는다.)
	public String ex01(SampleDTO dto) {
		log.info("ex01().dto=" + dto);
		// WEB-INF/views + sample/ex01 + .jsp
		return "ex01"; // '/sample' 없어짐 to. not void
	}
	
	// get 방식 매핑
	@GetMapping("/ex02")
	// parameter 변수로 받기 - 변수명과 name이 같아야 한다. age 가 없으면 오류 발생
	// age가 안들어 오면 기본값을 0으로 세팅 >> @RequestParam(defaultValue = "0")
	public String ex02(@RequestParam("name") String name, 
			@RequestParam(defaultValue = "0", name = "age") int age) {
		log.info("ex02().name=" + name + ", age=" + age);
		return "ex02";
	}
	
	// get 방식 매핑
	@GetMapping("/ex02List")
	// parameter 변수로 받기 - 아이디 여러개를 받아서 처리 - List / 배열
	// List 로 여러개의 데이터를 받을 때는 @RequestParam 필수
	// 배열로 여러개의 데이터를 받을 때 RequestParam 필요 없음
	public String ex02List(@RequestParam ArrayList<String> ids, String[] names) {
		log.info("ex02List().ids=" + ids + ", names=" + Arrays.toString(names));
		return "ex02List";
	}
	
	// get 방식 매핑
	@GetMapping("/ex03")
	// parameter 변수로 날짜데이터 받기 @DateTimeFormat(pattern = "yyyy-MM-dd")
	// List 로 여러개의 데이터를 받을 때는 @RequestParam 필수
	// 배열로 여러개의 데이터를 받을 때 RequestParam 필요 없음
	public String ex03(TodoDTO dto) {
		log.info("ex03().dto=" + dto);
		return "ex03";
	}
	
	// get 방식 매핑
	@GetMapping("/ex06")
	// @ResponseBody - [서버 -> 클라이언트] 로 JSON 정보로 데이터 전달
	public @ResponseBody SampleDTO ex06() {
		log.info("ex06()");
		
		// DTO 에 @AllArgsConstructor 가 붙어 있으면 생성자에서 값을 전달 받는다
		SampleDTO dto = new SampleDTO("홍길동", 10);
//		dto.setName("홍길동");
//		dto.setAge(10);
		
		return dto;
	}
	
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		log.info("ex07");
		
		String msg = "{\"name\":\"홍길동\"}";
		
		// 서버에서 보내는 데이터의 정보
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg, headers, HttpStatus.OK);
	}
	
	// get 방식 매핑 - 파일 올리기 폼
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload -------------------- ");
	}
	
	// post 방식 매핑 - 파일 업로드 처리(저장 제외)
	@PostMapping("/exUploadPost")
	public void exUploadPost(@RequestParam ArrayList<MultipartFile> files) {
		
		log.info("/exUploadPost ---------------- ");
		for (MultipartFile file : files) {
			log.info("----------------------------------------");
			log.info("name : " + file.getOriginalFilename());
			log.info("size : " + file.getSize());
		}
		
	}
	
	// get 방식 매핑 - 파일 올리기 폼
	@GetMapping("/exUpload2")
	public void exUpload2() {
		log.info("/exUpload2 -------------------- ");
	}
	
	// post 방식 매핑 - 파일 업로드 처리(저장 제외)
	@PostMapping("/exUploadPost2")
	public void exUploadPost2(@RequestParam ArrayList<MultipartFile> files, 
			HttpServletRequest request) throws Exception {
		
		String path = "/upload/image";
		log.info("/exUploadPost2 ---------------- ");
		for (MultipartFile file : files) {
			log.info("----------------------------------------");
			log.info("name : " + file.getOriginalFilename());
			log.info("size : " + file.getSize());
			
			// file upload
			FileUtil.upload(path, file, request);
		}
		
	}
	
}
