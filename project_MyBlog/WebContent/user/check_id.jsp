<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String id = request.getParameter("checkedId");
String isDupChecked = null;// = request.getParameter("isDupChecked");
UserDao dao = (UserDao)application.getAttribute("userDao");
boolean idCheck = dao.checkId(id);
//아이디가 중복인경우
if(idCheck){
	isDupChecked = "duplicated";
%>
<jsp:forward page="../user/join_form.jsp">
	<jsp:param value="duplicated" name="checkResult"/>
</jsp:forward>
<%}else{
	isDupChecked = "checked";
%>
<jsp:forward page="/user/join_form.jsp">
	<jsp:param value="checked" name="checkResult"/>
	<jsp:param value="<%=id %>" name="id"/>
</jsp:forward>
<%
}
%>
