<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
			if(session.getAttribute("userid") == null){
%>
			<script>
				alert('로그인 후 이용하세요');
				location.href='./2_login.jsp'
			</script>
<% 		
			}else{
	       		String userid = request.getParameter("userid");
	       		String userpw = request.getParameter("userpw");
	       		String name = request.getParameter("name");
	       		String hp = request.getParameter("hp");
	       		String email = request.getParameter("email");
	            String hobby[] = request.getParameterValues("hobby");
	            String hobbystr = "";
	            for(int i = 0; i< hobby.length; i++){
	                hobbystr += hobby[i] + " "; //드라이브 등산
	            }
	       		String zipcode = request.getParameter("zipcode");
	       		String address1 = request.getParameter("address1");
	       		String address2 = request.getParameter("address2");
	       		String address3 = request.getParameter("address3");
	        
	    	    Connection conn = null;
    		    PreparedStatement pstmt = null;
    	   	
    	  	 	String sql = "";
    	   		String url = "jdbc:mysql://localhost:3306/aiclass";
    		    String uid = "root";
    		    String upw = "1234";
    	   
	    	   try{
    		      Class.forName("com.mysql.cj.jdbc.Driver");
    		      conn = DriverManager.getConnection(url, uid, upw);
    	    	  if(conn != null){
    	    		  sql = "updata tb_member set mem_name=?, mem_hp=?, mem_email=?, mem_hobby=?, mem_zipcode=?, mem_address1=?, mem_address2=?, mem_address3=? where userid=?";
    	    	  	  pstmt = conn.prepareStatement(sql);
    	    	  	  pstmt.setString(1, name);
    	    		  pstmt.setString(2, hp);
    	    		  pstmt.setString(3, email);
    	    		  pstmt.setString(4, hobbystr);
    	    		  pstmt.setString(5, zipcode);
    	    		  pstmt.setString(6, address1);
    	    		  pstmt.setString(7, address2);
    	    		  pstmt.setString(8, address3);
    	    		  pstmt.setString(9, (String)session.getAttribute("userid"));
    	    		  pstmt.executeUpdate();
    	    	  }
				}catch(Exception e){
    	    			e.printStackTrace();
				}
	    	   %>        
       	 		<script>	
       		  	   alert('수정이 완료되었습니다.');
       		       location.href="info.jsp";
	     	  	</script>
<%
   			  }
%>