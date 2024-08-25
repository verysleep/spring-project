package org.zerock.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/plan")
@Log4j
public class PlanController {

	@GetMapping("/list.do")
	public String list() {
		return "plan/list";
	}
	
	@GetMapping("/view.do")
	public String view() {
		return "plan/view";
	}
	
}
