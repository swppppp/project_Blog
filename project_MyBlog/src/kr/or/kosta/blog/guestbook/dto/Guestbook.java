package kr.or.kosta.blog.guestbook.dto;
/**
 * CREATE TABLE guestbook (
    guestbook_id NUMBER,
    user_id      VARCHAR2(8)    NOT NULL,
    contents     VARCHAR2(4000) NOT NULL,
    regdate      DATE           DEFAULT SYSDATE NOT NULL
);
 * @author siwonPark
 */
public class Guestbook {
	private int guestbook_id;
	private String user_id;
	private String contents;
	private String regdate;
	
	public Guestbook() {
		super();
	}
	
	public Guestbook(String user_id, String contents) {
//		this.guestbook_id = guestbook_id;
		this.user_id = user_id;
		this.contents = contents;
		//this.regdate = regdate;
	}

	public int getGuestbook_id() {
		return guestbook_id;
	}

	public void setGuestbook_id(int guestbook_id) {
		this.guestbook_id = guestbook_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Guestbook [guestbook_id=" + guestbook_id + ", user_id=" + user_id + ", contents=" + contents + ", regdate=" + regdate + "]";
	}
	}
