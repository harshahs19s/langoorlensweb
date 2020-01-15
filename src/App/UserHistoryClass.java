package App;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserHistoryClass {

	  
	
	
	public static ResultSet debitHistory(String user_id) throws SQLException
	{  Connection con=GetCon.getCon();
	   PreparedStatement ps_debit=null;
	    ResultSet rs_debit=null;
	  
		ps_debit=con.prepareStatement("select  date,time,amount_credited from download_history where user_id ="+user_id);
		rs_debit=ps_debit.executeQuery();
		
		
		return rs_debit;
	}
	
	
	
	
	public static ResultSet creditHistory(String user_id) throws SQLException
	{
		//System.out.println(user_id);
		 Connection con=GetCon.getCon();
		  PreparedStatement ps_credit;
		    ResultSet rs_credit;
		
		ps_credit=con.prepareStatement("select date,time,amount_debited, transaction_id from payment_history where user_id ="+user_id);
		
		rs_credit=ps_credit.executeQuery();
		
		return rs_credit;
	}
	
	

	
}
