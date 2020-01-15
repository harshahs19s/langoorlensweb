<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Transaction History</title>

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
		
		 String user_id=(String)request.getParameter("userid");
		
		 double amount_credited=0;
		 double amount_debited=0;
		 int total_transactions_debited=0;
		 int total_transactions_credited=0;
		 Connection con=GetCon.getCon();
		 PreparedStatement pst= con.prepareStatement("SELECT SUM(amount_credited), count(*) FROM download_history where user_id= "+user_id);
		 ResultSet rst=pst.executeQuery();
	
		 if(rst.next())
		 {
			 amount_debited=rst.getInt(1);
			 total_transactions_debited=rst.getInt(2);
		 }
		 PreparedStatement ps_uploadHistory= con.prepareStatement("select SUM(amount_debited),count(*) from payment_history where user_id = "+user_id);
		 ResultSet rs_uploadHistory=ps_uploadHistory.executeQuery();
	
		 if(rs_uploadHistory.next())
		 {
			 amount_credited=rs_uploadHistory.getFloat(1);
			 total_transactions_credited=rs_uploadHistory.getInt(2);
		 }
	%>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a href="#" class="brand"> <small> <i class="icon-leaf"></i>
						<%=suser %>
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
					<li class="active">Wallet History</li>
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
						Transaction <small> <i class="icon-double-angle-right"></i>
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

												Credited </a></li>

										<li><a data-toggle="tab" href="#profile"> Debited
												 <span class="badge badge-important"></span>
										</a></li>
										<li><a data-toggle="tab" href="#profile1"> All Transactions
												 <span class="badge badge-important"></span>
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
												<h3 class="header smaller lighter blue">Credited::Total Amount Credited  <span class="green"><%=amount_credited %> </span>  All Credits <span class="green"> <%=total_transactions_credited %></span></h3>
												<div class="table-header">Results
													</div>

												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>Date</th>
															<th>Time</th>
															<th>Amount</th>

											
														</tr>
													</thead>

													<tbody>
														<%
															 con = GetCon.getCon();
															PreparedStatement ps = null;
															//ResultSet rs = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															 try{ 

	   ps=con.prepareStatement("select date,time,amount_debited from payment_history where user_id = "+user_id);
	    
	    ResultSet rs1 = ps.executeQuery();
	
	   while(rs1.next()){
							%>							

														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=rs1.getDate(1) %></td>
															
															<td><%= rs1.getTime(2) %></td>
															<td><%=rs1.getFloat(3)%></td>
												
														</tr>
															<%
																}
															%>

															

														<%
															

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
												 <h3 class="header smaller lighter blue">Debited::Total Amount Debited  <span class="green"><%=amount_debited %> </span>  All Debits <span class="green"> <%=total_transactions_debited %></span>
											
													</h3>
													
												<div class="table-header">Results 
													</div>

												<table id="sample-table-3"
													class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></th>
															<th>Date</th>
															<th>Time</th>
															<th>Amount</th>

														</tr>
													</thead>

													<tbody>
													<%
											
															PreparedStatement ps44 = null;
															ResultSet rs44 = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															try {
																ps44 = con.prepareStatement("select date,time,amount_credited from download_history where user_id = "+user_id);
																rs44 = ps44.executeQuery();

																while (rs44.next()) {

																	%>
																	
																	<tr>
																																<td class="center"><label> <input
																																		type="checkbox" /> <span class="lbl"></span>
																																</label></td>

																																<td><%=rs44.getDate(1)%></td>
																																
																																<td><%=rs44.getTime(2)%></td>
																																<td><%=rs44.getFloat(3)%></td>
																													
																															</tr>
															<%
																	}
															
															

	
															}

															catch (SQLException e) {
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
												<h3 class="header smaller lighter blue">All Transactions
								
												
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
															<th>Amount</th>

								
														</tr>
													</thead>

														<tbody>
														<%
															Connection conr = GetCon.getCon();
															PreparedStatement psr = null;
															ResultSet rsr = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															 try{ 
	   Statement stmt11=conr.createStatement();
	    String strQueryr = "select * from payment_history where user_id = "+user_id ;
	    rsr = stmt11.executeQuery(strQueryr);
	
	   while(rsr.next()){
							%>							

														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=rsr.getDate(3) %></td>
															
															<td><%= rsr.getTime(4) %></td>
															<td>Amount Credited:<%=rsr.getFloat(5)%></td>
												
														</tr>

	<% }

	   Statement stmt1=con.createStatement();
	   String strQuery1 = "select * from download_history where user_id = "+user_id ;
	   ResultSet rs2 = stmt1.executeQuery(strQuery1);

	   while(rs2.next()){



%>
													
<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=rs2.getDate(3)%></td>
															
															<td><%=rs2.getTime(4)%></td>
															<td>Amount Debited:<%=rs2.getFloat(5)%></td>
												
														</tr>
														
														<%
	   }
    rs2.close();
    rsr.close();
    conr.close();
   
	   }
  catch(Exception e)
  {
    e.getMessage();
  }
  %>

													</tbody>
								</table>
							</div>
                                     











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
				}, null, null, null,null,null,{
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
				}, null, null, null,null,null, {
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
				}, null, null, null,null,null, {
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
<% con.close(); %>
</body>
</html>
