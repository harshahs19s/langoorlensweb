package App;

import java.io.InputStream;
import java.sql.*;
import App.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(String username,String password,String email, String college,String phone,String dob,String desg,String cource,String year,String yearto,InputStream inputStream,String name){
	//public static int register(String email,String password,String gender,String country,String name){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into user(username,email,DOB,watsapp_num,college_name,password,course,desig,yearfrom,yearto,photo,name) values(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,email);
		ps.setString(3,dob);
		ps.setString(4,phone);
		ps.setString(5,college);
		ps.setString(6,password);
		ps.setString(7, cource);
		ps.setString(8, desg);
		ps.setString(9, year);
		ps.setString(10, yearto);
		ps.setBlob(11, inputStream);
		ps.setString(12, name);
		status=ps.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
  }
}

