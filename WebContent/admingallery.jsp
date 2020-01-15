<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
		<title>Gallery - super Admin</title>

		<meta name="description" content="responsive photo gallery using colorbox" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/style.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="assets/css/colorbox.css" />

		<!--fonts-->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!--ace styles-->

		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="App.GetCon"%>
<%@ page import="java.util.ArrayList"%>

<%
HttpSession sessionsa = request.getSession(false);
if(sessionsa==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = request.getParameter("USER");
//if(!(suser.equals("admin")))
//{
	//request.getRequestDispatcher("login.html").include(request, response);
//}
%>
<div class="navbar">
			<div style="background-color: black;" class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							LANG00R LENS
						</small>
					</a><!--/.brand-->

					
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="">
			<img alt="" src="assets/css/images/images.png">
			</a>

			<div class="sidebar" id="sidebar">
				
				<ul class="nav nav-list">
					<li class="active">
						<a href="adminuserprofilepass?USER=<%=suser%>">
							<i class="icon-picture"></i>
							<span class="menu-text">USER PROFILE</span>
						</a>
					</li>
					<li>
						<a href="admin.jsp">
							<i class="icon-dashboard"></i>
							<span class="menu-text"> Dashboard </span>
						</a>
					</li>

					

					<li>
						<a href="userlist.jsp">
							<i class="icon-list"></i>
							<span class="menu-text"> USERS </span>
						</a>
					</li>



                     <li>
						<a href="history.jsp">
							<i class="icon-list"></i>
							<span class="menu-text"> REPORTS </span>
						</a>
					</li>
					
					
					
				</ul><!--/.nav-list-->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						
						<li class="active">Gallery</li>
					</ul><!--.breadcrumb-->

				</div>

				<div style="background: #0f0d0d;height: 500px;" class="page-content">
<div class="page-header position-relative">
						<h5 style="color:white">
							WALLET AMOUNT
							<small>
								
							</small>
						</h5>
					</div><!--/.page-header-->
					
														
													

					
	






<%

class PhotoArray{
	int photoid;
	String validto;
	float price;
	PhotoArray(int photoid,String validto, float price)
	{
		this.photoid=photoid;
		this.validto=validto;
		this.price=price;
	}
}


ArrayList<PhotoArray> photo = new ArrayList<PhotoArray>(); 
Connection con=GetCon.getCon();
PreparedStatement ps;
try {
	ps = con.prepareStatement("SELECT photo_id,valid_to,price FROM photos P INNER JOIN user U ON P.user_id=U.user_id WHERE username=?  AND NOW() BETWEEN valid_from AND valid_to");
	ps.setString(1,suser);
	ResultSet rs=ps.executeQuery();
		while(rs.next())
		{	PreparedStatement ps1;
		int g=rs.getInt(1);
			ps1 = con.prepareStatement("SELECT status from upload_history where idupload_history = "+g);
			ResultSet rs1=ps1.executeQuery();
			rs1.next();
			if(rs1.getString(1).equals("uploaded")||rs1.getString(1).equals("expired")){
				photo.add(new PhotoArray(g,rs.getString(2),rs.getFloat(3)));}
		}
	}
	catch(Exception e){System.out.println(e);}

%>


<%  int count=photo.size()-1; int i,b,a,j;%>

                
 <ul class="slides">
<% for (i=0; i<=count; i++)
{ %>
	
		   
		
    <input type="radio" name="radio-btn" id="img-<%= i %>" checked />
  	  <li class="slide-container">
  	  
  	  		
  	  
		<div  class="slide">
		
				
		    
			
			<img style="border-radius: 10px 10px 0px 0px;object-fit: cover;" src="DisplayImage?ID=<%= photo.get(i).photoid %>"/>
			</a>	
			
            <span style="border-radius: 0px 0px 10px 10px;border-width: inherit;width:184px;padding-top:0px;margin-bottom:3px; border-color: #edf2f6" class="btn btn-info btn-small tooltip-info" onclick="" data-rel="popover" data-placement="bottom" title="Some Info" data-content=" photo is uploading to server.">TIME LEFT :<%=photo.get(i).validto %> </span>
		    <span style="width:184px;height:30px;border-radius: 10px;border-color: #edf2f6;border-width: inherit;margin-bottom:3px" class="btn btn-info btn-small tooltip-info"  data-rel="popover" data-placement="bottom" title="Some Info" data-content=" photo is uploading to server.">PRICE :<%= photo.get(i).price %></span>
			
			<span style="width:184px;height:30px;border-radius: 10px;border-color: #edf2f6;border-width: inherit;" class="btn btn-info btn-small tooltip-info" onclick="location.href='<%=request.getContextPath()%>/deletephoto?DN=<%= photo.get(i).photoid %>'" data-rel="popover" data-placement="bottom" icon="download" title="Some Info" data-content=" photo is uploading to server.">DELETE</span>		
        </div>
		<div class="nav">
		
		     

		<% 
				if(i == 0)
					{
						b=count;
					}
				else
				{
					b=i-1;
				}
				if(i == count)
				{
					a=0;
				}
				else
				{
					a=i+1;
				}
					
					%>
			<label for="img-<%= b %>" class="prev">&#x2039;</label>
			<label for="img-<%= a %>" class="next">&#x203a;</label>
		</div>
      </li>
<% } %>
   
 	<li class="nav-dots">
	<% for(i=0; i<=count; i++) { %>
      <label for="img-<%=i %>" class="nav-dot" id="img-dot-<%=i %>"></label>
      <% } %>
     </li>
 </ul>





</div>


										



				<div class="ace-settings-container" id="ace-settings-container">
					
					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9" />#438EB9
									<option data-class="skin-1" value="#222A2D" />#222A2D
									<option data-class="skin-2" value="#C6487E" />#C6487E
									<option data-class="skin-3" value="#D0D0D0" />#D0D0D0
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!--<![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<script src="assets/js/jquery.colorbox-min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
	var colorbox_params = {
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="icon-arrow-left"></i>',
		next:'<i class="icon-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'100%',
		maxHeight:'100%',
		onOpen:function(){
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = 'auto';
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};

	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
	$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon

	/**$(window).on('resize.colorbox', function() {
		try {
			//this function has been changed in recent versions of colorbox, so it won't work
			$.fn.colorbox.load();//to redraw the current frame
		} catch(e){}
	});*/
})
		</script>
		
		<script>
// Set the date we're counting down to
var countDownDate = new Date("2017-10-21 17:39:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now an the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
</script>
		
</body>
</html>