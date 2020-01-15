package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.jdbc.Connection;
import App.GetCon;
/**
 * Servlet implementation class UserPWD
 */
@WebServlet("/UserPasswordAdmin")
public class UserPWD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPWD() {
        super();
        // TODO Auto-generated constructor stub
    } 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();
		    Connection con = GetCon.getCon();
			PreparedStatement ps = null;
			ResultSet rs = null;
		//String adminName=request.getParameter("username");
		String adminPassword=request.getParameter("pwd");
		String userID=request.getParameter("userID");
		if((adminPassword.equals("admin123")))
		{
	
		
			//out.write("<html><body><font color = blue> Password For ID" +userID +" is</font></body></html>");
			 //System.out.println("username: " + adminName);
		       // System.out.println("password: " + adminPassword);
		 
		        // do some processing here...
		         
		        // get response writer
		        PrintWriter writer = response.getWriter();
		        try
		        {
		        	
		        	ps=con.prepareStatement("SELECT password FROM user WHERE user_id = ?");
		        	ps.setString(1, userID);
					 rs = ps.executeQuery();
					rs.next();
					
						String Var6 = rs.getString(1);
						// System.out.println(rs);
						 String htmlRespone = "<html>";
					        htmlRespone += "<h2> Password is:<br/>"+Var6+"</h2>";      
					       // htmlRespone += "Your password is: " + adminPassword + "</h2>";    
					        htmlRespone += "</html>";
					         
					        // return response
					        writer.println(htmlRespone);
					
		        }
		        catch(Exception e)
		        {
		        	e.printStackTrace();
		        }
		         
		        // build HTML code
		       
		}
		else
		{
			request.getRequestDispatcher("TempEditable.jsp").include(request, response);
		}
		
		
		//doGet(request, response);
	}

}
