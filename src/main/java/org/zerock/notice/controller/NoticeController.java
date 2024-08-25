package org.zerock.notice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.notice.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {

	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService service;
	
	// 1. list
	@GetMapping("/list.do")
	public String list(Model model) {
		log.info("list.do");
		// 출력 객체
		model.addAttribute("list", service.list());
		return "notice/list";
	}
	
	// 2. view
	
	// 3. write
	
	// 4. update
	
	// 5. delete
	
}
