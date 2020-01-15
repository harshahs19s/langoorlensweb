package App;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class downloadFileServlet
 */
@WebServlet("/downloadFileServlet")
public class DownloadImage_Gallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;   
     
    // database connection settings
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // get upload id from URL's parameters
        String uploadId = request.getParameter("DN");
       
        System.out.println(uploadId);
       
       
       
        Connection conn = null; // connection to the database
        HttpSession session=request.getSession(false);
	    
	   if(session==null)
	   {
	    	
            request.getRequestDispatcher("login.html").include(request, response);
	    }	    
	    else
	    {
        conn=GetCon.getCon();
      float valid=0f;  
      float walletamt=0f;
      float priceamt=0f;
      int udd=0;
    //---------------------------------
	    
      String sqlac = "select user_id from upload_history where idupload_history = ?";
      try{
    	  
      PreparedStatement statementac = conn.prepareStatement(sqlac);
      statementac.setString(1, uploadId);
    ResultSet rsac=  statementac.executeQuery();
    if(rsac.next()){
    udd=rsac.getInt(1);	  
      }}
      catch(Exception e){
    	  
      }
      
        try{
        	
            PreparedStatement ps1=conn.prepareStatement("select wallet from user where user_id="+udd);
            PreparedStatement ps2=conn.prepareStatement("Select price from photos where photo_id="+uploadId);
            ResultSet rs1=ps1.executeQuery();
            if(rs1.next()){
            	walletamt=rs1.getFloat(1);
            }
            ResultSet rs2=ps2.executeQuery();
            if(rs2.next()){
            	priceamt=rs2.getFloat(1);
            }
            
            valid=walletamt-priceamt;
        }
        catch(Exception e){
        	 request.setAttribute("status", "sorry try again..");
     		RequestDispatcher rd=request.getRequestDispatcher("gallery.jsp");
     		rd.forward(request, response);
     		
        }
        if(valid>=0){
		        try {
			            // connects to the database
		        	
		        		            System.out.println("photo id is"+uploadId);
						            // queries the database
						            String sql = "select photo_id,Actual_photo from photos where photo_id = ?";
						            PreparedStatement statement = conn.prepareStatement(sql);
						            statement.setString(1, uploadId);
						 
						            ResultSet result = statement.executeQuery();
						           boolean b=result.next();
						            if (b) {
					            	// gets file name and file blob data
						            	
						            	   conn.setAutoCommit(false);
						            	   //--------------------------------------------
						            
    						            	PreparedStatement stmt=conn.prepareStatement("UPDATE upload_history SET status='downloaded' WHERE idupload_history = ?"); 
    								            stmt.setString(1, uploadId);
    								            stmt.execute();
    						    	            
    								            //-----------------------------------------------
    								           
    								       	 String sql1= "INSERT INTO download_history ( user_id,date,time,amount_credited,iddownload_history) values(?,NOW(),NOW(),?,?)";
    						                 PreparedStatement statement1 = conn.prepareStatement(sql1);
    						                statement1.setInt(1, udd);
    						                statement1.setFloat(2,priceamt);
    						                statement1.setString(3, uploadId);
    						               statement1.executeUpdate();
    								          
						            	   //-----------------------------------------
						            	   //----------------------------------------
						            	   String sqll = "UPDATE user SET wallet="+valid+"WHERE user_id="+udd;
								            PreparedStatement statement4 = conn.prepareStatement(sqll);
								           
								            statement4.execute();
						            	    //----------------------------------------------
								            conn.commit();
							            	
								     
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
							            	
							            	 System.out.println("  succcess   ");
									            
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
		        		try {
							conn.rollback();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
		        		ex.printStackTrace();
		        		  response.getWriter().print("image is already downloaded check in Downloads ..");
				           
		        	} 
		        	catch (IOException ex) {
		        		try {
							conn.rollback();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
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
		 
       
		        	} }  
  else
  {
	  request.setAttribute("status", "You have insufficient wallet amount! Kinldy add amount to Download..");
		RequestDispatcher rd=request.getRequestDispatcher("gallery.jsp");
		rd.forward(request, response);
		
}}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
