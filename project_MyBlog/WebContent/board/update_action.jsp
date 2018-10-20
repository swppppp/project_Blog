<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
DaoFactory factory = (JdbcDaoFactory) application.getAttribute("factory");
ArticleDao dao = factory.getArticleDao();
int article_id = Integer.parseInt(request.getParameter("article_id"));
Article article = dao.read(article_id);
article.setSubject((String)request.getParameter("subject"));
article.setContent((String)request.getParameter("content"));
dao.update(article);

response.sendRedirect("/board/article.jsp?article_id="+article_id);
%>
