package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;

public interface ArticleDao {
	// �Խñ۾���
	public void create(Article article) throws Exception;
	
	// �Խñۻ�(��ȸ)
	public Article read(int article_id) throws Exception;
	
	// ��ȸ�� ����
	public void hitCountChange(int article_id) throws Exception;
	
	// ��۾���
	public void createReply(Article article) throws Exception;
	
	// �Խñ� ����
	public void update(Article article) throws Exception;
	
	// �Խñۻ���
	public void delete(int article_id) throws Exception;
	
	// �Խñ۸��
	public List<Article> listAll() throws Exception;
}
