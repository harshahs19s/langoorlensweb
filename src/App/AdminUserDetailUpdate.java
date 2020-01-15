package App;

import java.awt.Color;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.http.Part;

import org.imgscalr.Scalr;

import net.coobird.thumbnailator.filters.Caption;
import net.coobird.thumbnailator.geometry.Position;
import net.coobird.thumbnailator.geometry.Positions;

public class AdminUserDetailUpdate {
	static String message = null;
	public static String methuser(  String  username ,String wallet, String college,String phone,String dob,String desg,String cource,String year,String yearto,String name) throws Exception{
		Connection conn=null;
		try {
			// connects to the database
			 conn=GetCon.getCon();	
		
				PreparedStatement statement = conn.prepareStatement("update user SET  DOB = ? , watsapp_num = ? , college_name = ? , wallet = ? , course = ? , desig = ? , yearfrom = ? , yearto = ? , name = ?  where username = ?"); 
					statement.setString(1, dob);
					statement.setString(2, phone);
					statement.setString(3, college);
					statement.setString(4, wallet);
					statement.setString(5, cource);
					statement.setString(6, desg);
					statement.setString(7, year);
					statement.setString(8, yearto);
					statement.setString(9, name);
					statement.setString(10, username);
				// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "user details updated";
			
	}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
					}
				
					

	return message;
	}
}
