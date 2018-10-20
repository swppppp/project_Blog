<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.guestbook.dao.GuestbookDao"%>
<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%!
public void jspInit(){
	DaoFactory factory = new JdbcDaoFactory();
	getServletContext().setAttribute("factory", factory);
	
	UserDao userDao = factory.getUserDao();
	getServletContext().setAttribute("userDao", userDao);
	
	GuestbookDao guestbookDao = factory.getGuestbookDao();
	getServletContext().setAttribute("guestbookDao", guestbookDao);
	
	ArticleDao articleDao = factory.getArticleDao();
	getServletContext().setAttribute("articleDao", articleDao);
}
%>
