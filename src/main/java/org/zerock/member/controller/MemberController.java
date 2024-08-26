package org.zerock.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.zerock.member.service.MemberService;
import org.zerock.member.service.MemberServiceImpl;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	@Autowired
	@Qualifier("MemberServiceImpl")
	private MemberService service;
	
	// 회원관리 리스트
	@GetMapping("/list.do") // only. get 방식
	// @RequestMapping("/Member") + @GetMapping("/list.do") = @GetMapping("/Member/list.do")
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
		return "Member/list";
		
		// ModelAndView
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", service.list());
//		mav.setViewName("Member/list");
//		return mav;
		
	}
	
	// 회원관리 글보기
	@GetMapping("/view.do")
	// @RequestMapping("/Member") + @GetMapping("/view.do") = @GetMapping("/Member/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		model.addAttribute("vo", service.view(no, inc));
		return "Member/view";
	}
	
	// 회원관리 글등록 폼
	@GetMapping("/writeForm.do")
	// @RequestMapping("/Member") + @GetMapping("/writeForm.do") = @GetMapping("/Member/writeForm.do")
	public String writeForm(HttpServletRequest request) {
		log.info("writeForm.do");
		return "Member/writeForm";
	}
	
	// 회원관리 글등록 처리
	@PostMapping("/write.do")
	// @RequestMapping("/Member") + @GetMapping("/write.do") = @GetMapping("/Member/write.do")
	public String write(MemberVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "회원관리 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	@GetMapping("/updateForm.do")
	// @RequestMapping("/Member") + @GetMapping("/updateForm.do") = @GetMapping("/Member/updateForm.do")
	public String updateForm(Model model, Long no) {
		log.info("updateForm.do");
		// 글보기 번호 가져오기
		model.addAttribute("vo", service.view(no, 0));
		return "Member/updateForm";
	}
	
	@PostMapping("/update.do")
	// @RequestMapping("/Member") + @GetMapping("/update.do") = @GetMapping("/Member/update.do")
	public String update(MemberVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if (service.update(vo) == 1) {
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "회원관리 정상적으로 글수정이 되었습니다.");
		} else {
			rttr.addFlashAttribute("msg", "회원관리 글수정이 되지 않았습니다.\n 글번호나 비밀번호가 맞지 않습니다.\n"
					+ "다시 확인해 주세요.");
		}
		return "redirect:view.do?no=" + vo.getId() + "&inc=0";
	}
	
	@PostMapping("/delete.do")
	// @RequestMapping("/Member") + @GetMapping("/delete.do") = @GetMapping("/Member/delete.do")
	public String delete(MemberVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		
		
		if (service.delete(vo) == 1) {
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "회원관리 정상적으로 글삭제가 되었습니다.");
			return "redirect:list.do";
			
		} else {
			rttr.addFlashAttribute("msg", "회원관리 글삭제가 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
			return "redirect:view.do?no=" + vo.getId() + "&inc=0";
		}
		
	}
	
	// 로그인 폼
	@GetMapping("/loginForm.do")
	// @RequestMapping("/Member") + @GetMapping("/writeForm.do") = @GetMapping("/Member/writeForm.do")
	public String loginForm(HttpServletRequest request) {
		log.info("loginForm.do");
		return "member/loginForm";
	}
	
	
	// 로그인 처리
	@PostMapping("/login.do")
	// @RequestMapping("/Member") + @PostMapping("/login.do") = @PostMapping("/Member/login.do")
	// RedirectAttributes : 전달 객체
	public String login(LoginVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("login.do");
		
		// 데이터 X >> null , 데이터 O >> LoginVO 의 내용
		LoginVO loginVO = service.login(vo); 
		
		if (loginVO == null) {
			rttr.addFlashAttribute("msg", "로그인 정보가 맞지 않습니다. 정보를 확인하고 다시 시도해 주세요.");
			return "redirect:/member/loginForm.do";
		}
		
		session.setAttribute("login", loginVO);
		
		rttr.addFlashAttribute("msg", loginVO.getName() + "님은" 
				+ loginVO.getGradeName() + "(으)로 로그인 되었습니다.");
		return "redirect:/main/main.do";
	}
	
	// 로그인 처리
	@GetMapping("/logout.do")
	// @RequestMapping("/Member") + @PostMapping("/login.do") = @PostMapping("/Member/login.do")
	// RedirectAttributes : 전달 객체
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		log.info("logout.do");
		
		session.removeAttribute("login");
		
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		
		return "redirect:/main/main.do";
	
	}
	
}
