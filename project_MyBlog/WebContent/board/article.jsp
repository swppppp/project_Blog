<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
// System.out.println("게시글 id: " + request.getParameter("article_id"));
int article_id = Integer.parseInt(request.getParameter("article_id"));

DaoFactory factory = new JdbcDaoFactory();
ArticleDao dao = factory.getArticleDao();
Article article = dao.read(article_id);
article.setHitcount(article.getHitcount()+1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
article페이지 입니다.<br>
글제목: <%=article.getSubject() %><br>
작성자: <%=article.getWriter() %><br>
작성일: <%=article.getRegdate() %><br>
아이피: <%=article.getIp() %><br>
조회수: <%=article.getHitcount() %><br>
내용  : <%=article.getContent() %><br>
<button>목록</button>
<button>답글</button>
<button>수정</button>
</body>
</html>