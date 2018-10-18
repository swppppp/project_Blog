package kr.or.kosta.blog.article.dto;
/**
 * CREATE TABLE article(
  article_id    NUMBER(7)        NOT NULL,                   -- �Խñ� �ĺ���ȣ
  board_id      NUMBER(2)        DEFAULT 1 NOT NULL,         -- �Ҽ� �Խ��ǹ�ȣ
  writer        VARCHAR2(20)     NOT NULL,                   -- �ۼ��� ���̵�
  subject       VARCHAR2(400)    NOT NULL,                   -- �Խñ� ����
  content       VARCHAR2(4000)   NOT NULL,                   -- �Խñ� ����
  regdate       DATE             DEFAULT SYSDATE NOT NULL,   -- �Խñ� �������
  hitcount      NUMBER(5)        DEFAULT 0 NOT NULL,         -- �Խñ� ��ȸ��
  ip             VARCHAR2(20)     NOT NULL,                   -- �ۼ��� ������
  passwd        VARCHAR2(8)      NOT NULL,                   -- �Խñ� ��й�ȣ
  attach_file   VARCHAR2(20),                                -- ÷������
  group_no      NUMBER(7)        NOT NULL,                   -- ������ �Խ��� ������ ���� �Խñ� �׷��ȣ
  level_no      NUMBER(2)        NOT NULL,                   -- ������ �Խ��� ������ ���� �׷쳻 �Խñ� ����
  order_no      NUMBER(3)        NOT NULL                    -- ������ �Խ��� ������ ���� �׷쳻 �Խñ� ����
);
 * @author siwon
 */
public class Article {
	
	private int article_id;
	private int board_id;
	private String writer;
	private String subject; //����
	private String content;
	private String regdate;
	private int hitcount; //��ȸ��
	private String ip; //�ۼ��� ip
	private String passwd; //����,������ ���
	private String attach_file; // null��..
	private int group_no; //��۰� �׷��������� �ĺ���
	private int level_no; //��� ����
	private int order_no; //���ۺ��� �޸� ����� ����
	
	public Article() {
		super();
	}

	
	
	public Article(int article_id, int board_id, String writer, String subject, String content, String regdate,
			int hitcount, String ip, String passwd, String attach_file, int group_no, int level_no, int order_no) {
		this.article_id = article_id;
		this.board_id = board_id;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.ip = ip;
		this.passwd = passwd;
		this.attach_file = attach_file;
		this.group_no = group_no;
		this.level_no = level_no;
		this.order_no = order_no;
	}



	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getAttach_file() {
		return attach_file;
	}

	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	@Override
	public String toString() {
		return "Article [article_id=" + article_id + ", board_id=" + board_id + ", writer=" + writer + ", subject="
				+ subject + ", content=" + content + ", regdate=" + regdate + ", hitcount=" + hitcount + ", ip=" + ip
				+ ", passwd=" + passwd + ", attach_file=" + attach_file + ", group_no=" + group_no + ", level_no="
				+ level_no + ", order_no=" + order_no + "]";
	}
	
	
	
	
	
}
