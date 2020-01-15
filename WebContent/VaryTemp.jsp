<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Wallet Transaction</title>

<meta name="description" content="Static &amp; Dynamic Tables" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--basic styles-->

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />


<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

<!--ace styles-->

<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="App.GetCon"%>


	<%
	 String user_id=(String)request.getParameter("userid");
	%>


	<div class="main-container container-fluid">
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
			class="menu-text"></span>
		</a>

		<div class="main-content">
		

			<div class="page-content">
		

				<div class="row-fluid">
					<div class="span12">
						<!--PAGE CONTENT BEGINS-->


						<div class="row-fluid">
							<div class="span6" style="width: 100%">
								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
						

					
										<li><a data-toggle="tab" href="#profile1"> Transaction Details
												 <span class="badge badge-important">4</span>
										</a></li>
						

						
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">






											<div class="row-fluid">
											
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
															Connection con = GetCon.getCon();
															PreparedStatement ps = null;
															ResultSet rs = null;
															//PreparedStatement ps2=null;
															//ResultSet rs2=null;
															//PreparedStatement ps3=null;
															//ResultSet rs3=null;
															 try{ 
	   Statement stmt=con.createStatement();
	    String strQuery = "select * from payment_history where user_id = "+user_id ;
	    ResultSet rs1 = stmt.executeQuery(strQuery);
	
	   while(rs1.next()){
							%>							

														<tr>
															<td class="center"><label> <input
																	type="checkbox" /> <span class="lbl"></span>
															</label></td>

															<td><%=rs1.getDate(3) %></td>
															
															<td><%= rs1.getTime(4) %></td>
															<td>Amount Credited:<%=rs1.getFloat(5)%></td>
												
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
    rs1.close();
    con.close();
    stmt.close();
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
		<!--/.main-content-->
	</div>
	<!--/.main-container-->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

	


	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>

	<script type="text/javascript">
		
	</script>

	
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
