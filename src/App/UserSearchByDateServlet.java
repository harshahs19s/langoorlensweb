package App;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class UserSearchByDateServlet
 */
@WebServlet("/UserSearchByDateServlet")
public class UserSearchByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UserSearchByDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		java.sql.Date d = java.sql.Date.valueOf(request.getParameter("from"));
 		java.sql.Date d1 = java.sql.Date.valueOf(request.getParameter("to"));
 		String Transactions="";
 		String Amount="";
 		String status="";
 		String id=request.getParameter("userid");
 		PrintWriter out = response.getWriter();
   String action=(String)request.getParameter("action");
 	if(action.equals("Debit")){

 		try{
 			/////
 			status="Debit";
 	         Connection con=GetCon.getCon();
 	        PreparedStatement stmt=con.prepareStatement("select count(*) ,sum(amount_credited)  from download_history  where user_id=? and date between ? and ?  ");
 	       stmt.setString(1, "39");
 	        stmt.setDate(1, d);
 	        stmt.setDate(2, d1);
 	        ResultSet rs=stmt.executeQuery();
 	        if(rs.next()){
 	        	int p=rs.getInt(1);
 	        	//photos+="Downloaded Photos: ";
 	        	Transactions+=p;
 	        	int p1=rs.getInt(2);
 	        	Amount+=p1;
 	        }
 	      
 	      
 		}catch(Exception e){
 			e.printStackTrace();
 		}
 		
 	}
 	else{
		

 		try{
 			/////
 			 status="Credit";
 			 Connection con=GetCon.getCon();
 	        PreparedStatement stmt=con.prepareStatement("select count(*) ,sum(amount_debited)  from payment_history  where user_id=? and date between ? and ? ");
 	        stmt.setString(1, "39");
 	        stmt.setDate(2, d);
 	        stmt.setDate(3, d1);
 	        ResultSet rs=stmt.executeQuery();
 	        if(rs.next()){
 	        	int p=rs.getInt(1);
 	        	//photos+="Uploaded Photos: ";
 	        	
 	        	Transactions+=p;
 	        	//String tag="Uploaded";
 	        	int p1=rs.getInt(2);
 	        	Amount+=p1;   }
 	      
 	      
 		}catch(Exception e){
 			e.printStackTrace();
 		}	
		}
 	request.setAttribute("photos", Transactions);
   request.setAttribute("price", Amount);
   request.setAttribute("status", status);
  out.write("<html><body>Total Sum  </br><br> "+Amount+"</br> <br>Total  </br> <br> "+Transactions+"</br></font></body></html>");
	//RequestDispatcher rd=request.getRequestDispatcher("DisplayByDate.jsp");  
	//rd.include(request,response); 

	}

}
