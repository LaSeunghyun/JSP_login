<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    <%@page import="java.sql.*"%>
	<%@page import="com.koreait.db.Dbconn"%>
<%
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("userid")==null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='../login.jsp'
	</script>
<% 		
	}else{
		String b_idx = request.getParameter("b_idx");
	    String b_title = "";
	    String b_content = "";
	    String b_regdate = "";

		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String sql = "";
	    
		try{
			conn = Dbconn.getConnection();
			if(conn != null){
				sql = "select b_idx, b_title, b_content, b_regdate from tb_board where b_idx = ?";
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, b_idx);
			    rs = pstmt.executeQuery();
			    if(rs.next()){
			    	b_title = rs.getString("b_title");
			    	b_content = rs.getString("b_content");
			    	b_regdate = rs.getString("b_regdate");
			    }
			}
		}catch(Exception e){
			e.printStackTrace();
		}

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 글 수정</title>
</head>
<style>
	.title{ width : 1000px; }
	.content{ width : 1000px; height : 500px; }
</style>
<body>
	<h2> 커뮤니티 - 글 수정 </h2>
	<!--  form action : write_ok.jsp
		  작성자 : session.getAttribute("userid")
		  제목 : b_title
		  내용 : b_content
		  
		  write_ok.jsp에서 db insert
		  -> list.jsp로 이
	  -->
	  <form action="./edit_ok.jsp?b_idx=<%=b_idx%>" method="post">
	  <input type="hidden" name="b_idx" value="<%=b_idx%>">
	  <p>제목 <input type="text" maxlength="20" class="title" name="b_title" value="<%=b_title%>"></p>
	  <p>작성자 <%=session.getAttribute("userid")%></p>
	  <p>내용</p>
	  <p><textarea rows="5" cols="40" class="content" name="b_content"><%=b_content%></textarea></p>
	  <p><input type="submit" value="수정 완료"> | <input type="reset" value="다시 작성"> | <input type="button" value="리스트" onclick="location.href=./list.jsp"></p> 
	  </form>
</body>
</html>
<%
	}
%>