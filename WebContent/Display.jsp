<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Display from Database Demo</title>
</head>
<body>
	<center>
		<h1>File Display from Database Demo</h1>
		<form method="post" action="DisplayServlet">
			<table border="0">
				<tr>
					<td>Image ID: </td>
					<td><input type="text" name="id" size="50" value=""/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Save">
					</td>
					<tr>
					<td><img src="/DisplayServlet?imageno=1">
					</td>
					</tr>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>