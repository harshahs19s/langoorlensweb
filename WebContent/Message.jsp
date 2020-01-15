<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>

<style>
.button {
    display: block;
    width: 160px;
    height: 15px;
    background: #4E9CAF;
    padding: 15px;
    text-align: center;
    border-radius: 54px;
    color: white;
    font-weight: bold;
}
</style>
</head>
<body>
<center>
		<h3><%=request.getAttribute("Message")%></h3>
		    <a class="button" href="Upload.jsp?uname=<%=request.getAttribute("mes")%>">
													Upload more photos</a><br>
													
													   <a class="button" href="adminuserprofilepass?USER=<%=request.getAttribute("mes")%>">
													User Profile</a><br>
													<a class="button" href="userlist.jsp">Users list</a>
</center>
</body>
</html>