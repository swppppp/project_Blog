<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
int article_id = Integer.parseInt(request.getParameter("article_id").trim());
DaoFactory factory = (DaoFactory)application.getAttribute("factory");
ArticleDao dao = factory.getArticleDao();
dao.hitCountChange(article_id);
Article article = dao.read(article_id);
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

    <title>Freshiwon - Free Board</title>

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
              <span class="subheading">Update your Article :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Content -->
	<div class="container">
	<form action="update_action.jsp" method="post" name="sendMessage" id="contactForm">
	<input type="hidden" name="article_id" value="<%=article_id %>">
	<table border="1px black">
		<tr>
		  <td><label>글 제목</label></td>
		  <td colspan="3">
		  <input type="text" class="form-control" name="subject" value="<%=article.getSubject() %>">
		  </td>
		</tr>
		<tr>
		  <td><label>작성자</label></td>
		  <td><label><%=article.getWriter() %></label></td>
		  <td><label>작성일</label></td>
		  <td><label><%=article.getRegdate() %></label></td>
		</tr>
		<tr>
		  <td><label>아이피</label></td>
		  <td><label><%=article.getIp() %></label></td>
		  <td><label>조회수</label></td>
		  <td><label><%=article.getHitcount() %></label></td>
		</tr>
		<tr height="300px">
		  <td colspan="4">
		  <textarea style="height: 300px;" cols="50" rows="40" class="form-control" name="content" ><%=article.getContent() %></textarea>
		  </td>
		</tr>
	</table>
	<br>
	<div class = "form-group">
		<input type="submit" class="btn btn-primary" id="sendMessageButton" value="Modify">
	</div>
	</form>
	</div>

</body>
</html>