<html>
<body bgcolor="grey" text="white">
<center><h1>
<%@page import="java.sql.*"%>
<%
try{
	String s1=request.getParameter("t1");
	String s2=request.getParameter("t2");
	        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("insert into category values(?,?)");
	pst.setString(1,s1);
	pst.setString(2,s2);	
	int x=pst.executeUpdate();
if(x>0){
     out.println(s1+"Added successfully");
}else{
	out.println("failed");
}
pst.close();
con.close();
}
catch(Exception e){
System.out.println(e);
}
%>
<br><a href='addcategory.jsp'> click here </a> to back <br>
</body>
</html>
	        