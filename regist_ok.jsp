<%@page import="com.koreait.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.koreait.db.Dbconn"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
    <jsp:useBean id="member" class="com.koreait.member.MemberDTO"/>
    <jsp:setProperty property="*" name="member"/>
  
    <jsp:useBean id="dao" class="com.koreait.member.MemberDAO"/>
<%
	if(dao.join(member) == 1){
%>
	<script>
		alert('회원가입이 완료되었습니다.');
		location.href='login.jsp';
	</script>
<%
	} else {
%>
	<script>
		alert('회원가입이 실패하였습니다.');
		history.back();
	</script>
<%
	}
%>


<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h2>회원가입 완료!</h2>
    <p>아이디 : <jsp:getProperty property="userid" name="member"/></p>
    <p>이름 : <jsp:getProperty property="name" name="member"/></p>
    <p>휴대폰 번호 : <jsp:getProperty property="hp" name="member"/></p>
    <p>이메일 : <jsp:getProperty property="email" name="member"/></p>
    <p>취미 : <jsp:getProperty property="hobby" name="member"/></p>
    <p>주민등록번호 : <jsp:getProperty property="ssn1" name="member"/> - <jsp:getProperty property="ssn2" name="member"/></p>
    <p>우편번호 : <jsp:getProperty property="zipcode" name="member"/></p>
    <p>주소 : <jsp:getProperty property="address1" name="member"/></p>
    <p>세부주소 : <jsp:getProperty property="address2" name="member"/></p>
    <p>참고항목 : <jsp:getProperty property="address3" name="member"/></p>
    <p><a href='./login.jsp'>로그인하러 가기</a></p>
</body>
</html> --%>