<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
Cookie[] cookies = request.getCookies();
if(cookies!=null){
 for(Cookie cookie : cookies){
	   if(cookie.getName().equals("loginId")){
	   cookie.setPath("/");
       cookie.setMaxAge(0);
       response.addCookie(cookie);
       response.sendRedirect(application.getContextPath()+"/index2.jsp");
   }
 }
}
%>
