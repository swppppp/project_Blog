<%@page import="kr.or.kosta.blog.article.dto.Article"%>
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
// 답답글인지 확인을 위한 level_no값

int level_no=0;
if(request.getParameter("level_no")!=null){
	System.out.println("레벨 널아닐때");
	level_no = Integer.parseInt(request.getParameter("level_no"));
	level_no += 1;
}

//System.out.println("action폼에서 level증가: "+level_no);
String rId = request.getParameter("rId");

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
}else if(group_no != null && level_no ==1){
//답글 작성인 경우
%>
<jsp:useBean id="reply" class="kr.or.kosta.blog.article.dto.Article" scope="request">
  <jsp:setProperty name="reply" property="writer" param="writer"/>
  <jsp:setProperty name="reply" property="subject" param="subject"/>
  <jsp:setProperty name="reply" property="content" param="content"/>
  <jsp:setProperty name="reply" property="ip" value="<%=InetAddress.getLocalHost().getHostAddress() %>"/>
  <jsp:setProperty name="reply" property="passwd" param="passwd"/>
</jsp:useBean>
<%
dao.create(reply, Integer.parseInt(group_no));
response.sendRedirect("/board/board.jsp");
}else if(level_no > 1){
%>
<jsp:useBean id="rerePly" class="kr.or.kosta.blog.article.dto.Article" scope="request">
	<jsp:setProperty name="rerePly" property="writer" param="writer"/>
  <jsp:setProperty name="rerePly" property="subject" param="subject"/>
  <jsp:setProperty name="rerePly" property="content" param="content"/>
  <jsp:setProperty name="rerePly" property="ip" value="<%=InetAddress.getLocalHost().getHostAddress() %>"/>
  <jsp:setProperty name="rerePly" property="passwd" param="passwd"/>
</jsp:useBean>
<%
dao.create(rerePly, Integer.parseInt(group_no), level_no, Integer.parseInt(rId));
response.sendRedirect("/board/board.jsp");
}
%>
