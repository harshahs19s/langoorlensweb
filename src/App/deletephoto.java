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

/**
 * Servlet implementation class deletephoto
 */
@WebServlet("/deletephoto")
public class deletephoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletephoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String uploadId = request.getParameter("DN");
		int i=0;
		
		Connection con3=GetCon.getCon();
		String username="";
		String userid="";
		PreparedStatement ps3;
		PreparedStatement ps4;
		PreparedStatement ps5;
		ResultSet rs=null;
		ResultSet rs2=null;
		try {
			ps4=con3.prepareStatement("select user_id from photos where photo_id="+uploadId);
			rs=ps4.executeQuery();
			if(rs.next())
			{
			 userid=rs.getString(1);
			 
			}
			ps5=con3.prepareStatement("select username from user where user_id="+userid);
			rs2=ps5.executeQuery();
			if(rs2.next()) {
			 username=rs2.getString(1);
			}
			 ps3=con3.prepareStatement("DELETE FROM photos WHERE photo_id="+uploadId);
	            
			i = ps3.executeUpdate();
            ps3.close();	
			
            if(i>0) {
    			request.setAttribute("status", "You have successfully deleted");
    			RequestDispatcher rd=request.getRequestDispatcher("/adminuserprofilepass?USER="+username);
    			rd.forward(request, response);	
    		
    		
    		}
	
			}catch(Exception e){System.out.println(e);} 
		
		
		System.out.println(i);
		System.out.println(username);
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
