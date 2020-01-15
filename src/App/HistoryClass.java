package App;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class HistoryClass {

	
	static Connection con=GetCon.getCon();
	static PreparedStatement ps1;
	static List PayList=new ArrayList();
	static ResultSet rs1=null;
	public static  ArrayList paymentHistory()
	{
		try {
		ps1=con.prepareStatement("SELECT user_id, from ");
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

			PreparedStatement ps12 = con.prepareStatement("SELECT username FROM user WHERE user_id=?");
			ps12.setString(1, Var);
			ResultSet rs12 = ps12.executeQuery();
			if (rs12.next()) {
				String Var6 = rs1.getString(1);
			//paymenthistory=new ArrayList();
			PayList.add(Var6);
			PayList.add(Var);
			PayList.add(Var2);
			PayList.add(Var3);
			PayList.add(Var4);
			PayList.add(Var5);
			
		
			}
	}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return (ArrayList) PayList;
			}
	
	
}
