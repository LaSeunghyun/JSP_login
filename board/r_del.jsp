<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
	<%@page import="com.koreait.db.Dbconn"%>
<%
	request.setCharacterEncoding("UTF-8");
	String r_idx = request.getParameter("r_idx");
	String b_idx = request.getParameter("b_idx");

	Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "";
    
	try{
    	conn = Dbconn.getConnection();
    	if(conn != null){
    		sql = "delete from tb_reply where r_idx = ?";
    	   	pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, r_idx);
     	    pstmt.executeUpdate();
%>
		<script>
			alert('삭제되었습니다.');
			location.href='./view.jsp?b_idx=<%=b_idx%>'
		</script>
<%   	    
        }        	
	}catch(Exception e){
    	e.printStackTrace();
	}
%>