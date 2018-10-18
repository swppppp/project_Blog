package kr.or.kosta.blog.guestbook.dao;

import java.util.List;

import kr.or.kosta.blog.guestbook.dto.Guestbook;

/**
 * Dao���� ������ ���� �������̽� ����
 * @author siwon
 */
public interface GuestbookDao {
	
	public void create(Guestbook guestbook) throws Exception;
	
	// �Ѱ��� �о���� ��� �ʿ� ����
	//public Guestbook read(int id) throws Exception;
	
	// ��ü ���� �ҷ����� ���
	public List<Guestbook> listAll() throws Exception;
	
	// ���� ������Ʈ ��� ����
	public void update(Guestbook guestbook) throws Exception;
	
	public void delete(int id) throws Exception;
}
