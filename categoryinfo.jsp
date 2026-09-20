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
	PreparedStatement pst=con.prepareStatement("select count(*) from category");
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
<a href='addcategory.jsp'> Add Category </a><br>
<a href='viewcategory.jsp'> View Category (<%=c%>) </a><br>
<a href='modifycategory.jsp'> Modify Category</a><br>
<a href='deletecategory.jsp'> Delete Category</a><br>
</h2>
</center>
</body>
</html>