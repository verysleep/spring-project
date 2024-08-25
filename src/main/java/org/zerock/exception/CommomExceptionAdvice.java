package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

// 자동 생성 DI
// @Controller, @RestController(비동기 통신), @Service, @Repository, @~Advice
@Log4j
@ControllerAdvice
public class CommomExceptionAdvice {

	// 500 번 예외 처리
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		
		log.error("Exception ------------- " + ex.getMessage());
		
		// jsp 로 ex 를 전달한다.
		model.addAttribute("exception", ex);
		
		log.error(model);
		
		return "error_page";
	}
	
	// 404 오류에 대한 처리 - switch-case >> default 부분
	// jsp 가 없는 경우
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "custom404";
	}
	
}
