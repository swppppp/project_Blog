<%@page import="kr.or.kosta.blog.common.PageBuilder"%>
<%@page import="kr.or.kosta.blog.common.Params"%>
<%@page import="kr.or.kosta.blog.article.dto.Article"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.blog.article.dao.ArticleDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
DaoFactory factory = (DaoFactory)application.getAttribute("factory");
ArticleDao dao = factory.getArticleDao();
//List<Article> list = dao.listAll();

// 페이징처리
// 페이지당 보여지는 게시글목록 수
int listSize = 3;
// 한 화면의 페이지 수
int pageSize = 10;

// 선택한 페이지 수신.. 선택페이지 없으면 1로
String requestPage = request.getParameter("page");
if(requestPage == null || requestPage.equals("")){
	requestPage = "1";
}

// 검색요청일 경우 값 수신
String searchType = request.getParameter("searchType");
String searchValue = request.getParameter("searchValue");
if(searchType == null || searchType.equals("")){
	searchType = null;
	searchValue = null;
}

// 요청파라미터 포장
Params params = new Params(Integer.parseInt(requestPage), listSize, pageSize, searchType, searchValue);
List<Article> list = dao.listByPage(params);

// 페이지 처리에 필요한 검색 갯수 DB조회
int rowCount = dao.countBySearch(params);

// pageBuilder를 이용하여 페이징 계산
PageBuilder pageBuilder = new PageBuilder(params, rowCount);
pageBuilder.build();
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
                <td><%=(rowCount - listSize * (params.getPage()-1) ) - i %></td>
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
<div>
    <div class="pagination" style="text-align: center;">
    <%
    // 처음으로
    if(pageBuilder.isShowFirst()){
    %>
      <a href="<%=pageBuilder.getQueryString(1)%>">처음으로</a>
    <%
    }
    %>
    <%
    // 이전으로
    if(pageBuilder.isShowPrevious()){
    %>
      <a href="<%=pageBuilder.getQueryString(pageBuilder.getPreviousStartPage()) %>">&laquo;</a>
    <%
    }
    %>
    <%
    for(int i = pageBuilder.getStartPage(); i<=pageBuilder.getEndPage(); i++){
    	if(i == params.getPage()){
    %>
      <a class="active"><%=i %></a>
    <%
    	}else{
    %>
      <a href="<%=pageBuilder.getQueryString(i) %>"><%=i %></a>
    <%
    	}
    }
    %>
    <%
    // 다음으로
    if(pageBuilder.isShowNext()){
    %>
      <a href="<%=pageBuilder.getQueryString(pageBuilder.getNextStartPage()) %>">&laquo;</a>
    <%
    }
    %>
    <%
    // 마지막으로
    if(pageBuilder.isShowLast()){
    %>
      <a href="<%=pageBuilder.getQueryString(pageBuilder.getPageCount())%>">끝으로</a>
    <%
    }
    %>
    </div>
  <div id="btnDiv" style="float: right;">
<button onclick="location.href='../index2.jsp'">홈으로</button>
<button onclick="location.href='article_form.jsp'">글쓰기</button>
  </div>
</div>
    <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>
	


</body>
</html>