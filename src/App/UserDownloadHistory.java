package App;


import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.transaction.xa.*;

/**
 * Servlet implementation class downloadFileServlet
 */
@WebServlet("/UserDownloadHistory")
public class UserDownloadHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	
	
	// size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096*3;   
     
    // database connection settings
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // get upload id from URL's parameters
        String uploadId = request.getParameter("param");
        System.out.println(uploadId);
       
       // PrintWriter out = response.getWriter(); 
       
        Connection conn = null; // connection to the database
        //HttpSession session=request.getSession(false);
	    
	  //  if(session!=null)
	    //{
	    //	out.print("Please login first");  
          //  request.getRequestDispatcher("login.html").include(request, response);
	   // }	    
	    //else
	    //{
        
		        try {
			            // connects to the database
		        	conn=GetCon.getCon();
		        		            System.out.println("photo id is"+uploadId);
						            // queries the database
						            String sql = "select photo_id,Actual_photo from photos where photo_id = ?";
						            PreparedStatement statement = conn.prepareStatement(sql);
						            statement.setString(1, uploadId);
						 
						            ResultSet result = statement.executeQuery();
						           
						            if (result.next()) {
					            	// gets file name and file blob data
							            	String fileName = result.getString("photo_id");
							            	Blob blob = result.getBlob("Actual_photo");
							            	InputStream inputStream = blob.getBinaryStream();
							            	int fileLength = inputStream.available();
						                 
							            	System.out.println("fileLength = " + fileLength);
						 
							            	ServletContext context = getServletContext();
						    	
							            	response.setContentType("image/jpg");
							            	response.setContentLength(fileLength);
							            	String headerKey = "Content-Disposition";
							            	String headerValue = String.format("attachment; filename=\"%s\"", fileName+".jpg");
							            	response.setHeader(headerKey, headerValue);
			
							            	OutputStream outStream = response.getOutputStream();
						                 
							            	byte[] buffer = new byte[BUFFER_SIZE];
							            	int bytesRead = -1;
				                 
							            	while ((bytesRead = inputStream.read(buffer)) != -1) {
							            		outStream.write(buffer, 0, bytesRead);
							            	}
				                 
							                inputStream.close();
							                outStream.close(); 
							            	            	
							            	
						            } else {
					                // no file found
						            	
						            	//request.setAttribute("status", "Already downloaded");
						        		RequestDispatcher rd=request.getRequestDispatcher("gallery.jsp");
						        		rd.forward(request, response);
						            	
						            	response.getWriter().print("File not found for the id: " + uploadId);  
						            }
	     	
			            	
			          
				            	
				            	
		        	} 
		        	catch (SQLException ex) {
		        		ex.printStackTrace();
		        		response.getWriter().print("SQL Error: " + ex.getMessage());
		        	} 
		        	catch (IOException ex) {
		        		ex.printStackTrace();
		        		response.getWriter().print("IO Error: " + ex.getMessage());
		        	} 
		        	finally {
		        		if (conn != null) {
		                // closes the database connection
		        			try {
		        				conn.close();
		        			} 
		        			catch (SQLException ex) {
		        				ex.printStackTrace();
		        			}
		        		}          
		 
       
		        	} }//}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}