<html>
<body bgcolor="lightyellow">
<center>
<h2>Add Product</h2>
<%@page import="java.sql.*"%>
<%
int no=0;
try{
Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("select max(pid) from product");
        ResultSet rs=pst.executeQuery();
         if(rs.next()){
              no=Integer.parseInt(rs.getString(1))+1;
         }
}
catch(Exception e){
no=10001;
}
%>

<form action="addproduct1.jsp">

<table border="1">

<tr>
<td>Product ID</td>
<td><input type="text" name="t1" value= <%=no%> readonly></td>
</tr>

<tr>
<td>Product Name</td>
<td><input type="text" name="t2"></td>
</tr>

<tr>
<td>Category</td>
<td><input type="text" name="t3"></td>
</tr>

<tr>
<td>Quantity</td>
<td><input type="text" name="t4"></td>
</tr>

<tr>
<td>Price</td>
<td><input type="text" name="t5"></td>
</tr>
</table>
<input type="submit" value="Add Product">
</form>
</center>
</body>
</html>