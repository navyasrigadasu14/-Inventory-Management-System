<%@page import="java.sql.*"%>

<%

if(request.getParameter("update")!=null)
{

	int cid=Integer.parseInt(request.getParameter("t1"));
	String cname= request.getParameter("t2");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "YOUR_PASSWORD");
	PreparedStatement ps= con.prepareStatement("update category set cname=? where cid=?");
	ps.setString(1,cname);
	ps.setInt(2,cid);
	int x=ps.executeUpdate();
	ps.close();
	con.close();
	if(x>0){
	response.sendRedirect("viewcategory.jsp");
	}
	else{
	out.println("Update failed");
	}
}
	catch(Exception e)
	{
		out.println(e);
	}
}

%>

<html>
<body bgcolor="wheat" text="brown">
<center><h1>Modify Category</h1>
<form method="post">
<table border="1">
<tr>
<td>Category ID</td>
<td><input type="text" name="t1" required></td>
</tr>

<tr>
<td>Category Name</td>
<td><input type="text" name="t2" required></td>
</tr>


</table>
<input type="submit" name="update" value="Modify">
</form>
</center>
</body>
</html>