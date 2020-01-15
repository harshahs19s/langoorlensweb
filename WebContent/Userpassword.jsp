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

<% 

HttpSession sessionsa = request.getSession(false);
if(sessionsa==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = (String)sessionsa.getAttribute("USER");
%>
<% String u = request.getParameter("userID"); %>
	<center>
		<h1>User Password </h1>
		<h2>Profile Photo</h2>
		                    <div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="row-fluid">
								<ul class="ace-thumbnails">
									<li>
										<a href="assets/images/gallery/image-1.jpg" title="Photo Title" data-rel="colorbox">
											<img alt="150x150" src="assets/images/gallery/thumb-1.jpg" />
											
										</a>
										<a href="assets/images/gallery/image-1.jpg" title="Photo Title" data-rel="colorbox">
											<img alt="150x150" src="assets/images/gallery/thumb-1.jpg" />
											
										</a>
										<a href="assets/images/gallery/image-1.jpg" title="Photo Title" data-rel="colorbox">
											<img alt="150x150" src="assets/images/gallery/thumb-1.jpg" />
											
										</a>

									</li>
									
									</ul>
									
									</div>
								</div>
							</div>

		
		
		<form method="post" action="UserPasswordAdmin"> <!-- enctype="multipart/form-data" -->
			<table border="0">			
			
				<!--  <tr>
					<td>Admin Name: </td>
					<td><input type="text" name="username"  value=""  size="50"/></td>
				</tr>	
				-->
				<tr>
					<td>Admin Password : </td>
					<td><input type="password" name="pwd" value=""  size="50"/></td>
				</tr>	
				<tr>
					<td>User ID : </td>
					<td><input type="text" name="userID" readonly value="<%=u%>"  size="50"/></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="Submit">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>