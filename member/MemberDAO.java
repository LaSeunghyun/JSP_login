package com.koreait.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.koreait.db.Dbconn;

public class MemberDAO {
    
    Connection conn = Dbconn.getConnection();
    private MemberDTO member;
	PreparedStatement pstmt;
    ResultSet rs;
    String sql = "";
	
	public int join(MemberDTO member) {
	    try{
	        if(conn != null){
	           sql = "insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	           pstmt = conn.prepareStatement(sql);
	           pstmt.setString(1, member.getUserid());
	           pstmt.setString(2, member.getUserpw());
	           pstmt.setString(3, member.getname());
	           pstmt.setString(4, member.getHp());
	           pstmt.setString(5, member.getEmail());
	           String hobbystr = "";
	           for(String hobby : member.getHobby()) {
	        	   hobbystr = hobbystr + hobby + " ";
	           }
	           pstmt.setString(6, hobbystr);
	           pstmt.setString(7, member.getSsn1());
	           pstmt.setString(8, member.getSsn2());
	           pstmt.setString(9, member.getZipcode());
	           pstmt.setString(10, member.getAddress1());
	           pstmt.setString(11, member.getAddress2());
	           pstmt.setString(12, member.getAddress3());
	           if(pstmt.executeUpdate() > 0) {
	        	   return 1;
	           }
           }
	     }catch(Exception e){
	        e.printStackTrace();
	     }
	    return 0;
	}
	public MemberDTO login(MemberDTO anonymous) {
		MemberDTO member = new MemberDTO();
		try {
			if(conn != null) {
  	    	  sql = "select mem_idx, mem_name from tb_member where mem_userid=? and mem_userpw=?";
  	    	  pstmt = conn.prepareStatement(sql);
  	    	  pstmt.setString(1, anonymous.getUserid());
  	    	  pstmt.setString(2, anonymous.getUserpw());
  	    	  rs = pstmt.executeQuery();
  	    	  if(rs.next()){
  	    		  member.setUserid(anonymous.getUserid());
  	    		  member.setname(rs.getString("mem_name"));
  	    		  member.setIdx(rs.getInt("mem_idx"));
  	    	  }else{
  	    		  return null;
  	    	  }
			}
	     }
		   catch(Exception e){
		        e.printStackTrace();
	     }
		  return member;
	}
}
		