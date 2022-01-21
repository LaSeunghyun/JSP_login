<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.koreait.member.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
	     
<jsp:useBean id="dao" class="com.koreait.member.MemberDAO"/>
<%
	String userid = (String)session.getAttribute("userid");
	String userpw = (String)session.getAttribute("userpw");
	String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <%
    	if(userid == null){
    %>
    	<form action="login_ok.jsp" method="post">
    		<p>아이디 : <input type="text" name="userid"></p>
    		<p>비밀번호 : <input type="password" name="userpw"></p>
    		<p><input type="submit" value="로그인"></p>
    	<p>아직 회원이 아니시라면? <a href='./regist.jsp'>회원가입 하러가기</a></p>
    <%
    	}else{
    %>  	<h3><%=userid%>(<%=name%>)님 환영합니다.</h3>
    		<p><input type="button" value="커뮤니티" onclick="location.href='./board/list.jsp'">
    		<input type="button" value="정보수정" onclick="location.href='info.jsp'">
    		<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></p>
    	</form>
    <%
    	}
    %>
</body>
</html>