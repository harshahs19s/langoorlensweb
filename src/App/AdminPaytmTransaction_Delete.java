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
 * Servlet implementation class AdminPaytmTransaction_Delete
 */
@WebServlet("/deletetransaction")
public class AdminPaytmTransaction_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		int i=0;
    	try {
    		ps = con.prepareStatement("DELETE FROM paytmtransaction WHERE paytmtransaction_id = ? ");
    		ps.setInt(1,id);
    		
    		i=ps.executeUpdate();
    		
    	}
    	catch(Exception e){System.out.println(e);}  
		
    	System.out.println(i);
    	if(i>0)
    	{
    		System.out.println("exicuted");
    		request.setAttribute("status", "Successfully deleted the transaction");
    		RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
    		rd.forward(request, response);
    		
    		
    	}
    	else
    	{
    		request.setAttribute("status", "failure! check after some time ");
    		RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
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
