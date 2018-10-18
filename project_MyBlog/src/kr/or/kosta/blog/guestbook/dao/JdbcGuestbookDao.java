package kr.or.kosta.blog.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.PStmtKey;

import kr.or.kosta.blog.guestbook.dto.Guestbook;

/**
 * guestbookDao를 jdbc로 연결, 구현
 * @author siwon
 */
public class JdbcGuestbookDao implements GuestbookDao {

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void create(Guestbook guestbook) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO guestbook(guestbook_id, user_id, contents)\r\n" + 
				"VALUES (GUESTBOOK_SEQ.NEXTVAL, ?, ?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, guestbook.getUser_id());
			pstmt.setString(2, guestbook.getContents());
			pstmt.executeQuery();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (Exception e) {}
		}
	}

	@Override
	public List<Guestbook> listAll() throws Exception {
		List<Guestbook> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT guestbook_id, user_id, contents, TO_CHAR(regdate, 'YYYY/MM/DD HH24:MI DAY') regdate\r\n" + 
				"FROM guestbook\r\n" + 
				"ORDER BY guestbook_id desc";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<Guestbook>();
			while (rs.next()) {
				Guestbook guestbook = createGuestbook(rs);
				list.add(guestbook);
			}
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {}
		}
		return list;
	}

	@Override
	public void update(Guestbook guestbook) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub

	}
	
	private Guestbook createGuestbook(ResultSet rs) throws SQLException{
		Guestbook guestbook = new Guestbook();
		guestbook.setContents(rs.getString("contents"));
		guestbook.setUser_id(rs.getString("user_id"));
		guestbook.setRegdate(rs.getString("REGDATE"));
		guestbook.setGuestbook_id(rs.getInt("GUESTBOOK_ID"));
		return guestbook;
	}

}
