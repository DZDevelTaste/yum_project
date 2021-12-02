package ant.yum.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Object> findByAll() {
		return sqlSession.selectList("main.findByAll");
	}

	public boolean deleteByNo(int no) {
		int count = sqlSession.delete("main.deleteByNo", no);
		return count == 1;
	}

	public boolean updateAuth() {
		int count = sqlSession.update("main.updateAuth");
		return count == 1;
	}

}
