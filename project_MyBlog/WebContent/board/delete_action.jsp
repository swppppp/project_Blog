<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");

int article_id = Integer.parseInt(request.getParameter("article_id"));

Article article;
ArticleDao dao = (ArticleDao)application.getAttribute("articleDao");
dao.delAlter(article_id); // 삭제여부 칼럼값 true로 변경
article = dao.read(article_id);
String subject = article.getSubject();
//response.sendRedirect("/board/delete_result.jsp");
%>
<jsp:forward page="/board/delete_result.jsp">
	<jsp:param value="<%=article_id %>" name="article_id"/>
	<jsp:param value="<%=subject %>" name="subject"/>
</jsp:forward>
