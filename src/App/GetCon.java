package App;
import java.sql.*;
public class GetCon {
private GetCon(){}

private static Connection con= GetCon.getCon();

public static Connection getCon(){
	//if(con==null){
		try {
			Class.forName(DBIntializer.DRIVER);
			con=DriverManager.getConnection(DBIntializer.CON_STRING,DBIntializer.USERNAME,DBIntializer.PASSWORD);
			
	
		} catch (Exception e){
			e.printStackTrace();
		}
		return con;
	//}

	//return con;
}



}


