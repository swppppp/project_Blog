package kr.or.kosta.blog.user.dao;

import java.util.List;
import java.util.Map;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 박시원
 *
 */
public interface UserDao {
	
	public void create(User user) throws Exception;
	
	public User read(String id) throws Exception;
	
	public void update(User user) throws Exception;
	
	public void delete(String id) throws Exception;
	
	public List<User> listAll() throws Exception;
	
	public User certify(String id, String passwd) throws Exception;
	
	//public List<Map<String, String>> employeeList() throws Exception;
	
	//아이디중복체크를 위한 메소드
	public boolean checkId(String id) throws Exception;
	
}
