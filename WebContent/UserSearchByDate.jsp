<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">


header{
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

</style>
<title>LANGOOR LENS</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
    $(function () {
        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd',
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() + 1);
                $("#datepicker1").datepicker("option", "minDate", dt);
            }
        });
        $("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd',
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() - 1);
                $("#datepicker").datepicker("option", "maxDate", dt);
            }
        });
      
        
      
    });
    </script>
</head>
<body>
<div class="navbar">
			<div  class="navbar-inner">
				<div  class="container-fluid">
					<a class="brand">
					
							<header>
							LANGOOR LENS
							</header>
							</a>
							
							</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>
		<body>
<div >
 <form name="acvb" action="UserSearchByDate" method="post" onsubmit="function()"> 
 From Date  <input type="text" class="form-control" name="from" id="datepicker" placeholder="FROM" required=""/>
  To Date  <input type="text" class="form-control" name="to" id="datepicker1" placeholder="TO " required=""/>
  <select name="action">
  <option value="Debit">Debited</option>
  <option value="Credit">Credited</option>
  </select>
   
   <input type="submit" value="Search"></input>
   
</form> 
</div>

</body>
</html>