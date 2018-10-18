package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;

public interface ArticleDao {

	public void create(Article article) throws Exception;
	
	// 게시글상세
	public Article read() throws Exception;
	
	// 게시글 수정
	public void update(Article article) throws Exception;
	
	// 게시글삭제
	public void delete(int article_id) throws Exception;
	
	// 게시글목록
	public List<Article> listAll() throws Exception;
}
