package App;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AdminUserEdit
 */
@WebServlet("/AdminUserEdit")
public class AdminUserEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
//Part filePart, int userid ,String password,float wallet, String college,String phone,String dob,String desg,
	//String cource,String year,String yearto,String name) 
	  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession(false);
		String user=request.getParameter("USER");
		String message="";
		String name =request.getParameter("name");
		String dob =request.getParameter("dob");
		String phone =request.getParameter("watsapp");
		String college =request.getParameter("college");
		String desig =request.getParameter("desig");
		String course =request.getParameter("course");
		String yearfrom =request.getParameter("yearfrom");
		String yearto =request.getParameter("yearto");
		String wallet =request.getParameter("wallet");
		
		
		 try {
			 
			 AdminUserDetailUpdate.methuser(user, wallet, college, phone, dob, desig, course, yearfrom, yearto, name);
				//message=AdminPhotoUploadUtil.meth1(filePart, user);
				RequestDispatcher rd=request.getRequestDispatcher("adminuserprofilepass");  
	    		rd.forward(request,response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				RequestDispatcher rd=request.getRequestDispatcher("adminuserprofilepass");  
	    		rd.forward(request,response);
				
			}
		 
										}	

   
		
		
		
	}


