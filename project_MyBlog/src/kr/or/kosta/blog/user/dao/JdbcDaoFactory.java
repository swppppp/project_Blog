package kr.or.kosta.blog.user.dao;

import java.lang.reflect.Method;

import javax.sql.DataSource;

import kr.or.kosta.blog.guestbook.dao.GuestbookDao;
import kr.or.kosta.blog.guestbook.dao.JdbcGuestbookDao;

public class JdbcDaoFactory extends DaoFactory {

	@Override
	public UserDao getUserDao() {
		UserDao dao = new JdbcUserDao();
		Class cls = dao.getClass();
		
		// ���� �޼ҵ�ȣ��.... �����ͼҽ� ������ ����(Ȯ�强�� ����ؼ� �������� ȣ���Ѱ�)
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			method.invoke(dao, createDataSource());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao;
	}

	@Override
	public GuestbookDao getGuestbookDao() {
		GuestbookDao dao = new JdbcGuestbookDao();
		Class cls = dao.getClass();
		
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			method.invoke(dao, createDataSource());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao;
	}
	
	
	
//	public BarDao getBarDao() {...};
//	public FooDao getFooDao() {...};

}
