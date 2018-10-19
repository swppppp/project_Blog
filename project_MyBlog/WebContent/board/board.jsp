<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
DaoFactory factory = new JdbcDaoFactory();
ArticleDao dao = factory.getArticleDao();
List<Article> list = dao.listAll();
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

    <!-- Main Content -->
    
<%--검색폼 --%>
      <div class="search">
        <form>
          <select name="searchType">
            <option value="">전체</option>
            <option value="id">아이디</option>
            <option value="name">이름</option>
          </select>
          <input type="text" name="searchValue" placeholder="Search..">
          <input type="submit" value="검색">
        </form>
      </div>
<%--검색폼 끝 --%>

<%-- article목록 보여주는 table --%>
      <div class="w3-responsive w3-card-4">
        <table class="w3-table w3-striped w3-bordered">
          <thead>
            <tr class="w3-theme">
              <th>번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>ip</th>
              <th>조회</th>
            </tr>
          </thead>
          <tbody>
          <%
          for(int i=0; i<list.size(); i++){
        	  Article article = list.get(i);
          %>
          <form action="article.jsp">
          <input type="hidden" name="article_id" value="<%=article.getArticle_id() %>">
               <tr class="<%= (i%2)== 0 ? "w3-white" : "" %>" onclick="location.href='article.jsp?article_id=<%=article.getArticle_id() %>'" >
                <td><%=(i+1) %></td>
                <td><%=article.getSubject() %></td>
                <td><%=article.getWriter() %></td>
                <td><%=article.getRegdate() %></td>
                <td><%=article.getIp() %></td>
                <td><%=article.getHitcount() %></td>
                <td></td>
              </tr>
          </form>
		  <%
          }
		  %>
          </tbody>
        </table>
      </div>

<%--페이징처리 --%>
    <div class="pagination">
      <a href="#">&laquo;</a>
      <a class="active" href="#">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a href="#">&raquo;</a>
    </div>
	


</body>
</html>