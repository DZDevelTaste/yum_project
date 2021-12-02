package ant.yum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ant.yum.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin")
	public String index(Model model) {
		List<Object> list = adminService.findByAll();
		model.addAttribute("list", list);
		
		return "admin/index";
	}
	
	@RequestMapping("/admin/delete")
	public String delete(Model model) {
		int no = 0;
		adminService.deleteByNo(no);
		return "admin/index";
	}
	@RequestMapping("/admin/update")
	public String update(Model model) {
		adminService.updateAuth();
		return "admin/index";
	}
}
