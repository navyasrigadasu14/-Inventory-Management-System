<%@page import="java.sql.*"%>
<%
if(request.getParameter("delete")!=null)
{
      int id=Integer.parseInt(request.getParameter("id"));
try
{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "YOUR_PASSWORD");
         PreparedStatement ps=con.prepareStatement("delete from category where cid=?");
         ps.setInt(1,id);
         int x = ps.executeUpdate();

if(x > 0) {
    out.println("Category Deleted Successfully");
} else {
    out.println("Category ID Not Found");
}

ps.close();
con.close();
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
<h1>Delete Category</h1>
<form method="post">Enter Category ID
<input type="text" name="id"><br><br>
<input type="submit" name="delete" value="DELETE">
</form>
</center>
</body>
</html>