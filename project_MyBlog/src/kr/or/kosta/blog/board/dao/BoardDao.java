package kr.or.kosta.blog.board.dao;

import java.util.List;

import kr.or.kosta.blog.board.dto.Board;

/**
 * Dao패턴 적용을 위한 인터페이스 선언
 * @author siwon
 */
public interface BoardDao {
	// 게시판 생성
	public void create(Board board) throws Exception;
	
	// 전체 게시판목록 불러오기.. 현재 자유게시판 1가지만 사용..
	public List<Board> listAll() throws Exception;
	
	// 게시판 번호(board_id)로 게시판 찾기
	public Board read(int id) throws Exception;
	
	// 게시판 수정 및 삭제기능 없음..
}
