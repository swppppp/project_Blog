<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
Cookie[] cookies = request.getCookies();
String id ="";
for(Cookie cookie : cookies){
	if(cookie.getName().equals("loginId")){
		id = cookie.getValue();
	}
}
// id값 싣고 보내주기..(setAttribute로..!)
%>
