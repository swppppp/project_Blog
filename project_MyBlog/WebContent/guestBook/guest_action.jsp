<%@page import="kr.or.kosta.blog.guestbook.dao.GuestbookDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String user_id = null;
Cookie[] cookies = request.getCookies();
for(Cookie cookie : cookies){
	if(cookie.getName().equals("loginId")){
		user_id = cookie.getValue();
	}
}
%>
<jsp:useBean id="guestbook" class="kr.or.kosta.blog.guestbook.dto.Guestbook" scope="request">
 <jsp:setProperty name="guestbook" property="user_id" value="<%=user_id %>"/>
 <jsp:setProperty name="guestbook" property="contents" param="contents"/>
</jsp:useBean>
<%
// 디버깅용 System.out.println(user_id);

// guestbookdao이용, add해주기
DaoFactory factory = new JdbcDaoFactory();
GuestbookDao dao = factory.getGuestbookDao();
dao.create(guestbook);
System.out.println(guestbook);
%>