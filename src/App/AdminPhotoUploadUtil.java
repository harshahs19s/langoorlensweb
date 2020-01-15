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

public class AdminPhotoUploadUtil {
	static String message = null;
	
	public static  String meth3(String phone, String name ,String user){
		
		Connection conn=null;
		try {System.out.println("inside adminphotoupload");
		// connects to the database
		
		 conn=GetCon.getCon();	
			// execute SQL statement
		 PreparedStatement statement = conn.prepareStatement(" update user  set watsapp_num = ? ,name = ?  where username = ?" );
		 statement.setString(1,phone );
			statement.setString(2,name);	
			statement.setString(3, user);		
		// sends the statement to the database server
		int row = statement.executeUpdate();
		if (row > 0) {
			message = "Your profle photo is updated";
		}

	} catch (SQLException ex) {
		message = "ERROR: " + ex.getMessage();
		ex.printStackTrace();
	} finally {
		if (conn != null) {
			// closing costly resources
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			
		
		}
		}
		return message;	
	}
	
	
	
	public static String meth1( Part filePart, String user) throws Exception{
if(filePart!= null){
	Connection conn = null;	// connection to the database
	
			InputStream inputStream = null;
			InputStream inputStream1 = null;// input stream of the upload file
			InputStream cropped_inputstream=null;
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			BufferedImage image= ImageIO.read(inputStream);
			BufferedImage thumbnail = Scalr.resize(image, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH,150, 100, Scalr.OP_ANTIALIAS);
	//Watermark logic
			String caption = "Profile pic";
			Font font = new Font("Monospaced", Font.PLAIN, 02);
			Color c = Color.black;
			Position position = Positions.CENTER;
			int insetPixels = 0;
			Caption filter = new Caption(caption, font, c, position, insetPixels);
			BufferedImage captionedImage = filter.apply(thumbnail);
	//Watermark logic ends here
			ByteArrayOutputStream os = new ByteArrayOutputStream();
	        ImageIO.write(captionedImage, "jpg", os);
	        cropped_inputstream = new ByteArrayInputStream(os.toByteArray());
				
				try {System.out.println("inside adminphotoupload");
			// connects to the database
			 conn=GetCon.getCon();	
				// constructs SQL statement
			 PreparedStatement statement = conn.prepareStatement(" update user  set photo = ?   where username = ?" );
			 statement.setBlob(1,cropped_inputstream );
				statement.setString(2, user);			
			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Your profle photo is updated";
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
				
			}
			
			else
			{
				System.out.println("u r trying to add empty file");
			}
			

	return message;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	public static String meth( Part filePart, String user ,float price, int time) throws Exception{
if(filePart!= null){
	Connection conn = null;	// connection to the database
	
			InputStream inputStream = null;
			InputStream inputStream1 = null;// input stream of the upload file
			InputStream cropped_inputstream=null;
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			inputStream1 = filePart.getInputStream();
		
		BufferedImage image= ImageIO.read(inputStream);
		BufferedImage thumbnail = Scalr.resize(image, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH,150, 100, Scalr.OP_ANTIALIAS);
//Watermark logic
		String caption = "LANGOORLENS";
		Font font = new Font("Monospaced", Font.PLAIN, 14);
		Color c = Color.black;
		Position position = Positions.CENTER;
		int insetPixels = 0;
		Caption filter = new Caption(caption, font, c, position, insetPixels);
				
		BufferedImage captionedImage = filter.apply(thumbnail);
//Watermark logic ends here
		
		ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(captionedImage, "jpg", os);
        cropped_inputstream = new ByteArrayInputStream(os.toByteArray());
		
				try {
			// connects to the database
			 conn=GetCon.getCon();	
			 PreparedStatement s1 = conn.prepareStatement("SELECT user_id FROM user where username=?");
			s1.setString(1, user);
			ResultSet rs=s1.executeQuery();
			int uid=0;
			if(rs.next())
			{
				uid=rs.getInt(1);
			}else
			{
				System.out.println("UID not found"+uid);
			}
				// constructs SQL statement
				String sql = "INSERT INTO photos (user_id,Actual_Photo,Cropped_Photo,price,valid_from,valid_to) values (?, ?, ?, ?, NOW(), NOW()+INTERVAL ? DAY)";
				PreparedStatement statement = conn.prepareStatement(sql);
				statement.setInt(1, uid);
				statement.setFloat(4, price);
				//statement.setDate(5, fromdate);
				statement.setInt(5, time);
				if (captionedImage !=null)
				{
					statement.setBlob(3, cropped_inputstream);
				}
				if (inputStream != null) {
					// fetches input stream of the upload file for the blob column
					statement.setBlob(2, inputStream1);
					System.out.println("Inputstream"+inputStream);
				}
				
			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Files uploaded and saved into database";
			}
//----------------		///////// new edited start------------------------------------------------------
		//	 PreparedStatement s12 = conn.prepareStatement("SELECT  photo_id FROM photos where user_id= ? and price = ? ");
			//	s12.setInt(1, uid);
		//		s12.setFloat(2, price);
			 PreparedStatement s12 = conn.prepareStatement("select max(photo_id) from photos");
				ResultSet rs1=s12.executeQuery();
				int pid1=0;
				if(rs1.next())
				{
					pid1=rs1.getInt(1);
				}
			 String sql1= "INSERT INTO upload_history ( idupload_history,user_id,date,time,status,price) values(?,?,NOW(),NOW(),?,?)";
                 PreparedStatement statement1 = conn.prepareStatement(sql1);
                statement1.setInt(1, pid1);
                statement1.setInt(2, uid);
                 String ser="uploaded";
                statement1.setString(3, ser);
                //edited1
                statement1.setFloat(4, price);
                statement1.executeUpdate();
                
//------------------	///////end--------------------------------------------------------------

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
				
			}
			
			else
			{
				System.out.println("u r trying to add empty file");
			}
			

	return message;
	}
}
