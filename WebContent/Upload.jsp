<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload to Database</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
response.setHeader("Cache-Control", "no-cache, private, no-store, max-stale=0");
HttpSession sessionsa = request.getSession(false);
if(sessionsa==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = (String)sessionsa.getAttribute("USER");
%>
<% String u = request.getParameter("uname"); 
%>
	<center>
		<h1>Photo Upload to Database</h1>
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

		
		
		<form method="post" action="uploadServlet" enctype="multipart/form-data">
			<table border="0">			
			 <tr><th>USERNAME</th><th>PRICE</th><th>TIME</th><th>PORTRAIT PHOTO</th></tr>
				<tr>
					
					<td><input type="text" name="username" readonly value="<%=u%>"  size="30"/></td><br>
				
					
					<td><input type="text" name="price" value=""  size="30"/></td><br>
				
					
					<td><input type="text" name="time" value=""  size="30"/></td><br>
				
					
					<td><input type="file" name="photo" size="30"/></td><br>
			   
				</tr>
				
				<tr>
					
					<td><input type="text" name="username1" readonly value="<%=u%>"  size="30"/></td>
			
					<td><input type="text" name="price1" value=""  size="30"/></td>
				
					<td><input type="text" name="time1" value=""  size="30"/></td>
			
					<td><input type="file" name="photo1" size="30"/></td>
				</tr>
				<tr>
					<td><input type="text" name="username2" readonly value="<%=u%>"  size="30"/></td>
				
					<td><input type="text" name="price2" value=""  size="30"/></td>
			
					<td><input type="text" name="time2" value=""  size="30"/></td>
			
					<td><input type="file" name="photo2" size="30"/></td>
				</tr>
				<tr>
					
					<td><input type="text" name="username3" readonly value="<%=u%>"  size="30"/></td>
			
					<td><input type="text" name="price3" value=""  size="30"/></td>
				
					<td><input type="text" name="time3" value=""  size="30"/></td>
				
					<td><input type="file" name="photo3" size="30"/></td>
				</tr>
				<tr>
					
					<td><input type="text" name="username4" readonly value="<%=u%>"  size="30"/></td>
				
					<td><input type="text" name="price4" value=""  size="30"/></td>
				
					<td><input type="text" name="time4" value=""  size="30"/></td>
			
					<td><input type="file" name="photo4" size="30"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Save">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>