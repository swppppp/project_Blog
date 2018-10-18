package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;
import kr.or.kosta.blog.user.dao.DaoFactory;
import kr.or.kosta.blog.user.dao.JdbcDaoFactory;

public class ArticleDaoTest {

	public static void main(String[] args) {
		DaoFactory factory = new JdbcDaoFactory();
		ArticleDao dao = factory.getArticleDao();
		
		System.out.println("게시글 리스트 가져오기 테스트");
		try {
			List<Article> list = dao.listAll();
			for (Article article : list) {
				System.out.println(article);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
