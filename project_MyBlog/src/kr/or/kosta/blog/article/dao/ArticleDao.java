package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;

public interface ArticleDao {
	// 게시글쓰기
	public void create(Article article) throws Exception;
	
	// 게시글상세(조회)
	public Article read(int article_id) throws Exception;
	
	// 조회수 수정
	public void hitCountChange(int article_id) throws Exception;
	
	// 답글쓰기
	public void createReply(Article article) throws Exception;
	
	// 게시글 수정
	public void update(Article article) throws Exception;
	
	// 게시글삭제
	public void delete(int article_id) throws Exception;
	
	// 게시글목록
	public List<Article> listAll() throws Exception;
}
