<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
request.setCharacterEncoding("utf-8");
int article_id = Integer.parseInt(request.getParameter("article_id"));
String whatAction = request.getParameter("whatAction");
String passwd = request.getParameter("passwd");
String user_id = request.getParameter("user_id");

Article article;
ArticleDao dao = (ArticleDao)application.getAttribute("articleDao");
article = dao.read(article_id);
String pw = article.getPasswd();
if(passwd.equals(pw)){
	if(whatAction.equals("Modify")){
%> 		<jsp:forward page="../board/update_form.jsp"/>
<%  }else if(whatAction.equals("Delete")){
	
	}
}else{
	// 되돌아가서 틀렸음을 알려주기
%>	<jsp:forward page="../board/confirm_pw.jsp">
		<jsp:param value="fail" name="checkResult"/>
	</jsp:forward>
<%
}
%>
