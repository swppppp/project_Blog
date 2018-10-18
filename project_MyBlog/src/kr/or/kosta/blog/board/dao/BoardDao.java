package kr.or.kosta.blog.board.dao;

import java.util.List;

import kr.or.kosta.blog.board.dto.Board;

/**
 * Dao���� ������ ���� �������̽� ����
 * @author siwon
 */
public interface BoardDao {
	// �Խ��� ����
	public void create(Board board) throws Exception;
	
	// ��ü �Խ��Ǹ�� �ҷ�����.. ���� �����Խ��� 1������ ���..
	public List<Board> listAll() throws Exception;
	
	// �Խ��� ��ȣ(board_id)�� �Խ��� ã��
	public Board read(int id) throws Exception;
	
	// �Խ��� ���� �� ������� ����..
}
