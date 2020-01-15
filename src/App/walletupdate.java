package App;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import javafx.scene.control.Alert;      it gives an error 
/**
 * Servlet implementation class walletupdate
 */
@WebServlet("/walletupdate")
public class walletupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public walletupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String tid = request.getParameter("tid");
		System.out.println(tid);
		
HttpSession session=request.getSession(false);
	    
	    if(session==null){
	    	
            request.getRequestDispatcher("login.html").include(request, response);
	    }
	    else{
	    
	    String user = (String)session.getAttribute("USER");
	    System.out.println(user);
		
		Connection con=GetCon.getCon();
		
		String uid="null";

		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement("SELECT user_id FROM user WHERE username=?");
			ps1.setString(1,user);
			ResultSet rs=ps1.executeQuery();	
			while (rs.next())
			{
			
			uid = rs.getString(1);
			System.out.println(uid);
			
			}
			
	
			}catch(Exception e){System.out.println(e);}  
		
		
		
		int i=0;
    	PreparedStatement ps;
    	try {
    		ps = con.prepareStatement("INSERT INTO `PhotoApp`.`paytmtransaction` (`user_id`, `transactionid`) VALUES (?,?);");
    		ps.setString(1,uid);
    		ps.setString(2,tid);
    		i=ps.executeUpdate();
    		
    	}
    	catch(Exception e){System.out.println(e);}  
		
    	System.out.println(i);
    	if(i>0)
    	{
    		
    		request.setAttribute("status", "success your wallet will update in 24hours");
    		RequestDispatcher rd=request.getRequestDispatcher("pricing1.jsp");
    		rd.forward(request, response);
    		
    		
    	}
    	else
    	{
    		request.setAttribute("status", "failure , resubmit the transactionid");
    		RequestDispatcher rd=request.getRequestDispatcher("pricing1.jsp");
    		rd.forward(request, response);
    		
    	}
    	
		
		
	}
	}

}
