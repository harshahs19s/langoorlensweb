package App;

import java.awt.Color;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.imgscalr.Scalr;

import net.coobird.thumbnailator.filters.Caption;
import net.coobird.thumbnailator.geometry.Position;
import net.coobird.thumbnailator.geometry.Positions;

/**
 * Servlet implementation class UserDpUpdate
 */
@WebServlet("/UpdateUser")
@MultipartConfig(maxFileSize = 1024*1024*50)
public class UpdateUser extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session =request.getSession(false);
			String user=(String)session.getAttribute("USER");
			String message="";
			String phone=request.getParameter("phone");
			String name=request.getParameter("name");
			System.out.println(phone+name);
			 
				 try {
					message=AdminPhotoUploadUtil.meth3(phone,name ,user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					request.setAttribute("message", message);
					RequestDispatcher rd=request.getRequestDispatcher("UserHomeServlet");  
		    		rd.forward(request,response);
						
				}
				 
					request.setAttribute("message", message);
					RequestDispatcher rd=request.getRequestDispatcher("UserHomeServlet");  
		    		rd.forward(request,response);
					
					
		
		}}


