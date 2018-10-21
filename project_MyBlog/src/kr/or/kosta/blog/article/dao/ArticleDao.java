package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;
import kr.or.kosta.blog.common.Params;

public interface ArticleDao {
	// �Խñ۾���
	public void create(Article article) throws Exception;
	
	// �Խñۻ�(��ȸ)
	public Article read(int article_id) throws Exception;
	
	// ��ȸ�� ����
	public void hitCountChange(int article_id) throws Exception;
	
	// ���ۿ� ���� ��۾���(level_no=1)
	public void create(Article article, int group_no) throws Exception;
	
	// ��ۿ� ���� ���(level_no�� �Է� �ʿ�)
	public void create(Article article, int group_no, int level_no) throws Exception;
	
	// �Խñ� ����
	public void update(Article article) throws Exception;
	
	// �Խñۻ���
	public void delete(int article_id) throws Exception;
	
	// �Խñ۸��
	public List<Article> listAll() throws Exception;
	
	/** ������������ ���� ��� ��ȯ */
	public List<Article> listByPage(int page) throws Exception;
	
	/** ����������, ��ȸ��ϰ����� ���� �Խñ� ��� ��ȯ */
	public List<Article> listByPage(int page, int listSize) throws Exception;

	/** ����������, ��ȸ��ϼ�, �˻�����, �˻����� ���� ��Ϲ�ȯ */
	public List<Article> listByPage(int page, int listSize, String searchType, String searchValue) throws Exception;
	
	/** Params�� �Ű�������, �˻��� ����¡ó���� ���� �Խñ� ��� ��ȯ */
	public List<Article> listByPage(Params params) throws Exception;
	
	/** �˻��� ���� ����� ���� ��ȯ�� �ʿ��� �޼ҵ� - ����¡ó���� �ʿ�..*/
	public int countBySearch(String searchType, String searchValue) throws Exception;
	public int countBySearch(Params params) throws Exception;
}
