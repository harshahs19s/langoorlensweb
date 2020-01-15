<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="App.GetCon"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>LANGOORLENS</title>

		<meta name="description" content="Large &amp; Small" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<%
if(session==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = (String)session.getAttribute("USER");
System.out.println(suser);
String userid=(String)session.getAttribute("userid1");
System.out.println(userid);
%>
	<body>
		<div class="navbar">
			<div style="background-color:black" class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							
							LANGOOR LENS
						</small>
					</a><!--/.brand-->
                   <a href="LogoutServlet" style="float:right;color:white">
							LOG OUT	
					</a>

				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					
				</div><!--#sidebar-shortcuts-->
			

				<ul class="nav nav-list">
					
					
					
					
					<li >
						<a href="gallery.jsp">
							<i class="icon-picture"></i>
							<span class="menu-text"> GALLERY </span>
						</a>
					</li>
					

					
							<li >
								<a href="UserHomeServlet">
									<i class="icon-double-angle-right"></i>
									PROFILE
								</a>
							</li>


					 <li class="active">
								<a href="pricing1.jsp">
									<i class="icon-double-angle-right"></i>
									WALLET
								</a>
							</li>
							

						  
							<li>
					
								<a href="UserTransaction2.jsp">
									<i class="icon-double-angle-right"></i>
									WALLET HISTORY
								</a>
					</li>
					
					
					  <li>
								<a href="UserDownloadPhoto.jsp">
									<i class="icon-double-angle-right"></i>
									DOWNLOADS
								</a>
							</li>
							
							
					
                     <li>
						<a href="#">
							<i class="icon-picture"></i>
							<span class="menu-text"> FAQ </span>
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
						<li>
							<i class="icon-home home-icon"></i>
							<a href="#">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>

						<li>
							<a href="#">More Pages</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">Pricing Tables</li>
					</ul><!--.breadcrumb-->

					<div class="nav-search" id="nav-search">
						<form class="form-search" />
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							WALLET AMOUNT
							<small>
							
							<%
							
							String Var;
							 Connection con=GetCon.getCon();
					    	PreparedStatement ps;
					    	ResultSet rs = null;
					    	
					    		try {
									ps = con.prepareStatement("SELECT wallet FROM user where username=?");
									ps.setString(1, suser);
									rs = ps.executeQuery();
									
									while(rs.next())
						    		{
						    			
						    		System.out.println(rs.getString(1));	
						    		
						    		%>
						    		<i class="icon-double-angle-right">
									 <%=rs.getString(1)%></i>
									 <% 
						    		
                                      }
									
									
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
					    
							
							%>
							
							
							
								
							  
							</small>
						</h1>
					</div><!--/.page-header-->
					

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<div class="row-fluid">
								<div class="span3">
									<div class="widget-box pricing-box">
										<div class="widget-header header-color-dark">
											<h5 class="bigger lighter">PAYTM</h5>
										</div>
                                        
                                        <form name=wallet method="post" OnSubmit="" action="walletupdate">
										<div class="widget-body">
											<div class="widget-main">
												<ul class="unstyled spaced2">
													

													<span class="profile-picture">
														<img id="avatar" style="width:200px;height:200px;" class="editable" alt="Alex's Avatar" src="assets/avatars/profile-pic.jpg" />
											        </span>
                                                   <br>
                                                   <br>
                                                    
                                                    
                                                    <h5 style="font-weight:14px" > Or Enter mobile number </h5>
                                                    <p style="font-size:20px;padding-left:20%;">9611418555 </p>
                                                    
												<div class="control-group">
													<label class="control-label" for="form-field-1">Transaction ID</label>

														<div class="controls">
															<input type="text" name="tid" placeholder="Transaction Id" required pattern="[0-9]{13,14}"  oninvalid="this.setCustomValidity('Enter Valid Transaction ID')" oninput="this.setCustomValidity('')"/>
									 					</div>
												</div>
													
								
												</ul>

												
											</div>

											<div>
												<button class="btn btn-block btn-primary">
													<span >SUBMIT</span>
												</button>
											</div>
										</div>
										</form>
									</div>
								</div>

								<div class="span3">
									<div class="widget-box pricing-box">
										<div class="widget-header header-color-orange">
											<h5 class="bigger lighter">CASH RECHARGE SPOT</h5>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<ul class="unstyled spaced2">
													<li>
														<i class="icon-ok green"></i>
														Jayanagar 9th block canteen
													</li>

													<li>
														<i class="icon-ok green"></i>
														CMS lalbhag road canteen
													</li>

													<li>
														<i class="icon-ok green"></i>
														JC road canteen
										
																									</ul>

												
											</div>

											
										</div>
									</div>
								</div>

								<div class="span3">
									<div class="widget-box pricing-box">
										<div class="widget-header header-color-blue">
											<h5 class="bigger lighter">ONLINE BANKING</h5>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<ul class="unstyled spaced2">
													<li>
														<i class="icon-ok green"></i>
														DEBIT CARD
													</li>

													<li>
														<i class="icon-ok green"></i>
														CREDIT CARD
													</li>

													<li>
														<i class="icon-ok green"></i>
														NETBANKING
													</li>

																									</ul>

												
												
											</div>

											<div>
												<a  class="btn btn-block btn-primary">
													<span >COMING SOON</span>
												</a>
											</div>
										</div>
									</div>
								</div>

								<div class="span3">
									<div class="widget-box pricing-box">
										<div class="widget-header header-color-green">
											<h5 class="bigger lighter">TRANSFER AMOUNT</h5>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<ul class="unstyled spaced2">
													<div class="control-group">
													<label class="control-label" for="form-field-1">USER ID</label>

														<div class="controls">
															<input type="text" id="form-field-1" placeholder="" />
									 					</div>
													</div>
													<div class="control-group">
													<label class="control-label" for="form-field-1">USER NAME</label>

														<div class="controls">
															<input type="text" id="form-field-1" placeholder="" />
									 					</div>
													</div>
													<div class="control-group">
													<label class="control-label" for="form-field-1">AMOUNT</label>

														<div class="controls">
															<input type="text" id="form-field-1" placeholder="" />
									 					</div>
													</div>
													

						
												</ul>

												
												
											</div>

											<div>
												<a href="#" class="btn btn-block btn-success">
													<span>COMMING SOON</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

											</div><!--/.page-content-->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

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
		<% String message = (String)request.getAttribute("status");%>
		 var msg = "<%=message%>";
		 if(msg!="null")
			 {
			 alert(msg);
			 }
		    
		
		</script>

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

<script type="text/javascript">
$(function(){
	<script type="text/javascript">
	$(function() {
	
		$('#accordion2').on('hide', function (e) {
			$(e.target).prev().children(0).addClass('collapsed');
		})
		$('#accordion2').on('hidden', function (e) {
			$(e.target).prev().children(0).addClass('collapsed');
		})
		$('#accordion2').on('show', function (e) {
			$(e.target).prev().children(0).removeClass('collapsed');
		})
		$('#accordion2').on('shown', function (e) {
			$(e.target).prev().children(0).removeClass('collapsed');
		})
	
	
		var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
		$('.easy-pie-chart.percentage').each(function(){
			$(this).easyPieChart({
				barColor: $(this).data('color'),
				trackColor: '#EEEEEE',
				scaleColor: false,
				lineCap: 'butt',
				lineWidth: 8,
				animate: oldie ? false : 1000,
				size:75
			}).css('color', $(this).data('color'));
		});
	
		$('[data-rel=tooltip]').tooltip();
		$('[data-rel=popover]').popover({html:true});
	
	
		$('#gritter-regular').on(ace.click_event, function(){
			$.gritter.add({
				title: 'This is a regular notice!',
				text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="blue">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				image: $assets+'/avatars/avatar1.png',
				sticky: false,
				time: '',
				class_name: (!$('#gritter-light').get(0).checked ? 'gritter-light' : '')
			});
	
			return false;
		});
	
		$('#gritter-sticky').on(ace.click_event, function(){
			var unique_id = $.gritter.add({
				title: 'This is a sticky notice!',
				text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="red">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				image: $assets+'/avatars/avatar.png',
				sticky: true,
				time: '',
				class_name: 'gritter-info' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
			});
	
			return false;
		});
	
	
		$('#gritter-without-image').on(ace.click_event, function(){
			$.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a notice without an image!',
				// (string | mandatory) the text inside the notification
				text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="orange">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				class_name: 'gritter-success' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
			});
	
			return false;
		});
	
	
		$('#gritter-max3').on(ace.click_event, function(){
			$.gritter.add({
				title: 'This is a notice with a max of 3 on screen at one time!',
				text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="green">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				image: $assets+'/avatars/avatar3.png',
				sticky: false,
				before_open: function(){
					if($('.gritter-item-wrapper').length >= 3)
					{
						return false;
					}
				},
				class_name: 'gritter-warning' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
			});
	
			return false;
		});
	
	
		$('#gritter-center').on(ace.click_event, function(){
			$.gritter.add({
				title: 'This is a centered notification',
				text: 'Just add a "gritter-center" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
				class_name: 'gritter-info gritter-center' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
			});
	
			return false;
		});
		
		$('#gritter-error').on(ace.click_event, function(){
			$.gritter.add({
				title: 'This is a warning notification',
				text: 'Just add a "gritter-light" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
				class_name: 'gritter-error' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
			});
	
			return false;
		});
			
	
		$("#gritter-remove").on(ace.click_event, function(){
			$.gritter.removeAll();
			return false;
		});
			
	
		///////
	
	
		$("#bootbox-regular").on(ace.click_event, function() {
			bootbox.prompt("What is your name?", function(result) {
				if (result === null) {
					//Example.show("Prompt dismissed");
				} else {
					//Example.show("Hi <b>"+result+"</b>");
				}
			});
		});
			
		$("#bootbox-confirm").on(ace.click_event, function() {
			bootbox.confirm("Are you sure?", function(result) {
				if(result) {
					bootbox.alert("You are sure!");
				}
			});
		});
			
		$("#bootbox-options").on(ace.click_event, function() {
			bootbox.dialog("I am a custom dialog with smaller buttons", [{
				"label" : "Success!",
				"class" : "btn-small btn-success",
				"callback": function() {
					//Example.show("great success");
				}
				}, {
				"label" : "Danger!",
				"class" : "btn-small btn-danger",
				"callback": function() {
					//Example.show("uh oh, look out!");
				}
				}, {
				"label" : "Click ME!",
				"class" : "btn-small btn-primary",
				"callback": function() {
					//Example.show("Primary button");
				}
				}, {
				"label" : "Just a button...",
				"class" : "btn-small"
				}]
			);
		});
	
	
	
		$('#spinner-opts small').css({display:'inline-block', width:'60px'})
	
		var slide_styles = ['', 'green','red','purple','orange', 'dark'];
		var ii = 0;
		$("#spinner-opts input[type=text]").each(function() {
			var $this = $(this);
			$this.hide().after('<span />');
			$this.next().addClass('ui-slider-small').
			addClass("inline ui-slider-"+slide_styles[ii++ % slide_styles.length]).
			css({'width':'125px'}).slider({
				value:parseInt($this.val()),
				range: "min",
				animate:true,
				min: parseInt($this.data('min')),
				max: parseInt($this.data('max')),
				step: parseFloat($this.data('step')),
				slide: function( event, ui ) {
					$this.attr('value', ui.value);
					spinner_update();
				}
			});
		});
	
	
	
	
	
		$.fn.spin = function(opts) {
			this.each(function() {
			  var $this = $(this),
				  data = $this.data();
	
			  if (data.spinner) {
				data.spinner.stop();
				delete data.spinner;
			  }
			  if (opts !== false) {
				data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
			  }
			});
			return this;
		};
	
		function spinner_update() {
			var opts = {};
			$('#spinner-opts input[type=text]').each(function() {
				opts[this.name] = parseFloat(this.value);
			});
			$('#spinner-preview').spin(opts);
		}
	
	
	
		$('#id-pills-stacked').removeAttr('checked').on('click', function(){
			$('.nav-pills').toggleClass('nav-stacked');
		});
	
	
	});
</script>


</script>

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

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->
	</body>
</html>
    