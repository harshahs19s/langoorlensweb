package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UploadDownload")
public class UploadDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

 		java.sql.Date d = java.sql.Date.valueOf(request.getParameter("from"));
 		java.sql.Date d1 = java.sql.Date.valueOf(request.getParameter("to"));
 		String photos="";
 		String price="";
 		String status="";
 		PrintWriter out = response.getWriter();
   String action=(String)request.getParameter("action");
 	if(action.equals("download")){

 		try{
 			/////
 			status="download";
 	         Connection con=GetCon.getCon();
 	        PreparedStatement stmt=con.prepareStatement("select count(*) ,sum(amount_credited)  from download_history  where date between ? and ? ");
 	        stmt.setDate(1, d);
 	        stmt.setDate(2, d1);
 	        ResultSet rs=stmt.executeQuery();
 	        if(rs.next()){
 	        	int p=rs.getInt(1);
 	        	//photos+="Downloaded Photos: ";
 	        	photos+=p;
 	        	int p1=rs.getInt(2);
 	        	price+=p1;
 	        }
 	      
 	      
 		}catch(Exception e){
 			e.printStackTrace();
 		}
 		
 	}
 	else{
		

 		try{
 			/////
 			 status="upload";
 			 Connection con=GetCon.getCon();
 	        PreparedStatement stmt=con.prepareStatement("select count(*) ,sum(price)  from upload_history  where date between ? and ? ");
 	        stmt.setDate(1, d);
 	        stmt.setDate(2, d1);
 	        ResultSet rs=stmt.executeQuery();
 	        if(rs.next()){
 	        	int p=rs.getInt(1);
 	        	//photos+="Uploaded Photos: ";
 	        	
 	        	photos+=p;
 	        	//String tag="Uploaded";
 	        	int p1=rs.getInt(2);
 	        	price+=p1;   }
 	      
 	      
 		}catch(Exception e){
 			e.printStackTrace();
 		}	
		}
 	request.setAttribute("photos", photos);
   request.setAttribute("price", price);
   request.setAttribute("status", status);
  // out.write("<html><body>Total Sum  </br><br> "+price+"</br> <br>Total  </br> <br> "+photos+"</br></font></body></html>");
	RequestDispatcher rd=request.getRequestDispatcher("SearchByDate1.jsp");  
	rd.include(request,response); 

 	}
}
