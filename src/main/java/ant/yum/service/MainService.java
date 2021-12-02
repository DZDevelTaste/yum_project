package ant.yum.service;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ant.yum.repository.MainRepository;
import ant.yum.vo.UserVo;

@Service
public class MainService {
	@Autowired
	private MainRepository mainRepository;
	
	public UserVo getUser(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	public void join(@Valid UserVo vo) {
		String address = vo.getAddress() + vo.getAddressDetail();
		String rrn = vo.getRrn() +"-"+ vo.getRrn1();
		String email = vo.getEmail() + "@"+ vo.getEmail1();
		String phone = vo.getPhone() +"-"+ vo.getPhone1() +"-"+ vo.getPhone2();
		vo.setEmail(email);
		vo.setRrn(rrn);
		vo.setAddress(address);
		vo.setPhone(phone);
		System.out.println(address);
		mainRepository.insert(vo);
	}

	public UserVo findId(String name, String rrn) {
		return mainRepository.findId(name,rrn);
		
	}

	public UserVo findIdByEmail(String name, String email, String rrn) {
		return mainRepository.findIdByEmail(name,email, rrn);
	}

	public void updatePw(String password, String name) {
		mainRepository.updatePw(password, name);
	}
}
