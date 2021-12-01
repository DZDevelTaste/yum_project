package ant.yum.repository;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ant.yum.vo.UserVo;

@Repository
public class UserRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(@Valid UserVo vo) {
		System.out.println(vo);
		int count = sqlSession.insert("user.insert", vo);
		return count == 1;
	}

	public UserVo findId(String name, String rrn) {
		Map<String, String> map = new HashMap<>();
		map.put("n", name);
		map.put("r", rrn);
		return sqlSession.selectOne("user.findId",map);
	}
}
