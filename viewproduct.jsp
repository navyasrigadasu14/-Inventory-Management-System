<html>
<body bgcolor="powderblue" text="Indianred">
<center>
<%@page import="java.sql.*"%>
<h2>Product Details</h2>

<table border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Qty</th>
<th>Price</th>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb",
"root",
"YOUR_PASSWORD");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from product");

while(rs.next())
{
%>

<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
<td><%=rs.getDouble(5)%></td>
</tr>

<%
}
%>

</table>
</center>
</body>
</html>