package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 
@WebServlet("/HistoryServe")
public class HistoryServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public HistoryServe() {
        super();
            }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=GetCon.getCon();
		PrintWriter out = response.getWriter();
		PreparedStatement ps1=null;
		ResultSet rs1=null;
		PreparedStatement ps12=null;
		ResultSet rs12=null;
		List paymenthistory=new ArrayList();
				try {
					
					
				ps1=	con.prepareStatement("SELECT user_id,date,time,amount_debited,type, user.username FROM payment_history");
				rs1=ps1.executeQuery();
				while(rs1.next())
				{
					//System.out.println(rs.getString(1));
					String Var = rs1.getString(1);
					// String Var1=rs.getString(2);
					Date Var2 = rs1.getDate(2);
					Time Var3 = rs1.getTime(3);
					float Var4 = rs1.getFloat(4);
					String Var5 = rs1.getString(5);

					 ps12 = con.prepareStatement("SELECT username FROM user WHERE user_id=?");
					ps12.setString(1, Var);
					 rs12 = ps12.executeQuery();
					if (rs12.next()) {
						String Var6 = rs1.getString(1);
					//paymenthistory=new ArrayList();
					paymenthistory.add(Var6);
					paymenthistory.add(Var);
					paymenthistory.add(Var2);
					paymenthistory.add(Var3);
					paymenthistory.add(Var4);
					paymenthistory.add(Var5);
					
						
						
				}
				
				
				}
				}
				catch(Exception e)
				{
				e.printStackTrace();
				}
				
		
		
				request.setAttribute("data",paymenthistory);

				  //Disptching request

				  RequestDispatcher dispatcher = request.getRequestDispatcher("mine.jsp");

				  if (dispatcher != null){

				  dispatcher.forward(request, response);

				  } 
		
		
		
	}

}
