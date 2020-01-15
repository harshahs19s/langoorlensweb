<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ page import ="java.util.Calendar"  %> 
 <%@ page import ="java.util.Date"  %> 
<%@ page import = "java.util.GregorianCalendar" %> 
<%@ page import="App.GetCon"%>
<HTML>
 <table border="1">
 <tr><th>  Date  </th> <th> Time </th> <th> Price </th> <th> Photo </th> <th> Download </th> </tr>
   <%
   
      Date date = new Date();
	    System.out.println(date);
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, -3);
	      Date newDate =  cal.getTime();
   try{      
	  //  Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con=GetCon.getCon();
	   String user_id=(String)session.getAttribute("userid1");

	    //----------------------------debited amount from user wallet
	   Statement stmt=con.createStatement();
	    String strQuery = "select * from download_history where user_id = "+user_id ;
	    ResultSet rs = stmt.executeQuery(strQuery);
	
	   while(rs.next()){
		//   if(rs.getDate(3).after(newDate)){
		      %>
		      <tr>
		     
		      <td>
		       
                <%= rs.getDate(3) %>
		      </td>
		       <td>
		        <%= rs.getTime(4) %>
		      </td>
		        <td>
		        <%= rs.getFloat(5) %>
		      </td>
		        <td>
		        <img src="userphotoprint.jsp?imgid=<%=rs.getInt(1)%>" width="100" height="100">
		      </td>
		       <td>
		       <a href="downloaduserServlet?param=<%=rs.getInt(1)%>">Re-download Photo</a>
		      </td>
		      </tr>
		      <%
		  // }
	   }
	    rs.close();
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