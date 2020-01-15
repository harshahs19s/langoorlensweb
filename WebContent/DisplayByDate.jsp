<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
HttpSession sessionsa = request.getSession(false);
if(sessionsa==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = (String)sessionsa.getAttribute("USER");
if(!(suser.equals("admin")))
{
	request.getRequestDispatcher("login.html").include(request, response);
}
%>
<% String price =(String) request.getAttribute("price");
   String photos=(String)request.getAttribute("photos");
   String status=(String)request.getAttribute("status");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">


header,footer{
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}
</style>
<meta charset="utf-8" />
<title>History By Date</title>

</head>
<body>
<div class="navbar">
			<div  class="navbar-inner">
				<div  class="container-fluid">
					<a class="brand">
					
							<header>
							LANGOOR LENS
							</header>
						
						
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">
<!--						<li class="grey">
  							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>
-->
  							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
<!--								<li class="nav-header">
									<i class="icon-ok"></i>
									4 Tasks to complete
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Software Update</span>
											<span class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:65%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Hardware Upgrade</span>
											<span class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini progress-danger">
											<div style="width:35%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Unit Testing</span>
											<span class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini progress-warning">
											<div style="width:15%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Bug Fixes</span>
											<span class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-success progress-striped active">
											<div style="width:90%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See tasks with details
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
-->


																	</ul><!--/.ace-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				
			</a>

			<div class="sidebar" id="sidebar">
				

<ul class="nav nav-list">
					<li >
						<a href="tempr.html">
							<i class="icon-picture"></i>
							<span class="menu-text">BACK </span>
						</a>
					</li>
							
						   
                    
					
				</ul><!--/.nav-list-->

			</div>
					<div class="row-fluid">
						<div class="span12">
						<center>
						<%
						if(status.equals("upload")){
							%>	
		<h1>Upload Details </h1>
		<% } else { %>
		
		<h1>Download Details </h1>
		
		<% } %>
		<!--<h2>Profile Photo</h2>  -->
		                    <div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="row-fluid">
								<!-- <ul class="ace-thumbnails">
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
									
									</ul> -->
									
									</div>
								</div>
							</div>

		
		
	
			<table border="0">			
			
				<!--  <tr>
					<td>Admin Name: </td>
					<td><input type="text" name="username"  value=""  size="50"/></td>
				</tr>	
				-->
				<tr>
					<td>Total Photos : </td>
					<td><input type="text" name="PHOTOS" readonly value="<%=photos %>"  size="50"/></td>
				</tr>	
				<tr>
					<td>Amount : </td>
					<td><input type="text" name="AMOUNT" readonly value="<%=price%>"  size="50"/></td>
				</tr>
				
				<tr>
				</tr>
			</table>
		
	</center>
</body>
</html>