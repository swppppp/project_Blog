package kr.or.kosta.blog.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kr.or.kosta.blog.article.dto.Article;
import kr.or.kosta.blog.common.Params;
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

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO article \r\n" + 
				"            (article_id, \r\n" + 
				"             board_id, \r\n" + 
				"             writer, \r\n" + 
				"             subject, \r\n" + 
				"             content, \r\n" + 
				"             ip, \r\n" + 
				"             passwd, \r\n" + 
				"             group_no, \r\n" + 
				"             level_no, \r\n" + 
				"             order_no) \r\n" + 
				"VALUES      (article_id_seq.NEXTVAL, \r\n" + 
				"             1, \r\n" + 
				"             ?, \r\n" + 
				"             ?, \r\n" + 
				"             ?, \r\n" + 
				"             ?, \r\n" + 
				"             ?, \r\n" + 
				"             article_id_seq.CURRVAL, \r\n" + 
				"             0, \r\n" + 
				"             0)" ; 
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getIp());
			pstmt.setString(5, article.getPasswd());
			pstmt.executeUpdate();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (Exception e) {}
		}
	}

	@Override
	public void createReply(Article article) throws Exception {
		
	}
	
	@Override
	public Article read(int article_id) throws Exception {
		Article article = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT article_id,\r\n" + 
				"    board_id,\r\n" + 
				"    writer,\r\n" + 
				"    subject,\r\n" + 
				"    content,\r\n" + 
				"    to_char(regdate, 'yyyy-mm-dd') regdate,\r\n" + 
				"    hitcount,\r\n" + 
				"    ip,\r\n" + 
				"    passwd,\r\n" + 
				"    group_no,\r\n" + 
				"    level_no,\r\n" + 
				"    order_no\r\n" + 
				"    FROM article\r\n" + 
				"    WHERE article_id=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = createArticle(rs);
			}
		}finally {
			try {
				if(rs != null)    rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)   con.close();
			}catch (Exception e) {}
		}
		return article;
	}

	@Override
	public void hitCountChange(int article_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE article \r\n" + 
					 "SET    hitcount = (SELECT hitcount+1 \r\n" + 
					 "                   FROM   article \r\n" + 
					 "                   WHERE  article_id = ?) \r\n" + 
					 "WHERE  article_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article_id);
			pstmt.setInt(2, article_id);
			pstmt.executeQuery();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null)   con.close();
			}catch (Exception e) {}
		}
	}
	
	@Override
	// 글 수정.. 제목과 내용만 변경가능
	public void update(Article article) throws Exception {
		Connection con =  null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE article \r\n" + 
					 "SET    subject = ?, \r\n" + 
					 "       content = ? \r\n" + 
					 "WHERE  article_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getArticle_id());
			pstmt.executeUpdate();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null)   con.close();
			} catch (Exception e) {}
		}
	}

	@Override
	public void delete(int article_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM article \r\n" + 
					 "WHERE  article_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article_id);
			pstmt.executeQuery();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (Exception e) {}
		}
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
				"FROM article\r\n" + 
				"ORDER BY article_id DESC";
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
		article.setAttach_file("");
		article.setBoard_id(rs.getInt("board_id"));
		article.setContent(rs.getString("content"));
		article.setGroup_no(rs.getInt("group_no"));
		article.setHitcount(rs.getInt("hitcount"));
		article.setIp(rs.getString("ip"));
		article.setLevel_no(rs.getInt("level_no"));
		article.setOrder_no(rs.getInt("order_no"));
		article.setPasswd(rs.getString("passwd"));
		article.setRegdate(rs.getString("regdate"));
		article.setSubject(rs.getString("subject"));
		article.setWriter(rs.getString("writer"));
		return article;
	}

	@Override
	// 사용자가 선택한 페이지 목록반환
	public List<Article> listByPage(int page) throws Exception {
		List<Article> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT article_id, \r\n" + 
				"       board_id, \r\n" + 
				"       writer, \r\n" + 
				"       subject, \r\n" + 
				"       content, \r\n" + 
				"       regdate, \r\n" + 
				"       hitcount, \r\n" + 
				"       ip, \r\n" + 
				"       passwd, \r\n" + 
				"       group_no, \r\n" + 
				"       level_no, \r\n" + 
				"       order_no \r\n" + 
				"FROM   ( \r\n" + 
				"              SELECT Ceil(ROWNUM/10) request_page, \r\n" + 
				"                     article_id, \r\n" + 
				"                     board_id, \r\n" + 
				"                     writer, \r\n" + 
				"                     subject, \r\n" + 
				"                     content, \r\n" + 
				"                     regdate, \r\n" + 
				"                     hitcount, \r\n" + 
				"                     ip, \r\n" + 
				"                     passwd, \r\n" + 
				"                     group_no, \r\n" + 
				"                     level_no, \r\n" + 
				"                     order_no \r\n" + 
				"              FROM   (SELECT article_id, \r\n" + 
				"                                   board_id, \r\n" + 
				"                                   writer, \r\n" + 
				"                                   subject, \r\n" + 
				"                                   content, \r\n" + 
				"                                   to_char(regdate, 'yyyy-mm-dd hh24:mi') regdate, \r\n" + 
				"                                   hitcount, \r\n" + 
				"                                   ip, \r\n" + 
				"                                   passwd, \r\n" + 
				"                                   group_no, \r\n" + 
				"                                   level_no, \r\n" + 
				"                                   order_no\r\n" + 
				"					  FROM article\r\n" + 
				"					  ORDER BY regdate desc))\r\n" + 
				"WHERE request_page = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, page);
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

	@Override
	public List<Article> listByPage(int page, int listSize) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Article> listByPage(int page, int listSize, String searchType, String searchValue) throws Exception {
		List<Article> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT article_id, \r\n" + 
				"       board_id, \r\n" + 
				"       writer, \r\n" + 
				"       subject, \r\n" + 
				"       content, \r\n" + 
				"       regdate, \r\n" + 
				"       hitcount, \r\n" + 
				"       ip, \r\n" + 
				"       passwd, \r\n" + 
				"       group_no, \r\n" + 
				"       level_no, \r\n" + 
				"       order_no \r\n" + 
				"FROM   (SELECT Ceil(ROWNUM/?) request_page, \r\n" + 
				"                     article_id, \r\n" + 
				"                     board_id, \r\n" + 
				"                     writer, \r\n" + 
				"                     subject, \r\n" + 
				"                     content, \r\n" + 
				"                     regdate, \r\n" + 
				"                     hitcount, \r\n" + 
				"                     ip, \r\n" + 
				"                     passwd, \r\n" + 
				"                     group_no, \r\n" + 
				"                     level_no, \r\n" + 
				"                     order_no \r\n" + 
				"              FROM   (SELECT article_id, \r\n" + 
				"                                   board_id, \r\n" + 
				"                                   writer, \r\n" + 
				"                                   subject, \r\n" + 
				"                                   content, \r\n" + 
				"                                   to_char(regdate, 'yyyy-mm-dd hh24:mi') regdate, \r\n" + 
				"                                   hitcount, \r\n" + 
				"                                   ip, \r\n" + 
				"                                   passwd, \r\n" + 
				"                                   group_no, \r\n" + 
				"                                   level_no, \r\n" + 
				"                                   order_no\r\n" + 
				"                      FROM article";
		// 검색유형에따른 where절 추가
		if(searchType != null) {
			// 검색유형별 where절 추가
			if(searchType != null) {
				switch (searchType) {
					case "subject":
						sql += "WHERE subject = ? \r\n";
						break;
					case "content":
						sql += "WHERE content LIKE ? \r\n";
						searchValue = "%" + searchValue + "%";
						break;
					case "writer":
						sql += "WHERE writer = ? \r\n";
						break;
				}
			}
		}
		sql += ")) \r\n" + //ORDER BY regdate DESC 어디들어가야돼,,ㅠㅠㅠ
			   "WHERE request_page=?";
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, listSize);
			
			//전체검색 아닌경우
			if(searchType != null){
				pstmt.setString(2, searchValue);
				pstmt.setInt(3, page);
			}else{// 전체검색인 경우
				pstmt.setInt(2, page);
			}
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Article>();
			while (rs.next()) {
				Article article = createArticle(rs);
				list.add(article);
			}
		}finally {
			try {
				if(rs != null)    rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)   con.close();
			} catch (Exception e) {}
		}
		return list;
	}

	@Override
	public List<Article> listByPage(Params params) throws Exception {
		return listByPage(params.getPage(), params.getListSize(),  params.getSearchType(), params.getSearchValue());
	}

	@Override
	// 검색요청에 따른 값 반환
	public int countBySearch(String searchType, String searchValue) throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(article_id) count\r\n" + 
					 "FROM article\r\n";  //게시글 전체 수 가져옴
		
		// 검색유형별 where절 추가
		if(searchType != null) {
			switch (searchType) {
				case "subject":
					sql += "WHERE subject = ? \r\n";
					break;
				case "content":
					sql += "WHERE content LIKE ? \r\n";
					searchValue = "%" + searchValue + "%";
					break;
				case "writer":
					sql += "WHERE writer = ? \r\n";
					break;
			}
		}
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			// 전체검색 아닌경우
			if(searchType != null) {
				pstmt.setString(1, searchValue);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (Exception e) {}
		}
		return count;
	}

	@Override
	public int countBySearch(Params params) throws Exception {
		return countBySearch(params.getSearchType(), params.getSearchValue());
	}



}
