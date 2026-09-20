<html>
<body bgcolor="wheat" text="blue">
<center><h2>
<%@page import="java.sql.*"%>
<% 
	int c=0;
try{
	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("select count(*) from product");
        ResultSet rs=pst.executeQuery();
	if(rs.next()){
		c=rs.getInt(1);
	}
	else{
		c=0;
	}
	rs.close();
	pst.close();
	con.close();
}
catch(Exception e){ out.println(e); }
%>
<a href='viewstock.jsp'> View Stock </a><br>
<a href='stockstatus.jsp'> Stock Status (<%=c%>) </a><br>
<a href='lowstockalert.jsp'> Low Stock Alert</a><br>
</h2>
</center>
</body>
</html>