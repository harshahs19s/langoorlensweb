package App;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
		   // PrintWriter out = response.getWriter();
		
		   // String u=request.getParameter("username");
		
		    Connection con=GetCon.getCon();
	    	PreparedStatement ps;
	    	ResultSet rs = null;
	    	PreparedStatement ps1;
	    	ResultSet rs1=null;
	    	//int uid=0;
	    		try {
					ps = con.prepareStatement("SELECT user_id,date,time,amount_debited,type FROM payment_history");
					//ps.setString(1,u);
					rs = ps.executeQuery();
					
					
					while(rs.next())
		    		{
						System.out.println(rs.getString(1));
						String Var = rs.getString(1);
						// String Var1=rs.getString(2);
						Date Var2 = rs.getDate(2);
						Time Var3 = rs.getTime(3);
						float f = rs.getFloat(4);
						Float Var4=new Float(f);
						String Var5 = rs.getString(5);

						 ps1 = con.prepareStatement("SELECT username FROM user WHERE user_id=?");
						ps1.setString(1, Var);
						 rs1 = ps1.executeQuery();
						if (rs1.next()) {
							String Var6 = rs1.getString(1);
							request.setAttribute("User name", Var6);
							request.setAttribute("User ID", Var);
							request.setAttribute("Date", Var2);
							request.setAttribute("Time", Var3);
							request.setAttribute("Amount", Var4);
							request.setAttribute("Type of pyament", Var5);
							RequestDispatcher rd=request.getRequestDispatcher("/history.jsp");
							rd.forward(request, response);
		    		}
		    		}
	    		}
						catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
