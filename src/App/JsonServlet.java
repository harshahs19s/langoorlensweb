package App;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.codehaus.jackson.map.ObjectMapper;

import com.mysql.jdbc.Blob;

/**
 * Servlet implementation class JsonServlet
 */
@WebServlet("/JsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 List<Article> articles = new LinkedList<Article>();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Received Request");
		//String jsonstring=request.getParameter("content");
		//System.out.println("got para");
		//Registeres res11= JsonUtil.convertJsonToJava(jsonstring, Registeres.class);
		//System.out.println(res11.title);
		//System.out.println(res11.Title);
		Connection con=GetCon.getCon();
		String str="";
		try {
			PreparedStatement ps=con.prepareStatement("select amount from walllet where user_id=?");
		ps.setInt(1, 1);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
		str+="Amount"+rs.getFloat(1);
			
		}
		String res=JsonUtil.convertJavaToJson(str);
		System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
