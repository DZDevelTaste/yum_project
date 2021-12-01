package ant.yum.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ant.yum.service.UserService;
import ant.yum.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("")
	public String index() {
		return "main/index";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "main/join"; 
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@Valid UserVo vo) {
		userService.join(vo);
		return "redirect:/";
	}
	@RequestMapping("/searchemail")
	public String search_email() {
		return "main/search_email";
	}
	@RequestMapping(value="/searchemailsuccess", method=RequestMethod.POST)
	public String search_email_(UserVo vo, @PathVariable("name") String name, 
			@PathVariable("rrn") String rrn1, @PathVariable("rrn1") String rrn2, Model model) {
		String rrn = rrn1 + rrn2;
		
		UserVo userVo = userService.findId(name, rrn);
		
		model.addAttribute("userVo", userVo);
		
		return "main/search_email_success";
	}
	@RequestMapping("/searchpassword")
	public String search_password() {
		return "main/search_password";
	}
	@RequestMapping("/searchpasswordsuccess")
	public String search_password_success() {
		
		return "main/search_password_success";
	}
}
