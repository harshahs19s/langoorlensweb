<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="App.GetCon"%>
	<%@ page import="java.util.ArrayList"%>
    <%@ page import="java.util.Iterator"%>
   <%ArrayList data=(ArrayList)request.getAttribute("data"); %> 
   <%String str=(String)request.getAttribute("hello"); %>
  <!--<table> 
	 <thead>
	 
	 <th>Name</th>
	  <th>values</th>
	   <th>Amount</th>
	    <th>Date</th>
	     <th>Name</th>
	 <th>Name</th>  
	 </thead>
	 
	 <tbody>
	  <%
   Iterator itr=data.iterator();
   int count=0;
   while(itr.hasNext())
   {
	 %>
	 <tr>
	 <td><%=data.get(0) %></td>
	 <td><%=data.get(1) %></td>
	 <td><%=data.get(2) %></td>
	 <td><%=data.get(3) %></td>
	 <td><%=data.get(4) %></td>
	 <td><%=data.get(5) %></td>
	</tr>
	 
	 
	 
	 <%   
   }
   
   %>
   </tbody>
   
   </table>
    --> 
    <h1><%=str %></h1>
</body>
</html>