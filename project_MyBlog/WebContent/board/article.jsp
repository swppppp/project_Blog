<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
// System.out.println("게시글 id: " + request.getParameter("article_id"));
int article_id = Integer.parseInt(request.getParameter("article_id").trim());
System.out.println("게시글 id: "+article_id);
DaoFactory factory = new JdbcDaoFactory();
ArticleDao dao = factory.getArticleDao();
System.out.println("허허 조회수 올려줘요");
dao.hitCountChange(article_id);
Article article = dao.read(article_id);
System.out.println("조회수: "+article.getHitcount());
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
article페이지 입니다.<br>
	<table border="1px black">
		<tr>
		  <td>글 제목</td>
		  <td colspan="3"><%=article.getSubject() %></td>
		</tr>
		<tr>
		  <td>작성자</td><td><%=article.getWriter() %></td>
		  <td>작성일</td><td><%=article.getRegdate() %></td>
		</tr>
		<tr>
		  <td>아이피</td><td><%=article.getIp() %></td>
		  <td>조회수</td><td><%=article.getHitcount() %></td>
		</tr>
		<tr>
		  <td colspan="4"><%=article.getContent() %></td>
		</tr>
	</table>
<button>목록</button>
<button>답글</button>
<button>수정</button>

    <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>

</body>
</html>