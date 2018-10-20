<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="kr.or.kosta.blog.user.dao.User" scope="request"/>
<jsp:setProperty property="*" name="user"/>
<%
DaoFactory factory = (DaoFactory)application.getAttribute("factory");
UserDao dao = factory.getUserDao();
dao.create(user);
System.out.println(user);
//디버깅
//System.out.println("디버깅...\n"+user+"가입성공");
%>
<jsp:forward page="/user/join_result.jsp"/>
