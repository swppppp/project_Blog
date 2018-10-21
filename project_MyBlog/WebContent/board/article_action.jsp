<%@page import="java.net.InetAddress"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
// 요청 인코딩설정
request.setCharacterEncoding("utf-8");
// 답글인지 원글인지 확인을 위한 그룹넘버값 get
String group_no = request.getParameter("group_no");
// 게시글 생성을 위한 articleDao get
ArticleDao dao = (ArticleDao)application.getAttribute("articleDao");

if(group_no == null || group_no.length()==0){
	// 원글 게시글작성일 경우
%>
<jsp:useBean id="article" class="kr.or.kosta.blog.article.dto.Article" scope="request">
  <jsp:setProperty name="article" property="writer" param="writer"/>
  <jsp:setProperty name="article" property="subject" param="subject"/>
  <jsp:setProperty name="article" property="content" param="content"/>
  <jsp:setProperty name="article" property="ip" value="<%=InetAddress.getLocalHost().getHostAddress() %>"/>
  <jsp:setProperty name="article" property="passwd" param="passwd"/>
</jsp:useBean>
<%
dao.create(article);
response.sendRedirect("/board/board.jsp");
}else{
	//답글 작성인 경우
%>
<jsp:useBean id="reArticle" class="kr.or.kosta.blog.article.dto.Article" scope="request">
  <jsp:setProperty name="reArticle" property="writer" param="writer"/>
  <jsp:setProperty name="reArticle" property="subject" param="subject"/>
  <jsp:setProperty name="reArticle" property="content" param="content"/>
  <jsp:setProperty name="reArticle" property="ip" value="<%=InetAddress.getLocalHost().getHostAddress() %>"/>
  <jsp:setProperty name="reArticle" property="passwd" param="passwd"/>
</jsp:useBean>
<%
dao.create(reArticle, Integer.parseInt(group_no));
response.sendRedirect("/board/board.jsp");
}
%>
