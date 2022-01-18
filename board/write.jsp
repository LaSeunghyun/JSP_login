<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")==null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp'
	</script>
<% 		
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 글쓰기</title>
</head>
<style>
	.title{ width : 1000px; }
	.content{ width : 1000px; height : 500px; }
</style>
<body>
	<h2> 커뮤니티 - 글쓰기 </h2>
	<!--  form action : write_ok.jsp
		  작성자 : session.getAttribute("userid")
		  제목 : b_title
		  내용 : b_content
		  
		  write_ok.jsp에서 db insert
		  -> list.jsp로 이동
	  -->
	  <form action="./write_ok.jsp" method="post">
	  <p>글쓰기</p>
	  <p>제목</p>
	  <input type="text" maxlength="20" class="title" name="b_title">
	  <p>작성자 <%=session.getAttribute("userid")%> </p>
	  <p>내용</p>
	  <textarea rows="5" cols="40" class="content" name="b_content">글을 작성해주세요.</textarea>
	  <p><input type="submit" value="작성 완료"> | <input type="reset" value="다시 작성"> | <input type="button" value="리스트" onclick="location.href=list.jsp"></p> 
	  </form>
</body>
</html>
<%
	}
%>