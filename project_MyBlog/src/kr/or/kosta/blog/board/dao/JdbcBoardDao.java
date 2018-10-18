package kr.or.kosta.blog.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kr.or.kosta.blog.board.dto.Board;

/**
 * boardDao인터페이스 구현
 * @author siwon
 */
public class JdbcBoardDao implements BoardDao {
	// 커넥션을 위한 datasource객체 선언
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void create(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Board> listAll() throws Exception {
		List<Board> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT board_id, category, title, description \r\n" + 
				"FROM board \r\n" + 
				"ORDER BY board_id";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while (rs.next()) {
				Board board = createBoard(rs);
				list.add(board);
			}
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (Exception e) {}
		}
		return list;
	}

	@Override
	public Board read(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	private Board createBoard(ResultSet rs) throws SQLException {
		Board board = new Board();
		board.setBoard_id(rs.getInt("board_id"));
		board.setCategory(rs.getInt("category"));
		board.setTitle(rs.getString("title"));
		board.setDescription(rs.getString("description"));
		return board;
	}
}
