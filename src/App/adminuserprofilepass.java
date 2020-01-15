package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminuserprofilepass
 */
@WebServlet("/adminuserprofilepass")
public class adminuserprofilepass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request, response);
	    }
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
		    throws ServletException, IOException {  
		  
		    response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		    
	//	    		String user=request.getParameter("username");  
		    		String user = request.getParameter("USER");
		    		System.out.println("Welcome"+user);
		    		Connection con=GetCon.getCon();
		    		PreparedStatement ps;
		    		try {
		    			ps = con.prepareStatement("SELECT email,DOB,watsapp_num,college_name,wallet,user_id,password,desig,course,yearfrom,yearto,name FROM user WHERE username=?");
		    			ps.setString(1,user);
		    			ResultSet rs=ps.executeQuery();	
		    			while (rs.next())
		    			{
		    			request.setAttribute("user", user);
		    			request.setAttribute("email", rs.getString(1));
		    			request.setAttribute("dob", rs.getString(2) );
		    			request.setAttribute("watsapp", rs.getString(3) );
		    			request.setAttribute("college", rs.getString(4) );
		    			request.setAttribute("wallet", rs.getString(5) );
		    			request.setAttribute("userid", rs.getInt(6));
		    			request.setAttribute("password", rs.getString(7) );
		    			request.setAttribute("desig", rs.getString(8) );
		    			request.setAttribute("course", rs.getString(9) );
		    			request.setAttribute("yearfrom", rs.getString(10) );
		    			request.setAttribute("yearto", rs.getString(11) );
		    			request.setAttribute("name", rs.getString(12) );
		    			
		    			}
		    			RequestDispatcher rd=request.getRequestDispatcher("adminuserprofile.jsp");
		    			rd.forward(request, response);
//						out.print("Welcome "+user);
				
		    			}catch(Exception e){System.out.println(e);}  
		          
		    		out.close();  
		     

	}

}
