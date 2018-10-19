package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;
import kr.or.kosta.blog.user.dao.DaoFactory;
import kr.or.kosta.blog.user.dao.JdbcDaoFactory;

public class ArticleDaoTest {

	public static void main(String[] args) {
		DaoFactory factory = new JdbcDaoFactory();
		ArticleDao dao = factory.getArticleDao();
		
		try {
			System.out.println("�Խñ۸��");
			List<Article> list = dao.listAll();
			for (Article article : list) {
				System.out.println(article);
			}
			System.out.println("�Խñ� read�׽�Ʈ-----");
			Article article = dao.read(1);
			System.out.println(article);
			System.out.println("�Խñ� ����");
//			Article article2 = new Article();
//			article2.setBoard_id(1);
//			article2.setWriter("bangry");
//			article2.setSubject("daoTest����");
//			article2.setContent("daoTest ����");
//			article2.setHitcount(0);
//			article2.setIp("127.0.0.1");
//			article2.setPasswd("1234");
			//dao.create(article2);
			System.out.println(dao.read(21));
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
