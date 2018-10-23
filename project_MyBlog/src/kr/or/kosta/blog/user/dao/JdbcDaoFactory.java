package kr.or.kosta.blog.user.dao;

import java.lang.reflect.Method;

import javax.sql.DataSource;

import kr.or.kosta.blog.article.dao.ArticleDao;
import kr.or.kosta.blog.article.dao.JdbcArticleDao;
import kr.or.kosta.blog.board.dao.BoardDao;
import kr.or.kosta.blog.board.dao.JdbcBoardDao;
import kr.or.kosta.blog.guestbook.dao.GuestbookDao;
import kr.or.kosta.blog.guestbook.dao.JdbcGuestbookDao;

public class JdbcDaoFactory extends DaoFactory {

	@Override
	public UserDao getUserDao() {
		UserDao dao = new JdbcUserDao();
		Class cls = dao.getClass();
		
		// 동적 메소드호출.... 데이터소스 설정을 위해(확장성을 고려해서 동적으로 호출한것)
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			if(DaoFactory.getDataSource() == null) {
			method.invoke(dao, createDataSource());
			} else {
				method.invoke(dao, getDataSource());
			}
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
			if(DaoFactory.getDataSource() == null) {
				method.invoke(dao, createDataSource());
				} else {
					method.invoke(dao, getDataSource());
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao;
	}

	@Override
	public BoardDao getBoardDao() {
		BoardDao dao = new JdbcBoardDao();
		Class cls = dao.getClass();
		
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			if(DaoFactory.getDataSource() == null) {
				method.invoke(dao, createDataSource());
				} else {
					method.invoke(dao, getDataSource());
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao;
	}

	@Override
	public ArticleDao getArticleDao() {
		ArticleDao dao = new JdbcArticleDao();
		Class cls = dao.getClass();
		Method method;
		try {
			method = cls.getMethod("setDataSource", DataSource.class);
			if(DaoFactory.getDataSource() == null) {
				method.invoke(dao, createDataSource());
				} else {
					method.invoke(dao, getDataSource());
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao;
	}
	
//	public BarDao getBarDao() {...};
//	public FooDao getFooDao() {...};

}
