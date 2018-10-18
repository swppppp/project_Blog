package kr.or.kosta.blog.guestbook.dao;

import java.util.List;

import kr.or.kosta.blog.guestbook.dto.Guestbook;
import kr.or.kosta.blog.user.dao.DaoFactory;
import kr.or.kosta.blog.user.dao.JdbcDaoFactory;

public class GuestDaoTest {

	public static void main(String[] args) {
		DaoFactory factory = new JdbcDaoFactory();
		GuestbookDao dao = factory.getGuestbookDao();
		
		System.out.println("listAll test---------");
		try {
			dao.create(new Guestbook("test", "방명록 생성 테스트"));
			List<Guestbook> list = dao.listAll();
			for (Guestbook guestbook : list) {
				System.out.println(guestbook);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			
		}
		
	}

}
