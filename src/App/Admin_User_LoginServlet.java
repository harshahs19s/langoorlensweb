package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;  
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class Admin_User_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		   response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		          
		    String u=request.getParameter("username");  
		    String p=request.getParameter("password"); 
		    
		    if(u.equals("admin") && p.equals("nutri"))
		    {
		    	/////////--------edited start------------------------
		    			 
		    			    	 
		    			    	 
		    			    	 //------------end---------2-19-2018-------------

		    	HttpSession session=request.getSession();
	    		session.setAttribute("USER",u); 
		    	RequestDispatcher rd=request.getRequestDispatcher("userlist.jsp");
		    	rd.forward(request,response); 
		    }
		    
		    if(ValidateUser_DAO.validateUser(u)){
		    
		    	if(ValidateUser_DAO.validate(u, p)){  
		    		
		    		Connection con=GetCon.getCon();
		    		int i=0;
		    		PreparedStatement ps;
		    		try {
		    			
		    			ps = con.prepareStatement("update user set lostlogin = CURRENT_TIMESTAMP WHERE username = ?");
		    			ps.setString(1, u);
		    			i = ps.executeUpdate();
		                ps.close();	
		    			
		    			
		    	
		    			}catch(Exception e){System.out.println(e);}  
		    		
		    		
		    		HttpSession session=request.getSession();
		    		session.setAttribute("USER",u); 
		    		session.setMaxInactiveInterval(1000*60*60);
		    		RequestDispatcher rd=request.getRequestDispatcher("UserHomeServlet");  
		    		rd.forward(request,response);  
		    	}  
		    	else{  
	//	    		out.write("<html><body><font color = red>Sorry username or password error </font></body></html>");		    		
	//	    		request.setAttribute("loginresponse", "Sorry username or password error" );
		    		
		    		//edited start--------------------
		    		
		    		out.write("<html><body><font color = blue> forgot password...?? </font></body></html>");
				    
		    		//end---------------------------
		    		RequestDispatcher rd=request.getRequestDispatcher("login.html");  
		    		rd.include(request,response);  
		    	}  
		    }
		    else
		    {
		    	out.write("<html><body><font color = red>Username not exists!, Register </font></body></html>");
		    	RequestDispatcher rd=request.getRequestDispatcher("login.html");  
	    		rd.include(request,response); 
		    }
		    out.close();
		    
		    
	}

}
