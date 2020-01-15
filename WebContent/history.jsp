<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Admin</title>

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
		HttpSession sessionsa = request.getSession(false);
		if (sessionsa == null) {
			out.print("Please login first");
			request.getRequestDispatcher("login.html").include(request, response);
		}
		String suser = (String) sessionsa.getAttribute("USER");
		if(!(suser.equals("admin")))
		{
			out.print("Please login first");
			request.getRequestDispatcher("login.html").include(request, response);
		}
		 double amount_uploaded=0;
		 double amount_downloaded=0;
		 int total_photos_downloaded=0;
		 int total_photos_uploaded=0;
		 Connection con=GetCon.getCon();
		 PreparedStatement pst= con.prepareStatement("SELECT SUM(amount_credited), count(*) FROM download_history ");
		 ResultSet rst=pst.executeQuery();
	
		 if(rst.next())
		 {
			 amount_downloaded=rst.getInt(1);
			 total_photos_downloaded=rst.getInt(2);
		 }
		 PreparedStatement ps_uploadHistory= con.prepareStatement("SELECT SUM(price), count(*) FROM upload_history ");
		 ResultSet rs_uploadHistory=ps_uploadHistory.executeQuery();
	
		 if(rs_uploadHistory.next())
		 {
			 amount_uploaded=rs_uploadHistory.getInt(1);
			 total_photos_uploaded=rs_uploadHistory.getInt(2);
		 }
	%>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a href="#" class="brand"> <small> <i class="icon-leaf"></i>
						Super Admin
				</small>
				</a>
				<!--/.brand-->


			</div>
			<!--/.container-fluid-->
		</div>
		<!--/.navbar-inner-->
	</div>

	<div class="main-container container-fluid">
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
			class="menu-text"></span>
		</a>

		<div class="sidebar" id="sidebar">
			<div class="sidebar-shortcuts" id="sidebar-shortcuts"></div>
			<!--#sidebar-shortcuts-->

			<ul class="nav nav-list">
				<li><a href="admin.jsp"> <i class="icon-dashboard"></i> <span
						class="menu-text"> Dashboard </span>
				</a></li>



				<li><a href="userlist.jsp"> <i class="icon-list"></i> <span
						class="menu-text"> USERS </span>
				</a></li>

				<li class="active"><a href="history.jsp"> <i
						class="icon-list"></i> <span class="menu-text"> REPORTS </span>
				</a></li>



			</ul>
			<!--/.nav-list-->

			<div class="sidebar-collapse" id="sidebar-collapse">
				<i class="icon-double-angle-left"></i>
			</div>
		</div>

		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i> <a href="#">Home</a> <span
						class="divider"> <i class="icon-angle-right arrow-icon"></i>
					</span></li>
					<li class="active">History</li>
				</ul>
				<!--.breadcrumb-->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="input-small nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="icon-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="input-small nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="icon-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!--#nav-search-->
			</div>

			<div class="page-content">
				<div class="page-header position-relative">
					<h1>
						History <small> <i class="icon-double-angle-right"></i>
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

												Payment History </a></li>

										<li><a data-toggle="tab" href="#profile"> Downloads
												History <span class="badge badge-important">4</span>
										</a></li>
										<li><a data-toggle="tab" href="#profile1"> Uploads
												History <span class="badge badge-important">4</span>
										</a></li>
										<li><a  href="SearchByDate.jsp"> Search By Date
												 <span class="badge badge-important"></span>
										</a></li>
										

										<li class="dropdown"><a data-toggle="dropdown"
											class="dropdown-toggle" href="#"> <b class="caret"></b>
										</a>

											<ul class="dropdown-menu dropdown-info">
												<li><a data-toggle="tab" href="#dropdown1">@fat</a></li>

												<li><a data-toggle="tab" href="#dropdown2">@mdo</a></li>
											</ul></li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">






											<div class="row-fluid">
												<h3 class="header smaller lighter blue">Users Payment
													History</h3>
												<div class="table-header">Results for " Registered
													users"</div>

												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>User Name</th>
															<th>User Id</th>
															<th>Date</th>

															<th class="hidden-phone">Time</th>
															<th class="hidden-480">Amount Credited</th>

															<th>Type</th>
														</tr>
													</thead>

													<tbody>
														<%
															 con = GetCon.getCon();
															PreparedStatement ps = null;
															ResultSet rs = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															try {
																ps = con.prepareStatement("SELECT user_id,date,time,amount_debited,type FROM payment_history");
																rs = ps.executeQuery();

																while (rs.next()) {

																	System.out.println(rs.getString(1));
																	String Var = rs.getString(1);
																	// String Var1=rs.getString(2);
																	Date Var2 = rs.getDate(2);
																	Time Var3 = rs.getTime(3);
																	float Var4 = rs.getFloat(4);
																	String Var5 = rs.getString(5);

																	PreparedStatement ps1 = con.prepareStatement("SELECT username FROM user WHERE user_id=?");
																	ps1.setString(1, Var);
																	ResultSet rs1 = ps1.executeQuery();
																	if (rs1.next()) {
																		String Var6 = rs1.getString(1);
														%>





														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=Var6%></td>
															
															<td><%=Var%></td>
															<td><a><%=Var2%></a></td>
															<td class="hidden-phone"><%=Var3%></td>

															<td class="hidden-480"><span
																"class="label label-success"><%=Var4%></span>
															</td>
															<td><span><%=Var5%></span></td>


														</tr>
															<%
																}
															%>

															

														<%
															}

															} catch (SQLException e) {
																// TODO Auto-generated catch block
																e.printStackTrace();
															}
														%>


													</tbody>
												</table>
											</div>




										</div>

										<div id="profile" class="tab-pane">





											<div class="row-fluid">
												<h3 class="header smaller lighter blue">Download
													History:Amount Credited: <span class="green"><%=amount_downloaded %> </span>  All Downloads <span class="green"> <%=total_photos_downloaded %></span>  
													</h3>
													
													
												<div class="table-header">Results for "Registered
													users"</div>

												<table id="sample-table-3"
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>User Name</th>
															<th>User Id</th>
															<th>Date</th>

															<th>Time</th>
															<th class="hidden-480">Status</th>

															<th>Amount Credited</th>
														</tr>
													</thead>

													<tbody>
													<%
															Connection con44 = GetCon.getCon();
															PreparedStatement ps44 = null;
															ResultSet rs44 = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															try {
																ps44 = con44.prepareStatement("SELECT user_id,date,time,amount_credited FROM download_history");
																rs44 = ps44.executeQuery();

																while (rs44.next()) {

																	//System.out.println(rs.getString(1));
																	String Var31 = rs44.getString(1);
																	// String Var1=rs.getString(2);
																	Date Var32 = rs44.getDate(2);
																	Time Var33 = rs44.getTime(3);
																	float Var34 = rs44.getFloat(4);
																	//amount_downloaded+=Var34;
																	//String Var5 = rs.getString(5);

																	PreparedStatement ps31 = con44.prepareStatement("SELECT username FROM user WHERE user_id=?");
																	ps31.setString(1, Var31);
																	ResultSet rs31 = ps31.executeQuery();
																	if (rs31.next()) {
																		String Var36 = rs31.getString(1);
														%>

													


														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%= Var36 %></td>
															
															
															<td><%= Var31 %></td>
															<td><a><%= Var32 %></a></td>
															<td><%= Var33 %></td>

															<td class="hidden-480"><span>Downloaded</span></td>

															<td class="hidden-480"><span><%= Var34 %></span></td>


														</tr>
															<%
																	}
															
															

	
															}

															} catch (SQLException e) {
																// TODO Auto-generated catch block
																e.printStackTrace();
															}
														%>



													</tbody>
												</table>
											</div>

										</div>




										<div id="profile1" class="tab-pane">





											<div class="row-fluid">
												<h3 class="header smaller lighter blue">Upload History
												Total Price: <span class="green"><%=amount_uploaded %> </span>  All Uploads <span class="green"> <%=total_photos_uploaded %></span>
												
												</h3>
												<div class="table-header">Results for "Registered
													users"</div>

												<table id="sample-table-4"
													class="table table-striped table-bordered table-hover">
													<thead>







														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>User Name</th>
															<th>User Id</th>
															<th>Date</th>

															<th>Time</th>
															<th class="hidden-480">Status</th>

															<th>Photo Price</th>
														</tr>
													</thead>

													<tbody>
