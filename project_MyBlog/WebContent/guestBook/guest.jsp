<%@page import="kr.or.kosta.blog.guestbook.dto.Guestbook"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.blog.guestbook.dao.GuestbookDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
// 방명록 리스트를 보여주기 위해 guestbook dao생성
List<Guestbook> list = null;
DaoFactory factory = new JdbcDaoFactory();
GuestbookDao dao = factory.getGuestbookDao();
list = dao.listAll();

// 로그인여부 확인을 위한 쿠키확인
Cookie[] cookies = request.getCookies();
Cookie loginCookie = null;
for(Cookie cookie : cookies){
	if(cookie.getName().equals("loginId")){
		loginCookie = cookie;
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

    <title>Fresiwon - Guest Book</title>

    <!-- Bootstrap core CSS -->
    <link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Resources/css/clean-blog.min.css" rel="stylesheet">
    <link href="../Resources/css/custom.css" rel="stylesheet">

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
              <h1>Guest Book</h1>
              <span class="subheading">Leave a Message for Fresiwon Blog :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p>Leave a Message for Fresiwon Blog Right Now!</p>
          <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
          <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
          <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
          <form action="guest_action.jsp" method="post" name="sentMessage" id="contactForm" ><!-- novalidate -->
<!-- ----내가 만들어쓴거-방명록 ui------------------------------------------------------------------- -->
		  <div class="control-group">
		  	<div>
		  	<%
		  	if(loginCookie != null){
		  	%>
		  	<textarea rows="4" cols="50" name="contents" placeholder="Leave a Message..."></textarea>
            <button type="submit" class="btn btn-primary" id="sendMessageButton">확인</button>
			<%
			}else{
			%>
			<textarea rows="4" cols="50" disabled placeholder="need a login"></textarea>
            <button type="button" disabled class="btn btn-primary" id="sendMessageButton">확인</button>
            <%
			}
            %>
		  	</div>
          </form>
		  
		  </div>
		  <div class="form-group floating-label-form-group controls">
                <p class="help-block text-danger"></p>
          </div>
		  <div>
		  <br>
		    <table class="container" border="1px solid black">
		      <thead>
		      <tr>
		      <td>작성자</td>
		      <td>내용</td>
		      <td>등록일</td>
		      </tr>
		      </thead>
		      <tbody>
		     <%if(list != null){
		    	 for(Guestbook guestbook : list){
		    %>
		    <tr>
		    	<td><%=guestbook.getUser_id() %></td>
		    	<td><%=guestbook.getContents() %></td>
		    	<td><%=guestbook.getRegdate() %></td>
		    </tr>
		    <%
		    	 }
		     }
		     %>
		      </tbody>
		    </table>
		  </div>
<!-- ------------------------------------------------------------------------------------ -->
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
    

    <!-- Contact Form JavaScript  
    <script src="../Resources/js/jqBootstrapValidation.js"></script>
    <script src="../Resources/js/contact_me.js"></script> -->
     

    <!-- Custom scripts for this template -->
    <script src="../Resources/js/clean-blog.min.js"></script> 

  </body>

</html>
