<%@page import="kr.or.kosta.jsp.dao.User"%>
<%@page import="kr.or.kosta.jsp.dao.UserDao"%>
<%@page import="kr.or.kosta.jsp.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.jsp.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
//reqest.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

if(id == null || passwd == null){
	return;
}

//userDao를 이용, 회원가입여부 체크
DaoFactory factory = new JdbcDaoFactory();
UserDao dao = factory.getUserDao();
User user = dao.certify(id, passwd); //로그인시도한 user객체 반환
if(user!=null){
	Cookie cookie = new Cookie("loginId", user.getId());
	cookie.setPath("/");
	response.addCookie(cookie);
	System.out.println("쿠키: "+cookie);
	response.sendRedirect(application.getContextPath()+"/index2.jsp");
}else{
	%>
	<script>
	alert("회원이 아닙니다");
	history.back();
	</script>
	<%  
	}
	%>