<%
															Connection con11 = GetCon.getCon();
															PreparedStatement ps11 = null;
															ResultSet rs11 = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															try {
																ps11 = con11.prepareStatement("SELECT user_id,date,time,status,price FROM upload_history");
																rs11 = ps11.executeQuery();

																while (rs11.next()) {

																	System.out.println(rs11.getString(1));
																	String Var11 = rs11.getString(1);
																	// String Var1=rs.getString(2);
																	Date Var12 = rs11.getDate(2);
																	Time Var13 = rs11.getTime(3);
																	String Var14 = rs11.getString(4);
																	float Var15 = rs11.getFloat(5);

																	PreparedStatement ps21 = con11.prepareStatement("SELECT username FROM user WHERE user_id=?");
																	ps21.setString(1, Var11);
																	ResultSet rs21 = ps21.executeQuery();
																	if (rs21.next()) {
																		String Var16 = rs21.getString(1);
														%>

														
										<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=Var16%></td>
															
															<td><%=Var11 %></td>
											<td ><%=Var12 %></td>
											<td ><%=Var13 %></td>

											<td class="hidden-480">
												<span ><%=Var14 %></span>
											</td>
											
											<td class="hidden-480">
												<span ><%=Var15 %></span>
											</td>

											
										</tr>
															<%
																}
													
															}

															} catch (SQLException e) {
																// TODO Auto-generated catch block
																e.printStackTrace();
															}
														%>


									
									</tbody>
								</table>
							</div>
                                     











										</div>















										<div id="dropdown1" class="tab-pane">








											<div class="row-fluid">
												<h3 class="header smaller lighter blue">Users History</h3>
												<div class="table-header">Results for "Latest
													Registered users"</div>

												<table id="sample-table-3"
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>User Name</th>
															<th>User Id</th>
															<th>Date</th>

															<th class="hidden-phone"><i
																class="icon-time bigger-110 hidden-phone"></i> Time</th>
															<th class="hidden-480">Status</th>

															<th></th>
														</tr>
													</thead>

													<tbody>



														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><a></a></td>
															<td></td>
															<td><a>12/10/2017</a></td>
															<td>16:40</td>

															<td class="hidden-480"><span
																"class="label label-success">Downloaded</span></td>

															<td class="td-actions">
																<div class="hidden-phone visible-desktop action-buttons">
																	<a class="blue" href="#"> <i
																		class="icon-zoom-in bigger-130"></i>
																	</a> <a class="green" href="#"> <i
																		class="icon-pencil bigger-130"></i>
																	</a> <a class="red" href="#"> <i
																		class="icon-trash bigger-130"></i>
																	</a>
																</div>

																<div class="hidden-desktop visible-phone">
																	<div class="inline position-relative">
																		<button
																			class="btn btn-minier btn-yellow dropdown-toggle"
																			data-toggle="dropdown">
																			<i class="icon-caret-down icon-only bigger-120"></i>
																		</button>

																		<ul
																			class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
																			<li><a href="deleteaccount" class="tooltip-info"
																				data-rel="tooltip" title="View"> <span
																					class="blue"> <i
																						class="icon-zoom-in bigger-120"></i>
																				</span>
																			</a></li>

																			<li><a href="#" class="tooltip-success"
																				data-rel="tooltip" title="Edit"> <span
																					class="green"> <i
																						class="icon-edit bigger-120"></i>
																				</span>
																			</a></li>

																			<li><a class="tooltip-error" data-rel="tooltip"
																				title="Delete"> <span class="red"> <i
																						class="icon-trash bigger-120"></i>
																				</span>
																			</a></li>
																		</ul>
																	</div>
																</div>
															</td>
														</tr>




													</tbody>
												</table>
											</div>













										</div>

										<div id="dropdown2" class="tab-pane">
											<p>Trust fund seitan letterpress, keytar raw denim
												keffiyeh etsy art party before they sold out master cleanse
												gluten-free squid scenester freegan cosby sweater. Fanny
												pack portland seitan DIY, art party locavore wolf cliche
												high life echo park Austin.</p>
										</div>
									</div>
								</div>
							</div>
							<!--/span-->

						</div>
						<!--/row-->







					</div>
					<!--/.span-->
				</div>
				<!--/.row-fluid-->
			</div>
			<!--/.page-content-->

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-mini btn-warning ace-settings-btn"
					id="ace-settings-btn">
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
						<input type="checkbox" class="ace-checkbox-2"
							id="ace-settings-header" /> <label class="lbl"
							for="ace-settings-header"> Fixed Header</label>
					</div>

					<div>
						<input type="checkbox" class="ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> Fixed Sidebar</label>
					</div>

					<div>
						<input type="checkbox" class="ace-checkbox-2"
							id="ace-settings-breadcrumbs" /> <label class="lbl"
							for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
					</div>

					<div>
						<input type="checkbox" class="ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl"> Right To Left (rtl)</label>
					</div>
				</div>
			</div>
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
