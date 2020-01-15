package App;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteaccount
 */
@WebServlet("/deleteaccount")
public class AdminUserAccountDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserAccountDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		int i=0;
    	try { con.setAutoCommit(false);
    	
    		//----------
    		PreparedStatement	ps1 = con.prepareStatement("DELETE FROM download_history WHERE user_id=?");
    		ps1.setInt(1,id);
    	 ps1.executeUpdate();
    		
    	 PreparedStatement	ps2 = con.prepareStatement("DELETE FROM payment_history WHERE user_id=?");
 		ps2.setInt(1,id);
 	 ps2.executeUpdate();
 	
	 PreparedStatement	ps3 = con.prepareStatement("DELETE FROM paytmtransaction WHERE user_id=?");
		ps3.setInt(1,id);
	 ps3.executeUpdate();
    		
	 PreparedStatement	ps4 = con.prepareStatement("DELETE FROM photos WHERE user_id=?");
		ps4.setInt(1,id);
	 ps4.executeUpdate();
 		
	 PreparedStatement	ps5 = con.prepareStatement("DELETE FROM student WHERE us_id=?");
		ps5.setInt(1,id);
	 ps5.executeUpdate();
	 PreparedStatement	ps6 = con.prepareStatement("DELETE FROM upload_history WHERE user_id=?");
		ps6.setInt(1,id);
  ps6.executeUpdate();
  
	ps = con.prepareStatement("DELETE FROM user WHERE user_id=?");
	ps.setInt(1,id);
	i=ps.executeUpdate();
	
    		//------------------------
    		con.commit();
    	}
    	catch(Exception e){System.out.println(e);}  
		
    	System.out.println(i);
    	if(i>0)
    	{
    		System.out.println("exicuted");
    		request.setAttribute("status", "Successfully deleted the Account");
    		RequestDispatcher rd=request.getRequestDispatcher("userlist.jsp");
    		rd.forward(request, response);
    		
    		
    	}
    	else
    	{
    		request.setAttribute("status", "failure! check after some time ");
    		RequestDispatcher rd=request.getRequestDispatcher("userlist.jsp");
    		rd.forward(request, response);
    		
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
