


<!DOCTYPE HTML>
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="App.GetCon"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
p {
  text-align: center;
  font-size: 60px;
  margin-top:0px;
}
</style>
</head>
<body>
<%
try{
String user="gururaj";
int id=1;
String idphoto="";
Connection con=GetCon.getCon();
PreparedStatement st=con.prepareStatement("select user_id from user where username = "+user);
//System.out.println

ResultSet rs=st.executeQuery();
if(rs.next())
{
	 id=rs.getInt(1);
	System.out.println(id);
}
PreparedStatement ps=con.prepareStatement("select idupload_history from upload_history where user_id="+id+"status=uploaded");
ResultSet rst=ps.executeQuery();
while(rst.next())
{
idphoto=rst.getString(1);	

PreparedStatement ps11=con.prepareStatement("select cropped_photo, valid_from,valid_to from photos where photo_id="+idphoto);
ResultSet rs11=ps11.executeQuery();
while(rs11.next()){
	
	Date dt=rs11.getDate(2);
	Date dt11=rs11.getDate(3);
	String se=dt.toString();
	String te=dt11.toString();
	System.out.println(se +"+"+te);
	
	
}


}
}
catch(Exception e)
{
	
}
%>
<p id="demo"></p>

<script>
// Set the date we're counting down to
var countDownDate = new Date("Sep 5, 2018 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);
</script>

</body>
</html>
