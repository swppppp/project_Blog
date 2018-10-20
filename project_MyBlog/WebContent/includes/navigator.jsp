<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
Cookie cookie = null;
Cookie[] cookies = request.getCookies();
for(Cookie cookie2 : cookies){
	if(cookie2.getName().equals("loginId")){
		cookie = cookie2;
	}
}
%>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="../index2.jsp">Fresiwon</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="../index2.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">About Me</a>
            </li>
            <li class="nav-item">
            <li class="nav-item">
              <a class="nav-link" href="../guestBook/guest.jsp">Guest Book</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../board/board.jsp">Free Board</a>
            </li>
            <%
            if(cookie == null){
            %>
            <li class="nav-item">
              <a class="nav-link" href="../user/join_form.jsp">Join</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../user/login_form.jsp">Login</a>
            </li>
            <%
            }else{
            %>
            <li class="nav-item">
              <a class="nav-link" href="../user/logout_action.jsp">Logout</a>
            </li>
			<%
            }
			%>
          </ul>
        </div>
      </div>
    </nav>
