<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<HTML>
 <table border="1">
 <tr><th>amount </th><th>date</th> <th>time</th></tr>
   <%
   try{      
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photoapp","root","1234");
	 /*   String s="vinaycv";//username
	    String s1="vinaycv";//password
	    //--------------------getting unique user_id for further operationss
	    PreparedStatement pstmt1=con.prepareStatement("select user_id from user where username= ? and password= ? ");
	    pstmt1.setString(1,s);
	    pstmt1.setString(2,s1);
	    int user_id=0;
	    ResultSet rs = pstmt1.executeQuery();
	    if(rs.next()){
		     user_id=rs.getInt(1);
	    	System.out.println("for this userid   "+rs.getInt(1));
	   }*/   String user_id=(String)request.getParameter("userid");
	   //----------------------------debited amount from user wallet
	   Statement stmt=con.createStatement();
	    String strQuery = "select * from payment_history where user_id = "+user_id ;
	    ResultSet rs1 = stmt.executeQuery(strQuery);
	
	   while(rs1.next()){
		   %>
		      <tr>
		      <td> amount credited :  <%= rs1.getFloat(5) %>  </td>
		      <td>
		        date : <%=rs1.getDate(3)%>
		      </td>
		       <td>
		        time : <%=rs1.getTime(4)%>
		      </td>
		      </tr>
		      <%
	  
	   }
	   
	  //-------------------------credited amount to user wallet
	   Statement stmt1=con.createStatement();
	    String strQuery1 = "select * from download_history where user_id = "+user_id ;
	    ResultSet rs2 = stmt1.executeQuery(strQuery1);
	
	   while(rs2.next()){
		   %>
		      <tr>
		      <td> amount  debited :  <%= rs2.getFloat(5) %>  </td>
		      <td>
		        date : <%=rs2.getDate(3)%>
		      </td>
		       <td>
		        time : <%=rs2.getTime(4)%>
		      </td>
		      </tr>
		      <%
	   }
    rs2.close();
    rs1.close();
    con.close();
    stmt.close();
	   }
  catch(Exception e)
  {
    e.getMessage();
  }
  %>
 </table>
</HTML>