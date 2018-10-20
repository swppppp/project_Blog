<%@page import="java.net.InetAddress"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="kr.or.kosta.blog.article.dto.Article" scope="request">
  <jsp:setProperty name="article" property="writer" param="writer"/>
  <jsp:setProperty name="article" property="subject" param="subject"/>
  <jsp:setProperty name="article" property="content" param="content"/>
  <jsp:setProperty name="article" property="ip" value="<%=InetAddress.getLocalHost().getHostAddress() %>"/>
  <jsp:setProperty name="article" property="passwd" param="passwd"/>
</jsp:useBean>
<%
DaoFactory factory = (DaoFactory)application.getAttribute("factory");
ArticleDao dao = factory.getArticleDao();
dao.create(article);
response.sendRedirect("/board/board.jsp");
%>

