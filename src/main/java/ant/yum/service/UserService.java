package ant.yum.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ant.yum.repository.UserRepository;
import ant.yum.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public UserVo getUser(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	public void join(@Valid UserVo vo) {
		userRepository.insert(vo);
	}

}
