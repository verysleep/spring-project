package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleDTO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

// @Controller, @RestController - uri 와 관련
// @RestController 에는 기본이 @ResponseBody 이므로 생략함. 전달되는 데이터가 순수한 데이터다.
@RestController
@RequestMapping("/sampleRest")
@Log4j
public class SampleRestController {

	// -------------------------- response 처리 (서버 -> 클라이언트) --------------------------
	
	@GetMapping(value = "/getTest", produces = "text/plain; charset=UTF-8")
	public String getText() {
		
		return "안녕하세요.";
		
	}
	
	// DTO 객체를 json과 xml 데이터로 처리(제공)
	@GetMapping(value = "/getSample", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public SampleDTO getSample() {
		return new SampleDTO("홍길동", 10);
	}
	
	// List 객체를 제공 >> xml, json 데이터 제공 (default - xml)
	@GetMapping("/getList")
	public List<SampleDTO> getList() {
		
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("홍길동", 10));
		list.add(new SampleDTO("Dove", 32));
		list.add(new SampleDTO("임지호", 23));
		list.add(new SampleDTO("지예빈", 20));
		
		return list;
		
	}
	
	// Map 객체를 제공 >> xml, json 데이터 제공
	@GetMapping("/getMap")
	public Map<String, Object> getMap() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("홍길동", 10));
		list.add(new SampleDTO("Dove", 32));
		list.add(new SampleDTO("임지호", 23));
		list.add(new SampleDTO("지예빈", 20));
		
		// map.put("dto", new SampleDTO("홍길동", 10));
		// 특성이 서로 틀린 여러개의 데이터를 담아서 넘길 때
		map.put("list", list);
		map.put("pageObject", new PageObject());
		
		return map;
		
	}
	
	// -------------------------- request 처리 (클라이언트 -> 서버) --------------------------
	
	// URI 안에 데이터 포함시켜서 전달하기
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, 
			@PathVariable("pid") Integer pid) {
		
		return new String[] {"category : " + cat,"productId : " + pid};
	}
	
	// JS의 JSON 데이터를 만들어서 문자열로 보내면 받을 수 있다.
	@PostMapping("/sample")
	public SampleDTO convert(@RequestBody SampleDTO dto) {
		
		log.info(dto);
		
		return dto;
	
	}
	
}
