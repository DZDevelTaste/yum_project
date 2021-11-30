package ant.yum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/doctor")
public class doctorController {

	@RequestMapping("")
	
	public String doctorMain() {
		return "doctor/main";
	}
}
