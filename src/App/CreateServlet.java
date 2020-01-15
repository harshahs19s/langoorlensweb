package App;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CreateServlet")
@MultipartConfig(maxFileSize = 16177215)
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String email=request.getParameter("email");
		
		String college=request.getParameter("college");
		
		String ph=request.getParameter("phone");
		//String phone=Double.parseDouble(ph);
		
		String sqlDate = request.getParameter("dob");
		
		String designation = request.getParameter("design");
		
		String cource = request.getParameter("cource");
		
		String year = request.getParameter("from");
		
		String yearto = request.getParameter("to");
		
		String desg;
		
		
		InputStream inputStream = null;
		InputStream inputStream1 = null;// input stream of the upload file
		InputStream cropped_inputstream=null;
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			inputStream1 = filePart.getInputStream();
		}
/*		BufferedImage image= ImageIO.read(inputStream);
		ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, "jpg", os);
	*/	
		
		if(designation.equals("1"))
		{
			desg="TEACHER";
			
			//cource="NULL";
			
			//year ="NULL";
		//	yearto="NULL";
		}
		else
		{
			desg="STUDENT";
		}
		
		

		int status=RegisterUser.register(username, password, email, college, ph, sqlDate,desg,cource,year,yearto,inputStream,name);
		
		
		
		if(status>0){
			
			request.setAttribute("loginname", username);
			request.setAttribute("password", password);
			RequestDispatcher rd=request.getRequestDispatcher("registerresult.jsp");
			rd.include(request, response);
		}
		else{
			request.setAttribute("loginname", "failure to register , please re submit with other LOGIN NAME ");
			RequestDispatcher rd=request.getRequestDispatcher("registerresult.jsp");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
