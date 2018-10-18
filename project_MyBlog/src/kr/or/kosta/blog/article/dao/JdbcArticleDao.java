package kr.or.kosta.blog.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kr.or.kosta.blog.article.dto.Article;
/**
 * ArticleDao를 jdbc로 연결, 구현
 * @author siwon
 */
public class JdbcArticleDao implements ArticleDao {

	private DataSource dataSource;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void create(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Article read() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Article article) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int article_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Article> listAll() throws Exception {
		List<Article> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT article_id, \r\n" + 
				"             board_id, \r\n" + 
				"             writer, \r\n" + 
				"             subject, \r\n" + 
				"             content, \r\n" +
				"			  regdate, \r\n" +
				"			  hitcount, \r\n" +
				"             ip, \r\n" + 
				"             passwd, \r\n" + 
				"             group_no, \r\n" + 
				"             level_no, \r\n" + 
				"             order_no\r\n" + 
				"FROM article";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<Article>();
			while (rs.next()) {
				Article article = createArticle(rs);
				list.add(article);
			}
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {}
		}
		
		return list;
	}

	private Article createArticle(ResultSet rs) throws SQLException {
		Article article = new Article();
		article.setArticle_id(rs.getInt("article_id"));
		article.setAttach_file(null);
		article.setBoard_id(rs.getInt("board_id"));
		article.setContent(rs.getString("content"));
		article.setGroup_no(rs.getInt("group_no"));
		article.setHitcount(1);
		article.setIp(rs.getString("ip"));
		article.setLevel_no(rs.getInt("level_no"));
		article.setOrder_no(rs.getInt("order_no"));
		article.setPasswd(rs.getString("passwd"));
		article.setRegdate(rs.getString("regdate"));
		article.setSubject(rs.getString("subject"));
		article.setWriter(rs.getString("writer"));
		return article;
	}

}
