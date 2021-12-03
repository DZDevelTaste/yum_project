package ant.yum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ant.yum.repository.DiagnosisRepository;

@Service
public class DiagnosisService {

	@Autowired
	private DiagnosisRepository diagnosisRepository;
}
