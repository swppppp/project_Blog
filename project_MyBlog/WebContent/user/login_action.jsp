<%@page import="kr.or.kosta.blog.user.dao.User"%>
<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
//reqest.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

if(id == null || passwd == null){
	return;
}

//userDao를 이용, 회원가입여부 체크
UserDao dao = (UserDao)application.getAttribute("userDao");
User user = dao.certify(id, passwd); //로그인시도한 user객체 반환
if(user!=null){
	Cookie cookie = new Cookie("loginId", user.getId());
	cookie.setPath("/");
	cookie.setMaxAge(-1);
	response.addCookie(cookie);
	if(request.getParameter("rememberId")!=null){
		// 아이디기억 체크...아이디를 저장하는 쿠키 하나 더 생성
		Cookie rcookie = new Cookie("rememberId", user.getId());
		rcookie.setPath("/");
		rcookie.setMaxAge(60*60*24*365); //쿠키값 1년유지
		response.addCookie(rcookie);
	}else if(request.getParameter("rememberId") == null){
		// 체크했다가 해제하면 기존에있던 rcookie 삭제
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie2:cookies){
			if(cookie2.getName().equals("rememberId")){
				cookie2.setMaxAge(0);
				cookie2.setPath("/");
				response.addCookie(cookie2);
			}
		}
	}
	response.sendRedirect(application.getContextPath()+"/index2.jsp");
}else{
	   // 되돌아가서 틀렸음을 알려주기
	%>
	<jsp:forward page="/user/login_form.jsp">
	   <jsp:param value="fail" name="checkResult"/>
	</jsp:forward>
	<%  
	}
	%>