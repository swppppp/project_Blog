package kr.or.kosta.blog.article.dao;

import java.util.List;

import kr.or.kosta.blog.article.dto.Article;
import kr.or.kosta.blog.common.Params;

public interface ArticleDao {
	// 게시글쓰기
	public void create(Article article) throws Exception;
	
	// 게시글상세(조회)
	public Article read(int article_id) throws Exception;
	
	// 조회수 수정
	public void hitCountChange(int article_id) throws Exception;
	
	// 원글에 대한 답글쓰기(level_no=1)
	public void create(Article article, int group_no) throws Exception;
	
	// 답글에 대한 답글(level_no값 입력 필요)
	public void create(Article article, int group_no, int level_no) throws Exception;
	
	// 게시글 수정
	public void update(Article article) throws Exception;
	
	// 게시글삭제
	public void delete(int article_id) throws Exception;
	
	// 게시글목록
	public List<Article> listAll() throws Exception;
	
	/** 선택페이지에 따른 목록 반환 */
	public List<Article> listByPage(int page) throws Exception;
	
	/** 선택페이지, 조회목록개수에 따른 게시글 목록 반환 */
	public List<Article> listByPage(int page, int listSize) throws Exception;

	/** 선택페이지, 조회목록수, 검색유형, 검색값에 따른 목록반환 */
	public List<Article> listByPage(int page, int listSize, String searchType, String searchValue) throws Exception;
	
	/** Params를 매개변수로, 검색과 페이징처리를 통한 게시글 목록 반환 */
	public List<Article> listByPage(Params params) throws Exception;
	
	/** 검색에 따른 사용자 개수 변환에 필요한 메소드 - 페이징처리시 필요..*/
	public int countBySearch(String searchType, String searchValue) throws Exception;
	public int countBySearch(Params params) throws Exception;
}
