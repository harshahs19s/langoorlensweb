<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel="Stylesheet"type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Entries</title>
<style>
.dropbtn {
    background-color: #3498DB;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd}

.show {display:block;}
</style>
<script type="text/javascript">
$(function () {
    $("#txtFrom").datepicker({ dateFormat: 'yy-mm-dd',
        numberOfMonths: 2,
        onSelect: function (selected) {
            var dt = new Date(selected);
            var fromDate=data.getValue(dt);
            dt.setDate(dt.getDate() + 1);
            $("#txtTo").datepicker("option", "minDate", dt);
        }
    altField: '#fromDate'});
    $("#txtTo").datepicker({ dateFormat: 'yy-mm-dd',
        numberOfMonths: 2,
        onSelect: function (selected) {
            var dt = new Date(selected);
            var toDate=data.getValue(dt);
            dt.setDate(dt.getDate() - 1);
            $("#txtFrom").datepicker("option", "maxDate", dt);
        }
    altField: '#toDate'});
});
</script>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var selection=data.getValue(dropdowns);
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

</script>
<title>From To End</title>
</head>
<body>
<h2>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        From:
    </td>
    <td>
        <input type="text" id="txtFrom" />
    </td>
    <td>
        &nbsp;
    </td>
    <td>
        To:
    </td>
    <td>
        <input type="text" id="txtTo" />
    </td>
</tr>
</table>
</h2>
<div class="dropdown">
<button onclick="myFunction()" class="dropbtn">Dropdown</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="asasa?<%%>">Uploaded</a>
    <a href="#about">Downloaded</a>
    
  </div>
</div>

</body>
</html>