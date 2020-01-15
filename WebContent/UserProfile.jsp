<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
		<title>Profile</title>

		<meta name="description" content="3 styles with inline editable feature" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
		<link rel="stylesheet" href="assets/css/jquery.gritter.css" />
		<link rel="stylesheet" href="assets/css/select2.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-editable.css" />

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

<div class="navbar">
			<div style="background-color:black" class="navbar-inner">
				<div  class="container-fluid">
					<a href="#" class="brand">
						<small>
							
							LANGOOR LENS
						</small>
					</a><!--/.brand-->
					<a href="LogoutServlet" style="float:right;color:white">
							LOG OUT	
					</a>

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
						<a href="gallery.jsp">
							<i class="icon-picture"></i>
							<span class="menu-text"> GALLERY </span>
						</a>
					</li>
					

					
							<li class="active" >
								<a href="UserHomeServlet">
									<i class="icon-double-angle-right"></i>
									PROFILE
								</a>
							</li>

						   <li>
								<a href="pricing1.jsp?userid=${userid}">
									<i class="icon-double-angle-right"></i>
									WALLET
								</a>
							</li>
							
							<li>
					
								<a href="UserTransaction2.jsp?userid=${userid}">
									<i class="icon-double-angle-right"></i>
									WALLET HISTORY
								</a>
					</li>
					
					
					  <li>
								<a href="UserDownloadPhoto.jsp?userid=${userid}">
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

			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">						
						<li class="active">User Profile</li>
					</ul><!--.breadcrumb-->

					
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							User Profile Page							
						</h1>
					</div><!--/.page-header-->
					
					
				  
					
					
			          	<form method="post" action="updateDP" enctype="multipart/form-data">
			          	<span class="profile-picture">
					   <img id="avatar" style="width:200px;height:200px;" class="editable" alt="Alex's Avatar" src="getProfileImage?ID=${userid}" />    
			          </span>
			<table border="0">
				<tr>
                    <td colspan="0"><input type="file" name="photo"  size="3"/></input>
                    <input type="submit"  value="Change">
                    
                    
                    </td>
				</tr>
			</table>`
		</form>
	 
					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->
							<div class="hr dotted"></div>							
										<div class="profile-user-info profile-user-info-striped">
											<form method="post" action="UpdateUser" enctype="multipart/form-data">	
											<div class="profile-info-row">
												<div class="profile-info-name"> Name </div>

												<div class="profile-info-value">
													<span class="editable" id="username1"><input type="text" name="name" value="${name}" size="30"/></input></span>
												</div>
											</div>
																																
											<div class="profile-info-row">
												<div class="profile-info-name"> Login Name </div>

												<div class="profile-info-value">
													<span class="editable" id="username">${user}</span>
												</div>
											</div>
											
											<div class="profile-info-row">
												<div class="profile-info-name"> User Id </div>

												<div class="profile-info-value">
													<span class="editable" id="username">${userid}</span>
												</div>
											</div>
											

											<div class="profile-info-row">
												<div class="profile-info-name"> Email </div>

												<div class="profile-info-value">													
													<span class="editable" id="email">${email}</span>													
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Date of Birth </div>

												<div class="profile-info-value">
													<span class="editable" id="dob">${dob}</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name"> Wats_App Num: </div>

												<div class="profile-info-value">
													<span class="editable" id="watsapp"><input type="text" name="phone" value="${watsapp}" size="30"/></input></span>
												</div>
											</div>
                                   
											<div class="profile-info-row">
												<div class="profile-info-name"> College </div>

												<div class="profile-info-value">
													<span class="editable" id="college">${college}</span>
												</div>
												
												
												<div class="profile-info-row">
												<div class="profile-info-name"> Designation </div>

												<div class="profile-info-value">
													<span class="editable" id="username">${desig}</span>
												</div>
											</div>
												
												
											</div>
											
												<div class="profile-info-row">
												<div class="profile-info-name">Course</div>

												<div class="profile-info-value">
													<span class="editable" id="username">${course}</span>
												</div>
											</div>
																						
											
												<div class="profile-info-row">
												<div class="profile-info-name"> Year </div>

												<div class="profile-info-value">
													<span class="editable" id="username">${yearfrom}-${yearto}</span>
												</div>
											</div>
											

											<div class="profile-info-row">
												<div class="profile-info-name"> Wallet </div>

												<div class="profile-info-value">
													<span class="editable" id="wallet">${wallet}</span>
												</div>
											</div>
											<div class="profile-info-row">
												
									<div class="clearfix">
									
									
										</div>
												
											</div>
												 <input type="submit" value="Save Changes"></input>
										
										</form>
										</div>
										</div>
										
										
									
									
									<div id="user-profile-3" class="user-profile row-fluid">
									<div class="offset1 span10">
										<div class="well well-small">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											&nbsp;
											<div class="inline middle blue bigger-110"> Your profile is 70% complete </div>

											&nbsp; &nbsp; &nbsp;
											<div style="width:200px;" data-percent="70%" class="inline middle no-margin progress progress-success progress-striped active">
												<div class="bar" style="width:70%"></div>
											</div>
										</div><!--/well-->

										<div class="space"></div>

										
											<div class="tabbable">
												<ul class="nav nav-tabs padding-16">
													<li class="active">
														<a data-toggle="tab" href="#edit-basic">
															<i class="green icon-edit bigger-125"></i>
															Basic Info
														</a>
													</li>

													<li>
														<a data-toggle="tab" href="#edit-settings">
															<i class="purple icon-cog bigger-125"></i>
															Rights
														</a>
													</li>

													<li>
														<a data-toggle="tab" href="#edit-password">
															<i class="blue icon-key bigger-125"></i>
															Password
														</a>
													</li>
													
													
													
													
											
													
													
													
													
													
												</ul>

												<div class="tab-content profile-edit-tab-content">
													<div id="edit-basic" class="tab-pane in active">
														<h4 class="header blue bolder smaller">General</h4>

														<div class="row-fluid">
															<div class="span4">
																<input type="file" />
															</div>

															<div class="vspace"></div>

															<div class="span8">
																<div class="control-group">
																	<label class="control-label" for="form-field-username">Username</label>

																	<div class="controls">
																		<input type="text" id="form-field-username" placeholder="Username" value="" />
																	</div>
																</div>

																											</div>
														</div>

														<hr />
														<div class="control-group">
															<label class="control-label" for="form-field-date">Birth Date</label>

															<div class="controls">
																<div class="input-append">
																	<input class="input-small date-picker" id="form-field-date" type="text" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy" />
																	<span class="add-on">
																		<i class="icon-calendar"></i>
																	</span>
																</div>
															</div>
														</div>

														<div class="control-group">
															<label class="control-label">Gender</label>

															<div class="controls">
																<div class="space-2"></div>

																<label class="inline">
																	<input name="form-field-radio" type="radio" />
																	<span class="lbl"> Male</span>
																</label>

																&nbsp; &nbsp; &nbsp;
																<label class="inline">
																	<input name="form-field-radio" type="radio" />
																	<span class="lbl"> Female</span>
																</label>
															</div>
														</div>

														<div class="space"></div>
														<h4 class="header blue bolder smaller">Upload ID Proof</h4>
														<div class="row-fluid">
															<div class="span4">
																<input type="file" />
															</div>

															<div class="vspace"></div>

															<div class="span8">
																<div class="control-group">
																	<label class="control-label" for="form-field-username">Type Of ID</label>

																	<div class="controls">
																		<input type="text" id="form-field-username" style="width:320px" placeholder="AADHAR / VOTERID / DL / PASSPORT / PAN" value="" />
																	</div>
																</div>

																											</div>
														</div>
														
														<div class="space"></div>
														<h4 class="header blue bolder smaller">Contact</h4>

														<div class="control-group">
															<label class="control-label" for="form-field-email">Email</label>

															<div class="controls">
																<span class="input-icon input-icon-right">
																	<input type="email" id="form-field-email" value="alexdoe@gmail.com" />
																	<i class="icon-envelope"></i>
																</span>
															</div>
														</div>


														<div class="control-group">
															<label class="control-label" for="form-field-phone">Phone</label>

															<div class="controls">
																<span class="input-icon input-icon-right">
																	<input class="" type="text" id="form-field-phone" />
																	<i class="icon-phone icon-flip-horizontal"></i>
																</span>
															</div>
														</div>

														<div class="space"></div>
														<h4 class="header blue bolder smaller">Social</h4>

														<div class="control-group">
															<label class="control-label" for="form-field-facebook">Facebook</label>

															<div class="controls">
																<span class="input-icon">
																	<input type="text" value="facebook_alexdoe" id="form-field-facebook" />
																	<i class="icon-facebook"></i>
																</span>
															</div>
														</div>

														

														
													</div>

													<div id="edit-settings" class="tab-pane">
														<div class="space-10"></div>

														<div>
															<label class="inline">
																<input type="checkbox" name="form-field-checkbox" />
																<span class="lbl"> Share my photos with Institution </span>
															</label>
														</div>

														<div class="space-8"></div>

														<div>
															<label class="inline">
																<input type="checkbox" name="form-field-checkbox" />
																<span class="lbl"> Interested in Edited Photos</span>
															</label>
														</div>

														<div class="space-8"></div>
                                                       
														<div>
															<label class="inline">
																<input type="checkbox" name="form-field-checkbox" />
																<span class="lbl"> Interested in my portrait painting </span>
															</label>
														</div>
																
														<div class="space-8"></div>
														<div>
															<label class="inline">
																<input type="checkbox" name="form-field-checkbox" />
																<span class="lbl"> Allow others to Gift me </span>
															</label>
														</div>											</div>

													<div id="edit-password" class="tab-pane">
														<div class="space-10"></div>

													
														
														
														
														
										<form name=F1 method="post" OnSubmit="return validate()" action="changepassword">
													<div id="edit-password" class="tab-pane">
														<div class="space-10"></div>

														<div class="control-group">
															<label class="control-label" for="form-field-pass1">New Password</label>

															<div class="controls">
																<input type="text" name="pass" id="form-field-pass1" />
															</div>
														</div>
														<input type="text" name="uid" value="${userid}" id="form-field-pass1" style="display:none" />

														<div class="control-group">
															<label class="control-label" for="form-field-pass2">Confirm Password</label>

															<div class="controls">
																<input type="text" name="pass1" id="form-field-pass2" />
															</div>
													
													
														</div>
														
														
														
													</div>
													
													
													<button  class="">
																SUBMIT
																<i class="icon-arrow-right icon-on-right"></i>
													</button>
													
								       </form>
														
														
														
														
														
													</div>
												</div>
											</div>

											<div class="form-actions">
												<button class="btn btn-info" type="button">
													<i class="icon-ok bigger-110"></i>
													Save
												</button>

												&nbsp; &nbsp; &nbsp;
												<button class="btn" type="reset">
													<i class="icon-undo bigger-110"></i>
													Reset
												</button>
											</div>
										
									</div><!--/span-->
								</div><!--/user-profile-->
								
								
										
                                          <br>
                                          <br>
                                         
                                 
                                 
                                 
                                 
                                 
                                          

							
							
							
							
							
							
							

							

							<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
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
		
		<script type="text/javascript">
		
		function validate(form)
		{
			
		if(document.F1.pass.value == "" || document.F1.pass1.value == "")
			{
			
			alert("Enter password"); 
			document.F1.pass.value=""
			document.F1.pass1.value=""
			document.F1.pass.focus()	
			return false
			
			}
		if(document.F1.pass.value!=document.F1.pass1.value)
		{
			
			
			alert("Check Confirm PWD"); 
			document.F1.pass.value=""
			document.F1.pass1.value=""
			document.F1.pass.focus()	
			return false
		}
		return true
		}
		</script>

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

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.gritter.min.js"></script>
		<script src="assets/js/bootbox.min.js"></script>
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="assets/js/jquery.hotkeys.min.js"></script>
		<script src="assets/js/bootstrap-wysiwyg.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
		<script src="assets/js/x-editable/bootstrap-editable.min.js"></script>
		<script src="assets/js/x-editable/ace-editable.min.js"></script>
		<script src="assets/js/jquery.maskedinput.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
			
				//editables on first profile page
				$.fn.editable.defaults.mode = 'inline';
				$.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
			    $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button></form>'+
			                                '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';    
				
				//editables 
			    $('#username').editable({
			           type: 'text',
			           name: 'username'
			    });
			
				var countries = [];
			    $.each({ "CA": "Canada", "IN": "India", "NL": "Netherlands", "TR": "Turkey", "US": "United States"}, function(k, v) {
			        countries.push({id: k, text: v});
			    });
			
				var cities = [];
				cities["CA"] = [];
				$.each(["Toronto", "Ottawa", "Calgary", "Vancouver"] , function(k, v){
					cities["CA"].push({id: v, text: v});
				});
				cities["IN"] = [];
				$.each(["Delhi", "Mumbai", "Bangalore"] , function(k, v){
					cities["IN"].push({id: v, text: v});
				});
				cities["NL"] = [];
				$.each(["Amsterdam", "Rotterdam", "The Hague"] , function(k, v){
					cities["NL"].push({id: v, text: v});
				});
				cities["TR"] = [];
				$.each(["Ankara", "Istanbul", "Izmir"] , function(k, v){
					cities["TR"].push({id: v, text: v});
				});
				cities["US"] = [];
				$.each(["New York", "Miami", "Los Angeles", "Chicago", "Wysconsin"] , function(k, v){
					cities["US"].push({id: v, text: v});
				});
				
				var currentValue = "NL";
			    $('#country').editable({
					type: 'select2',
					value : 'NL',
			        source: countries,
					success: function(response, newValue) {
						if(currentValue == newValue) return;
						currentValue = newValue;
						
						var source = (!newValue || newValue == "") ? [] : cities[newValue];
						$('#city').editable('destroy').editable({
							type: 'select2',
							source: source
						}).editable('setValue', null);
					}
			    });
			
				$('#city').editable({
					type: 'select2',
					value : 'Amsterdam',
			        source: cities[currentValue]
			    });
			
			
			
				$('#signup').editable({
					type: 'date',
					format: 'yyyy-mm-dd',
					viewformat: 'dd/mm/yyyy',
					datepicker: {
						weekStart: 1
					}
				});
			
			    $('#age').editable({
			        type: 'spinner',
					name : 'age',
					spinner : {
						min : 16, max:99, step:1
					}
				});
				
				//var $range = document.createElement("INPUT");
				//$range.type = 'range';
			    $('#login').editable({
			        type: 'slider',//$range.type == 'range' ? 'range' : 'slider',
					name : 'login',
					slider : {
						min : 1, max:50, width:100
					},
					success: function(response, newValue) {
						if(parseInt(newValue) == 1)
							$(this).html(newValue + " hour ago");
						else $(this).html(newValue + " hours ago");
					}
				});
			
				$('#about').editable({
					mode: 'inline',
			        type: 'wysiwyg',
					name : 'about',
					wysiwyg : {
						//css : {'max-width':'300px'}
					},
					success: function(response, newValue) {
					}
				});
				
				
				
				// *** editable avatar *** //
				try {//ie8 throws some harmless exception, so let's catch it
			
					//it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
					//so let's have a fake appendChild for it!
					if( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ) Image.prototype.appendChild = function(el){}
			
					var last_gritter
					$('#avatar').editable({
						type: 'image',
						name: 'avatar',
						value: null,
						image: {
							//specify ace file input plugin's options here
							btn_choose: 'Change Avatar',
							droppable: true,
							/**
							//this will override the default before_change that only accepts image files
							before_change: function(files, dropped) {
								return true;
							},
							*/
			
							//and a few extra ones here
							name: 'avatar',//put the field name here as well, will be used inside the custom plugin
							max_size: 110000,//~100Kb
							on_error : function(code) {//on_error function will be called when the selected file has a problem
								if(last_gritter) $.gritter.remove(last_gritter);
								if(code == 1) {//file format error
									last_gritter = $.gritter.add({
										title: 'File is not an image!',
										text: 'Please choose a jpg|gif|png image!',
										class_name: 'gritter-error gritter-center'
									});
								} else if(code == 2) {//file size rror
									last_gritter = $.gritter.add({
										title: 'File too big!',
										text: 'Image size should not exceed 100Kb!',
										class_name: 'gritter-error gritter-center'
									});
								}
								else {//other error
								}
							},
							on_success : function() {
								$.gritter.removeAll();
							}
						},
					    url: function(params) {
							// ***UPDATE AVATAR HERE*** //
							//You can replace the contents of this function with examples/profile-avatar-update.js for actual upload
			
			
							var deferred = new $.Deferred
			
							//if value is empty, means no valid files were selected
							//but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
							//so we return just here to prevent problems
							var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
							if(!value || value.length == 0) {
								deferred.resolve();
								return deferred.promise();
							}
			
			
							//dummy upload
							setTimeout(function(){
								if("FileReader" in window) {
									//for browsers that have a thumbnail of selected image
									var thumb = $('#avatar').next().find('img').data('thumb');
									if(thumb) $('#avatar').get(0).src = thumb;
								}
								
								deferred.resolve({'status':'OK'});
			
								if(last_gritter) $.gritter.remove(last_gritter);
								last_gritter = $.gritter.add({
									title: 'Avatar Updated!',
									text: 'Uploading to server can be easily implemented. A working example is included with the template.',
									class_name: 'gritter-info gritter-center'
								});
								
							 } , parseInt(Math.random() * 800 + 800))
			
							return deferred.promise();
						},
						
						success: function(response, newValue) {
						}
					})
				}catch(e) {}
				
				
			
				//another option is using modals
				$('#avatar2').on('click', function(){
					var modal = 
					'<div class="modal hide fade">\
						<div class="modal-header">\
							<button type="button" class="close" data-dismiss="modal">&times;</button>\
							<h4 class="blue">Change Avatar</h4>\
						</div>\
						\
						<form class="no-margin">\
						<div class="modal-body">\
							<div class="space-4"></div>\
							<div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
						</div>\
						\
						<div class="modal-footer center">\
							<button type="submit" class="btn btn-small btn-success"><i class="icon-ok"></i> Submit</button>\
							<button type="button" class="btn btn-small" data-dismiss="modal"><i class="icon-remove"></i> Cancel</button>\
						</div>\
						</form>\
					</div>';
					
					
					var modal = $(modal);
					modal.modal("show").on("hidden", function(){
						modal.remove();
					});
			
					var working = false;
			
					var form = modal.find('form:eq(0)');
					var file = form.find('input[type=file]').eq(0);
					file.ace_file_input({
						style:'well',
						btn_choose:'Click to choose new avatar',
						btn_change:null,
						no_icon:'icon-picture',
						thumbnail:'small',
						before_remove: function() {
							//don't remove/reset files while being uploaded
							return !working;
						},
						before_change: function(files, dropped) {
							var file = files[0];
							if(typeof file === "string") {
								//file is just a file name here (in browsers that don't support FileReader API)
								if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
							}
							else {//file is a File object
								var type = $.trim(file.type);
								if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
										|| ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
									) return false;
			
								if( file.size > 110000 ) {//~100Kb
									return false;
								}
							}
			
							return true;
						}
					});
			
					form.on('submit', function(){
						if(!file.data('ace_input_files')) return false;
						
						file.ace_file_input('disable');
						form.find('button').attr('disabled', 'disabled');
						form.find('.modal-body').append("<div class='center'><i class='icon-spinner icon-spin bigger-150 orange'></i></div>");
						
						var deferred = new $.Deferred;
						working = true;
						deferred.done(function() {
							form.find('button').removeAttr('disabled');
							form.find('input[type=file]').ace_file_input('enable');
							form.find('.modal-body > :last-child').remove();
							
							modal.modal("hide");
			
							var thumb = file.next().find('img').data('thumb');
							if(thumb) $('#avatar2').get(0).src = thumb;
			
							working = false;
						});
						
						
						setTimeout(function(){
							deferred.resolve();
						} , parseInt(Math.random() * 800 + 800));
			
						return false;
					});
							
				});
			
				
			
				//////////////////////////////
				$('#profile-feed-1').slimScroll({
				height: '250px',
				alwaysVisible : true
				});
			
				$('.profile-social-links > a').tooltip();
			
				$('.easy-pie-chart.percentage').each(function(){
				var barColor = $(this).data('color') || '#555';
				var trackColor = '#E2E2E2';
				var size = parseInt($(this).data('size')) || 72;
				$(this).easyPieChart({
					barColor: barColor,
					trackColor: trackColor,
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: parseInt(size/10),
					animate:false,
					size: size
				}).css('color', barColor);
				});
			  
				///////////////////////////////////////////
			
				//show the user info on right or left depending on its position
				$('#user-profile-2 .memberdiv').on('mouseenter', function(){
					var $this = $(this);
					var $parent = $this.closest('.tab-pane');
			
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $this.offset();
					var w2 = $this.width();
			
					var place = 'left';
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) place = 'right';
					
					$this.find('.popover').removeClass('right left').addClass(place);
				}).on('click', function() {
					return false;
				});
			
			
				///////////////////////////////////////////
				$('#user-profile-3')
				.find('input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Upload Image',
					btn_change:null,
					no_icon:'icon-picture',
					thumbnail:'large',
					droppable:true,
					before_change: function(files, dropped) {
						var file = files[0];
						if(typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
							if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
						}
						else {//file is a File object
							var type = $.trim(file.type);
							if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
									|| ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
								) return false;
			
							if( file.size > 110000 ) {//~100Kb
								return false;
							}
						}
			
						return true;
					}
				})
				.end().find('button[type=reset]').on(ace.click_event, function(){
					$('#user-profile-3 input[type=file]').ace_file_input('reset_input');
				})
				.end().find('.date-picker').datepicker().next().on(ace.click_event, function(){
					$(this).prev().focus();
				})
				$('.input-mask-phone').mask('(999) 999-9999');
			
			
			
				////////////////////
				//change profile
				$('[data-toggle="buttons-radio"]').on('click', function(e){
					var target = $(e.target);
					var which = parseInt($.trim(target.text()));
					$('.user-profile').parent().hide();
					$('#user-profile-'+which).parent().show();
				});
			});
		</script>
</body>
</html>