<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String userid = request.getParameter("userid");
    	String userpw = request.getParameter("userpw");

    	Connection conn = null;
        Statement stmt = null;
    	StringBuilder sql = new StringBuilder();
    	
    	String url = "jdbc:mysql://localhost:3306/aiclass";
    	String uid = "root";
    	String upw = "1234";
    	   
    	try{        	
    	    Class.forName("com.mysql.cj.jdbc.Driver");
    	    conn = DriverManager.getConnection(url, uid, upw);
    	    stmt = conn.createStatement();
    	    if(conn != null){
    	       sql.append("select mem_idx from tb_member where mem_userid='"+userid).append("' and mem_userpw='"+userpw+"'");
    	       out.print(sql);
    	       ResultSet rs = stmt.executeQuery(sql.toString());
    	       if(rs.next()){
    %>     
    	 	<script>	
    	  			alert('로그인 되었습니다.');
    	  			location.href="2_login.jsp";
    	  	</script>
    <%
    	       }else{
    %>
        	<script>
    	    	   alert('아이디 혹은 비밀번호를 확인하세요.');
    	   		   history.back();
    	    </script>
    <% 	
     	   	   }
    	    }
    	}catch(Exception e){
    	      e.printStackTrace();
		}
	%>