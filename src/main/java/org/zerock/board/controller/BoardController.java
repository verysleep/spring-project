package org.zerock.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.service.BoardService;
import org.zerock.board.service.BoardServiceImpl;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService service;
	
	// 일반게시판 리스트
	@GetMapping("/list.do") // only. get 방식
	// @RequestMapping("/board") + @GetMapping("/list.do") = @GetMapping("/board/list.do")
//	public ModelAndView list(Model model) {
	public String list(Model model, HttpServletRequest request) throws Exception {
//	public String list(HttpServletRequest request) {
		log.info("list.do");
//		request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		
		// model 에 담은 request 에 자동으로 담게 한다. - 처리된 데이터를 Model 에 저장
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "board/list";
		
		// ModelAndView
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", service.list());
//		mav.setViewName("board/list");
//		return mav;
		
	}
	
	// 일반게시판 글보기
	@GetMapping("/view.do")
	// @RequestMapping("/board") + @GetMapping("/view.do") = @GetMapping("/board/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		model.addAttribute("vo", service.view(no, inc));
		return "board/view";
	}
	
	// 일반게시판 글등록 폼
	@GetMapping("/writeForm.do")
	// @RequestMapping("/board") + @GetMapping("/writeForm.do") = @GetMapping("/board/writeForm.do")
	public String writeForm(HttpServletRequest request) {
		log.info("writeForm.do");
		return "board/writeForm";
	}
	
	// 일반게시판 글등록 처리
	@PostMapping("/write.do")
	// @RequestMapping("/board") + @GetMapping("/write.do") = @GetMapping("/board/write.do")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "일반 게시판 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	@GetMapping("/updateForm.do")
	// @RequestMapping("/board") + @GetMapping("/updateForm.do") = @GetMapping("/board/updateForm.do")
	public String updateForm(Model model, Long no) {
		log.info("updateForm.do");
		// 글보기 번호 가져오기
		model.addAttribute("vo", service.view(no, 0));
		return "board/updateForm";
	}
	
	@PostMapping("/update.do")
	// @RequestMapping("/board") + @GetMapping("/update.do") = @GetMapping("/board/update.do")
	public String update(BoardVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if (service.update(vo) == 1) {
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "일반 게시판 정상적으로 글수정이 되었습니다.");
		} else {
			rttr.addFlashAttribute("msg", "일반 게시판 글수정이 되지 않았습니다.\n 글번호나 비밀번호가 맞지 않습니다.\n"
					+ "다시 확인해 주세요.");
		}
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
	}
	
	@PostMapping("/delete.do")
	// @RequestMapping("/board") + @GetMapping("/delete.do") = @GetMapping("/board/delete.do")
	public String delete(BoardVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		
		
		if (service.delete(vo) == 1) {
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "일반 게시판 정상적으로 글삭제가 되었습니다.");
			return "redirect:list.do";
			
		} else {
			rttr.addFlashAttribute("msg", "일반 게시판 글삭제가 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
			return "redirect:view.do?no=" + vo.getNo() + "&inc=0";
		}
		
	}
	
}
