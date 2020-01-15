<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel="Stylesheet"type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function () {
    $("#txtFrom").datepicker({ dateFormat: 'yy-mm-dd',
        numberOfMonths: 2,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() + 1);
            $("#txtTo").datepicker("option", "minDate", dt);
        }
    });
    $("#txtTo").datepicker({ dateFormat: 'yy-mm-dd',
        numberOfMonths: 2,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() - 1);
            $("#txtFrom").datepicker("option", "maxDate", dt);
        }
    });
  
    
  
});
</script>
<form action="" method="post">
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
<UL>
<LI> <A HREF="UploadDownload?action=<%="upload"%>">
Uploaded11</A>
<LI> <A HREF="UploadDownloads?action= <%= "download" %> ">
Downloaded11</A>
</UL>
</form>
</body>
</html>