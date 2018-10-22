<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
int article_id = Integer.parseInt(request.getParameter("article_id").trim());
ArticleDao dao = (ArticleDao)application.getAttribute("articleDao");
dao.hitCountChange(article_id);
Article article = dao.read(article_id);

// 작성자 확인을 위해 로그인한 아이디값 저장
String loginId = "";
Cookie[] cookies = request.getCookies();
for(Cookie cookie : cookies){
	if(cookie.getName().equals("loginId")){
		loginId = cookie.getValue();
	}
}
%>
<!DOCTYPE html>
<html>
<!-- 
<html lang="ko">
 -->
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fresiwon - Free Board</title>

    <!-- Bootstrap core CSS -->
    <link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Resources/css/clean-blog.min.css" rel="stylesheet">
    <link href="../Resources/css/custom.css" rel="stylesheet">

	<%--강사님 스타일..가져옴 --%>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/Resources/css/pagination.css">
	
  </head>
<body>
    <!-- Navigation -->
		<jsp:include page="/includes/navigator.jsp"/>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('../Resources/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>Free Board</h1>
              <span class="subheading">Free Board :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Page Content -->
	<div class="container"> 
	<table style="width:500px;">
		<tr>
		  <td class="form-control">글 제목</td>
		  <td colspan="3"><%=article.getSubject() %></td>
		</tr>
		<tr>
		  <td class="form-control">작성자</td><td><%=article.getWriter() %></td>
		  <td class="form-control">작성일</td><td><%=article.getRegdate() %></td>
		</tr>
		<tr>
		  <td class="form-control">아이피</td><td><%=article.getIp() %></td>
		  <td class="form-control">조회수</td><td><%=article.getHitcount() %></td>
		</tr>
		<tr>
		  <td colspan="4">
		  <textarea readonly style="height: 300px;" col="50" row="40" class="form-control">
		  <%=article.getContent().trim() %></textarea>
		  </td>
		</tr>
	</table>
	<div class="form-group">
<input type="submit" value="List" class="btn btn-primary" id="sendMessageButton" onclick="location.href='board.jsp'"><%-- 목록 --%>

<form action="article_form.jsp" method="post" style="display: inline;">
	<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Reply"><%-- 답글 --%>
	<input type="hidden" name="article_id" value="<%=article.getArticle_id() %>">
	<input type="hidden" name="group_no" value="<%=article.getGroup_no() %>">
	<input type="hidden" name="origin_subject" value="<%=article.getSubject() %>">
	<input type="hidden" name="level_no" value="<%=article.getLevel_no() %>">
</form>
<%
if(article.getWriter().equals(loginId)){
%>
<form action="confirm_pw.jsp" method="post" style="display: inline;">
	<input type="hidden" name="article_id" value="<%=article.getArticle_id() %>">
	<input type="hidden" name="user_id" value="<%=loginId %>">
	<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Modify" name="whatAction"><!-- 수정 -->
	<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Delete" name="whatAction"><!-- 삭제 -->
</form>
<%
}else{
%>
<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Modify" disabled><!-- 수정 -->
<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Delete" disabled><!-- 삭제 -->
<%
}
%>
	</div>
	</div>

    <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>

</body>
</html>