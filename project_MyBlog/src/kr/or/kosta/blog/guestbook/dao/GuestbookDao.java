package kr.or.kosta.blog.guestbook.dao;

import java.util.List;

import kr.or.kosta.blog.guestbook.dto.Guestbook;

/**
 * Dao패턴 적용을 위한 인터페이스 선언
 * @author siwon
 */
public interface GuestbookDao {
	
	public void create(Guestbook guestbook) throws Exception;
	
	// 한개씩 읽어오는 기능 필요 없음
	//public Guestbook read(int id) throws Exception;
	
	// 전체 방명록 불러오는 기능
	public List<Guestbook> listAll() throws Exception;
	
	// 방명록 업데이트 기능 없음
	public void update(Guestbook guestbook) throws Exception;
	
	public void delete(int id) throws Exception;
}
