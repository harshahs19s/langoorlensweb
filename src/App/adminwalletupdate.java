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

@WebServlet("/adminwalletupdate")
public class adminwalletupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminwalletupdate() {
        super();
            }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.getWriter().append("Served at: ").append(request.getContextPath());
		String uid = request.getParameter("uid");
		String uname = request.getParameter("user");
		
		float amt= Float.valueOf(request.getParameter("amt"));
		float wall= Float.valueOf(request.getParameter("wall"));
		
		float tamt = amt+wall;
		
		System.out.println(uid);
		System.out.println(tamt);
		
		Connection con=GetCon.getCon();
		int i=0;
		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement("UPDATE user SET wallet=? where user_id="+uid);
			ps1.setFloat(1,tamt);
			i = ps1.executeUpdate();
            ps1.close();	
			
			
	
			}catch(Exception e){System.out.println(e);}  
		
		
		if(i>0)
		{
            
//edited  start-------------------------------
	
            String sql = "INSERT INTO payment_history (user_id,date,time,amount_debited,type,transaction_id) values (?,NOW(),NOW(), ?,?,?)";
        	PreparedStatement statement;
			try {
				statement = con.prepareStatement(sql);
				statement.setString(1, uid);
	        	statement.setFloat(2,amt);
	        	///type is paytm
	        	String type="cash";
	        	statement.setString(3, type);
	        	//verify this..! hard coded for transaction_id column
	        	statement.setInt(4, 0);
	        	
	        	/////
	        	statement.executeUpdate();
	        
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        		           
//end---------------------------------------------------------
        	

			
			System.out.println(i);
			request.setAttribute("status", "You have successfully updated");
			RequestDispatcher rd=request.getRequestDispatcher("adminuserprofilepass?USER="+uname);
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status", "Failed ! retry ");
			RequestDispatcher rd=request.getRequestDispatcher("adminuserprofilepass?USER="+uname);
			rd.forward(request, response);
			//System.out.println(i);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	}

}
