/**
 * 
 */
package kr.or.kosta.blog.user.dao;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import kr.or.kosta.blog.article.dao.ArticleDao;
import kr.or.kosta.blog.board.dao.BoardDao;
import kr.or.kosta.blog.guestbook.dao.GuestbookDao;

/**
 * �߻� ���丮 ���� ������ ���� DaoFactory
 * Database�� �����ϴ� ����� �����(jdbc, mybatis, hibernate, jpa ��)�� �����ϱ� ������
 * ������� �پ��� Dao ������ ���� ������ �Ծ� ����
 * #1. Dao ����
 * #2. DataSource ����
 * #3. Dao�� DataSource ����
 * #4. DataSource�� ������ Dao ��ȯ
 * 
 * @author siwon
 */
public abstract class DaoFactory {
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521";
	private static final String USERNAME = "hr";
	private static final String PASSWORD = "hr";
	private static final int INIT_SIZE = 2;
	private static final int MAX_TOTAL = 10;
	private static final int MAX_IDLE = 5;
	
	public DataSource createDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(DRIVER);
		dataSource.setUrl(URL);
		dataSource.setUsername(USERNAME);
		dataSource.setPassword(PASSWORD);
		dataSource.setInitialSize(INIT_SIZE);
		dataSource.setMaxTotal(MAX_TOTAL);
		dataSource.setMaxIdle(MAX_IDLE);
		return dataSource;
	}
	
	public abstract UserDao getUserDao();
	public abstract GuestbookDao getGuestbookDao();
	public abstract BoardDao getBoardDao();
	public abstract ArticleDao getArticleDao();
	
//	public BarDao getBarDao();
//	public FooDao getFooDao();
	
	
}
