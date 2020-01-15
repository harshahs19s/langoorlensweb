<%@page import="App.UserHistoryClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>User</title>

<meta name="description" content="Static &amp; Dynamic Tables" />
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

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

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
int ch=1;
HttpSession sessionsa = request.getSession(false);
if(sessionsa==null){
	out.print("Please login first");  
    request.getRequestDispatcher("login.html").include(request, response);
}
String suser = (String)sessionsa.getAttribute("USER");
		String userid=(String)sessionsa.getAttribute("userid1");
		
		%>





	<div class="navbar">
			<div style="background-color: black;" class="navbar-inner">
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
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
			class="menu-text"></span>
		</a>

			<div class="sidebar" id="sidebar">
				
				<ul class="nav nav-list">
					
					
					
					<li>
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

						   <li>
								<a href="pricing1.jsp">
									<i class="icon-double-angle-right"></i>
									WALLET
								</a>
							</li>
							
							
							<li class="active">
					
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
			
			<div class="page-content">
				<div class="page-header position-relative">
					<h1>
						Transaction History <small> <i class="icon-double-angle-right"></i>
							Reports
						</small>
					</h1>
				</div>
				<!--/.page-header-->

				<div class="row-fluid">
					<div class="span12">
						<!--PAGE CONTENT BEGINS-->


						<div class="row-fluid">
							<div class="span6" style="width: 100%">
								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
										<li class="active"><a data-toggle="tab" href="#home">

												CREDITED </a></li>

										<li><a data-toggle="tab" href="#profile2"> DEBITED
												
										</a></li>
								 	<!--  	<li><a data-toggle="tab" href="#profile1"> 
												ALL TRANSACTIONS <span class="badge badge-important">4</span>
										</a></li>
										<li><a  href="UserSearchByDate.jsp"> SEARCH BY DATE
												 <span class="badge badge-important"></span>
										</a></li>-->
											
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">






											<div class="row-fluid">
												<h3 class="header smaller lighter blue">
													</h3>
												<div class="table-header">Results
													</div>

												<table 
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>Date</th>
															<th>Time</th>
															<th>Amount Credited</th>

															<th>Transaction ID</th>
															
														</tr>
													</thead>
													<tbody>
<%

ResultSet rs_credit=UserHistoryClass.creditHistory(userid);


while(rs_credit.next())
{



%>

													
														



														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=rs_credit.getDate(1) %></td>
															
															<td><%=rs_credit.getTime(2) %></td>
															<td><%=rs_credit.getFloat(3) %></td>
															<td><%=rs_credit.getString(4) %></td>

															
															


														</tr>
															

													
													
													<%} %><% try{
										
										rs_credit.close();
									}catch(Exception e){} %>
								
													</tbody>
												</table>
											</div>




										</div>
										
										
										
							
								
										<div id="profile2" class="tab-pane">





											<div class="row-fluid">
												<h3 class="header smaller lighter blue">
												 <span class="green"></span> <span class="green"></span>
												
												</h3>
												<div class="table-header">Results
													</div>

												<table
													class="table table-striped table-bordered table-hover">
													<thead>







														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															
															<th>Date</th>

															<th>Time</th>
															<th>Amount Debited</th>

															
														</tr>
													</thead>

													<tbody>
<%

ResultSet rs_debit=UserHistoryClass.debitHistory(userid);


while(rs_debit.next())
{



%>

		
														
										<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															
											<td ><%=rs_debit.getDate(1) %></td>
											<td ><%=rs_debit.getTime(2) %></td>

											
											<td>
												<span ><%=rs_debit.getFloat(3) %></span>
											</td>

											
										</tr>

									<%} %>
									<% try{
										
										rs_debit.close();
									}catch(Exception e){} %>
									</tbody>
								</table>
							</div>
                                    
										</div>		
							<!-- 	 	<div id="profile1" class="tab-pane">





											<div class="row-fluid">
												<h3 class="header smaller lighter blue">Upload History
												Total Price: <span class="green">amount_uploaded</span>  All Uploads <span class="green"> total_photos_uploaded </span>
												
												</h3>
												<div class="table-header">Results
													</div>

												<table id="sample-table-4"
													class="table table-striped table-bordered table-hover">
													<thead>







														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															
															<th>Date</th>

															<th>Time</th>
															<th class="hidden-480"></th>

															
														</tr>
													</thead>

													<tbody>

														
										<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

											<td >Var12</td>
											<td >Var13</td>

											
											<td class="hidden-480">
												<span >Var15</span>
											</td>

											
										</tr>

									
									</tbody>
								</table>
							</div>
                                     











										</div>  -->
									</div>
								</div>
							</div>
				

						</div>
						<!--/row-->







					</div>
					<!--/.span-->
				</div>
				<!--/.row-fluid-->
			</div>
			<!--/.page-content-->

			
			<!--/#ace-settings-container-->
		</div>
		<!--/.main-content-->
	</div>
	<!--/.main-container-->

	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only bigger-110"></i>
	</a>

	<!--basic scripts-->

	<!--[if !IE]>-->

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]>-->

	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>

	<script type="text/javascript">
		
	</script>

	<!--<![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!--page specific plugin scripts-->

	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

	<!--ace scripts-->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!--inline scripts related to this page-->

	<script type="text/javascript">
		$(function() {
			var oTable1 = $('#sample-table-2').dataTable({
				"aoColumns" : [ {
					"bSortable" : false
				}, null, null, null, null, {
					"bSortable" : false
				} ]
			});

			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

			$('[data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
		})
	</script>

	<script type="text/javascript">
		$(function() {
			var oTable1 = $('#sample-table-3').dataTable({
				"aoColumns" : [ {
					"bSortable" : false
				}, null, null, null, null, null, {
					"bSortable" : false
				} ]
			});

			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

			$('[data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
		})
	</script>


	<script type="text/javascript">
		$(function() {
			var oTable1 = $('#sample-table-4').dataTable({
				"aoColumns" : [ {
					"bSortable" : false
				}, null, null, null, null, null, {
					"bSortable" : false
				} ]
			});

			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

			$('[data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
		})
	</script>

</body>
</html>
