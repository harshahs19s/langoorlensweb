<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ page import="App.GetCon"%>
<%
  String id =request.getParameter("imgid");
  try{      
   // Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=GetCon.getCon();     
    Statement st=con.createStatement();
    String strQuery = "select actual_photo from photos where photo_id="+id;
    ResultSet rs = st.executeQuery(strQuery);

    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString(1);
       }  
    rs = st.executeQuery(strQuery);
    if(rs.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      InputStream readImg = rs.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();        
    }
  }
  catch (Exception e){
    e.printStackTrace();
  }
%>
