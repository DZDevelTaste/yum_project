package ant.yum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ant.yum.repository.AdminRepository;

@Service
public class AdminService {
	
	@Autowired
	private AdminRepository adminRepository;

	public List<Object> findByAll() {
		return adminRepository.findByAll();
	}

	public boolean deleteByNo(int no) {
		return adminRepository.deleteByNo(no);
	}

	public boolean updateAuth() {
		return adminRepository.updateAuth();
		
	}
}
