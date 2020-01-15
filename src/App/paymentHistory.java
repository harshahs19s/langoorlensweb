package App;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/paymentHistory")
public class paymentHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public paymentHistory() {
        super();
            }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				
				
				
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();
		ArrayList alist=new ArrayList();
		Connection con=GetCon.getCon();
		PreparedStatement ps=null;
		
		Iterator itr;
		ResultSet rs=null;
		try {
	
			 ps=con.prepareStatement("SELECT user_id,date,time,amount_debited,type FROM payment_history");
			 rs=ps.executeQuery();
			 while (rs.next()) {

					//System.out.println(rs.getString(1));
					String Var = (String)rs.getString(1);
					// String Var1=rs.getString(2);
					Date Var2 = rs.getDate(2);
					String dates=""+Var2;
					Time Var3 = rs.getTime(3);
					String times=""+Var3;
							
					float Var4 = rs.getFloat(4);
					String amt=""+Var4;
					String Var5 = rs.getString(5);

					PreparedStatement ps1 = con.prepareStatement("SELECT username FROM user WHERE user_id=?");
					ps1.setString(1, Var);
					ResultSet rs1 = ps1.executeQuery();
					if (rs1.next()) {
						String Var6 = rs1.getString(1);
						alist.add(Var6);
						alist.add(Var);
						alist.add(dates);
						alist.add(times);
						alist.add(amt);
						alist.add(Var5);
						
			 					 			
					}
					
			 }
			 /* itr=alist.iterator();
			 int count=0;
			while (itr.hasNext())
			 {
				System.out.println(alist.get(count)); 
				System.out.println(count);
				
			 }
			 out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n" + 
			 		"<html>\r\n" + 
			 		"<head>\r\n" + 
			 		"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n" + 
			 		"<title>Insert title here</title>\r\n" + 
			 		"</head>\r\n" + 
			 		"<body><table>"
			 		+ "<thead>"
			 		+ ""
			 		+ ""
			 		+ "<th>Username</th>"
			 		+ "<th>Userid</th>"
			 		+ ""
			 		+ "<th>date</th>"
			 		+ "<th>time</th>"
			 		+ "<th>Amount</th>"
			 		+ "<th>Type</th></thead>"
			 		+ "<tbody>"
			 		+ "<tr><td>"+alist.get(0)+"</td>"
			 		+ "<td>"+alist.get(1)+"</td>"
			 		+ "<td>"+alist.get(2)+"</td>"
			 		+ "<td>"+alist.get(3)+"</td>"
			 		+ "<td>"+alist.get(4)+"</td>"
			 		+ "<td>"+alist.get(5)+"</td></tr></tbody>"
			 		+ "</table></body></htlm>");
			 
			 */
			 request.setAttribute("hello", "hey");
			// request.setAttribute("data", alist);
				RequestDispatcher rd=request.getRequestDispatcher("temprrr.jsp");
				rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
				doGet(request, response);
	}

}
