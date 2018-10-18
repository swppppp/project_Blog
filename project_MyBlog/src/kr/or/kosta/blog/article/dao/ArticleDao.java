package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;

public interface ArticleDao {

	public void create(Article article) throws Exception;
	
	// �Խñۻ�
	public Article read() throws Exception;
	
	// �Խñ� ����
	public void update(Article article) throws Exception;
	
	// �Խñۻ���
	public void delete(int article_id) throws Exception;
	
	// �Խñ۸��
	public List<Article> listAll() throws Exception;
}
