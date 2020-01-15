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

@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public changepassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String uid = request.getParameter("uid");
		String password = request.getParameter("pass");
		
		System.out.println(uid);
		System.out.println(password);
		
		Connection con=GetCon.getCon();
		int i=0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("UPDATE user SET password=? WHERE user_id="+uid);
			ps.setString(1,password);
			i = ps.executeUpdate();
            ps.close();	
			
			
	
			}catch(Exception e){System.out.println(e);}  
		
		if(i>0)
		{
			request.setAttribute("status", "You have successfully updated password , please login with new password");
			RequestDispatcher rd=request.getRequestDispatcher("passwordchangeres.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status", "something went wrong , retry");
			RequestDispatcher rd=request.getRequestDispatcher("passwordchangeres.jsp");
			rd.forward(request, response);
			
		}
		
	}

}
