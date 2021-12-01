package ant.yum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ant.yum.repository.OrderRepository;
import ant.yum.vo.OrderVo;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRepository;

	public List<OrderVo> findByState() {
		
		return orderRepository.findByState();
	}

}
