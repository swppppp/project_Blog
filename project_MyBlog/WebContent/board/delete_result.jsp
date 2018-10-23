<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="user" class="kr.or.kosta.blog.user.dao.User" scope="request"/>
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

    <title>Fresiwon - Delete Result</title>

    <!-- Bootstrap core CSS -->
    <link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Resources/css/clean-blog.min.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
		<jsp:include page="/includes/navigator.jsp"/>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('../Resources/img/contact-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>Delete Result</h1>
              <span class="subheading">Join Freshiwon Blog :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p style='text-align: center;'>Delete Success!</p>
          <h3 style="font-family: 'Lora', 'Times New Roman', serif;">Deleted Post..</h3>
		  <%String subject = request.getParameter("subject"); %>
		  <p>Title: <%=subject %><br>게시글을 정상적으로 삭제하였습니다.</p>          	
<!-- ---------------------------------------------------------------------------------------------------------------- -->
            <br>
            <div id="success"></div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary" id="sendMessageButton" onclick="location.href='../board/board.jsp'">FreeBoard</button>
            </div>
        </div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../Resources/vendor/jquery/jquery.min.js"></script>
    <script src="../Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="../Resources/js/jqBootstrapValidation.js"></script>
    <script src="../Resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../Resources/js/clean-blog.min.js"></script>

  </body>

</html>
