package App;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class paytmupdate
 */
@WebServlet("/paytmupdate")
public class paytmupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paytmupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uid = request.getParameter("uid");
		String tid = request.getParameter("tid");
		
		float amt= Float.valueOf(request.getParameter("amt"));
		
		
		
		
		
		float Var=0;
		 Connection con1=GetCon.getCon();
    	PreparedStatement ps1;
    	ResultSet rs1 = null;
    	
    		try {
				ps1 = con1.prepareStatement("SELECT wallet FROM user where user_id=?");
				ps1.setString(1, uid);
				rs1 = ps1.executeQuery();
				
				while(rs1.next())
	    		{
	    			
	    		System.out.println(rs1.getString(1));	
	    		
	    		
	    		
				 Var=rs1.getFloat(1);
	    		
                  }
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    
		
		
		
		
		
		
		float tamt = amt+Var;
		
		System.out.println(uid);
		
		
		Connection con=GetCon.getCon();
		int i=0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("UPDATE user SET wallet=? where user_id="+uid);
			ps.setFloat(1,tamt);
			i = ps.executeUpdate();
            ps.close();	
			
			
	
			}catch(Exception e){System.out.println(e);}  
		
		
		if(i>0)
		{
			
			Connection con3=GetCon.getCon();
			
			PreparedStatement ps3;
			try {
					
	            
//edited  start-------------------------------
		
	            String sql = "INSERT INTO payment_history (user_id,date,time,amount_debited,type,transaction_id) values (?,NOW(),NOW(), ?,?,?)";
	        	PreparedStatement statement = con.prepareStatement(sql);
	        	statement.setString(1, uid);
	        	statement.setFloat(2,amt);
	        	///type is paytm
	        	String type="paytm";
	        	statement.setString(3, type);
	        	/////
	        	statement.setString(4,tid);
	        	statement.executeUpdate();
	        		           
//end---------------------------------------------------------
	        	
	        	
	        	ps3 = con3.prepareStatement("DELETE FROM paytmtransaction WHERE transactionid="+tid);
				i = ps3.executeUpdate();
	            ps3.close();
	        	
				}catch(Exception e){System.out.println(e);} 
			
			
			System.out.println(i);
			request.setAttribute("status", "You have successfully updated");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status", "Failed ! retry ");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
			//System.out.println(i);
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
