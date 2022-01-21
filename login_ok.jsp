<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="com.koreait.member.*"%>

	       <jsp:useBean id="anonymous" class="com.koreait.member.MemberDTO"/>
	       <jsp:setProperty property="*" name="anonymous"/>
	     
	       <jsp:useBean id="dao" class="com.koreait.member.MemberDAO"/>
<%
			MemberDTO member = dao.login(anonymous);
			String userid = member.getUserid();
			String name = member.getname();
			int idx = member.getIdx();
			
			session.setAttribute("userid", userid);
			session.setAttribute("userpw", userid);
			session.setAttribute("name", name);
			session.setAttribute("idx", idx);
			
  			if(dao.login(member) == null){
%>
      	 	<script>	
	  			   alert('로그인 되었습니다.');
	  			   location.href="login.jsp";
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
%>