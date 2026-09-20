<%@page import="java.sql.*"%>
<%
if(request.getParameter("delete")!=null)
{
      int id=Integer.parseInt(request.getParameter("id"));
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "YOUR_PASSWORD");
         PreparedStatement ps=con.prepareStatement("delete from staff where staffid=?");
         ps.setInt(1,id);
         ps.executeUpdate();
         out.println("staff Deleted");
}
catch(Exception e)
{
       out.println(e);
}
}
%>
<html>
<body bgcolor="wheat" text="brown">
<center>
<h1>Delete Staff</h1>
<form method="post">Enter Staff ID
<input type="text" name="id"><br><br>
<input type="submit" name="delete" value="DELETE">
</form>
</center>
</body>
</html>