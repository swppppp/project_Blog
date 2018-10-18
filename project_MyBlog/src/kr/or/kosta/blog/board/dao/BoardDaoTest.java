package kr.or.kosta.blog.board.dao;

import java.util.List;

import kr.or.kosta.blog.board.dto.Board;
import kr.or.kosta.blog.user.dao.DaoFactory;
import kr.or.kosta.blog.user.dao.JdbcDaoFactory;

public class BoardDaoTest {

	public static void main(String[] args) {

		DaoFactory factory = new JdbcDaoFactory();
		BoardDao dao = factory.getBoardDao();
		
		System.out.println("board list test---------");
		try {
			List<Board> list = dao.listAll();
			for (Board board : list) {
				System.out.println(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
