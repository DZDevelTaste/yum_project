package ant.yum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ant.yum.service.DiagnosisService;
import ant.yum.service.OrderService;
import ant.yum.service.PatientService;
import ant.yum.vo.DiagnosisVo;
import ant.yum.vo.OrderVo;
import ant.yum.vo.PatientVo;

@Controller
@RequestMapping("/doctor")
public class doctorController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private DiagnosisService  diagnosisService;

	@GetMapping("")
	public String doctorMain(Model model) {
		
		/*
		 * 현재 진료 대기중인 환자 리스트 List<OrderVo>를 찾는다
		 * 
		 * */
		List<OrderVo> orderList = orderService.findByState();
		
		for(OrderVo OrderList : orderList) {
			System.out.println(OrderList);
		}
		model.addAttribute("orderList", orderList);
		return "doctor/main";
	}
	
	@GetMapping("/patientInfo")
	public String patientInfo(int patientNo) {
		
		/*
		 * 선택된 환자의 정보(PatientVo)를 찾는다
		 * 
		 * */
		
		PatientVo patientInfo = patientService.findByNo(patientNo);
		
		return "redirect:/doctor";
	}
	
	@GetMapping("/orderLog")
	public String orderLog(int patientNo) {
		
		/*
		 * 선택된 환자의 진료이력(PatientVo)을 반환한다.
		 * 
		 * */
		List<OrderVo> orderList = orderService.findByNo(patientNo);
		for(OrderVo OrderList : orderList) {
			System.out.println(OrderList);
		}
		return "redirect:/doctor";
	}
	
	@GetMapping("/changeState")
	public String changeState(int orderNo) {
		
		/*
		 * 
		 * 환자의 상태를 진료 대기중에서 진료중으로 변경
		 * 
		 * */
		int orderStateNo_3 = 3;
		orderService.updateState(orderNo, orderStateNo_3);
		System.out.println(orderNo);
		return "redirect:/doctor";
	}
	
	@GetMapping("/finishDiagnosis")
	public String finishDiagnosis(int orderNo, DiagnosisVo diagnosisVo, HttpSession session) {
		
		
		int oderStateNo_4 = 4;
		orderService.updateState(orderNo, oderStateNo_4);
		
		// 진료 기록 insert & 처방 기록 insert 해야함!
		diagnosisVo.setOrderNo(orderNo);
//		diagnosisVo.setUserNo(session.getName);	세션 구현 x
		diagnosisService.insert(diagnosisVo);
		
		return "redirect:/doctor";
	}

	
	
}
