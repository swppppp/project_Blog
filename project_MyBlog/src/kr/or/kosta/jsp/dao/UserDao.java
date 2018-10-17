package kr.or.kosta.jsp.dao;

import java.util.List;
import java.util.Map;

/**
 * Dao ���� ������ ���� �������̽� ����
 * @author �ڽÿ�
 *
 */
public interface UserDao {
	
	public void create(User user) throws Exception;
	
	public User read(String id) throws Exception;
	
	public void update(User user) throws Exception;
	
	public void delete(String id) throws Exception;
	
	public List<User> listAll() throws Exception;
	
	public User certify(String id, String passwd) throws Exception;
	
	public List<Map<String, String>> employeeList() throws Exception;
	
}
