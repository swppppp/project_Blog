<%@page import="kr.or.kosta.blog.user.dao.User"%>
<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
request.setCharacterEncoding("utf-8");
int article_id = Integer.parseInt(request.getParameter("article_id"));
String whatAction = request.getParameter("whatAction");
String passwd = request.getParameter("passwd");
String user_id = request.getParameter("user_id");

User user;
UserDao dao = (UserDao)application.getAttribute("userDao");
user = dao.read(user_id);
System.out.println("confirm_action에서 user객체: "+user);
System.out.println("confirm_action에서 whatAction값: "+whatAction);
if(user != null){
	if(whatAction.equals("Modify")){
		System.out.println("모디파이일때 입니다..");
%> 		<jsp:forward page="../board/update_form.jsp"/>
<%  }else if(whatAction.equals("Delete")){
	
	}
}else{
	// 되돌아가서 틀렸음을 알려주기
}
%>
