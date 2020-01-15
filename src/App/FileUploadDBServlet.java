package App;



import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.ResultSet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.imgscalr.Scalr;

import java.awt.Color;
import java.awt.Font;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import net.coobird.thumbnailator.filters.Caption;
import net.coobird.thumbnailator.geometry.Position;
import net.coobird.thumbnailator.geometry.Positions;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 1024*1024*50)	// upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
	
	// database connection settings
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		String user = request.getParameter("username");
		
		Float price1=0f,price2=0f,price3=0f,price4=0f,price5=0f;
		try{
	    price1 = Float.valueOf(request.getParameter("price"));}
		catch(Exception e){}
		try{
	    price2 = Float.valueOf(request.getParameter("price1"));}
		catch(Exception e){}
		try{
        price3 = Float.valueOf(request.getParameter("price2"));}
		catch(Exception e){}
		try{
        price4 = Float.valueOf(request.getParameter("price3"));}
		catch(Exception e){}
		try{
        price5 = Float.valueOf(request.getParameter("price4"));}
		catch(Exception e){}
       Float price[]={price1,price2,price3,price4,price5};
       
       
       int time1=0,time2=0,time3=0,time4=0,time5=0;
       try{
       time1 = Integer.valueOf(request.getParameter("time"));}
       catch(Exception e){}
       try{
      time2 = Integer.valueOf(request.getParameter("time1"));}
       catch(Exception e){}
       try{
        time3 = Integer.valueOf(request.getParameter("time2"));}
       catch(Exception e){}
       try{
       time4 = Integer.valueOf(request.getParameter("time3"));}
       catch(Exception e){}
       try{
        time5 = Integer.valueOf(request.getParameter("time4"));}
       catch(Exception e){}
      
      int time[]={time1,time2,time3,time4,time5};
		//-----------------------------
		DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
		Date date = new Date();
		
	//	String time1=dateFormat.format(date.getTime());
		
//		Date fromdate = dateFormat.parse(date);
		System.out.println(dateFormat.format(date));
		
		// obtains the upload file part in this multipart request
		Part filePart1 = request.getPart("photo");
		
		// edited start---------------------------
		Part filePart2 = request.getPart("photo1");
		Part filePart3 = request.getPart("photo2");
		Part filePart4 = request.getPart("photo3");
		Part filePart5 = request.getPart("photo4");
		
		
		Part filePart[]={filePart1,filePart2,filePart3,filePart4,filePart5};
		
		Connection conn = null;	// connection to the database
		String message = null;	// message will be sent back to client
		

		
		
		
		//end-----------------------------
		
		
		int i=0;
		while(i<5)
{  
			try {
				
				String s=db.meth(  filePart[i], user , price[i], time[i]);
				message="File Uploaded Successfuly";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i++;
		
}
		
		// sets the message in request scope
					request.setAttribute("Message", message);
					request.setAttribute("mes", user);
					
					// forwards to the message page
					getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);

	}
}