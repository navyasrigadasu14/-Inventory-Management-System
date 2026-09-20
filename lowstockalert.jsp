<%@page import="java.sql.*"%>

<html>
<body bgcolor="lavender" text="maroon">
<center>

<h2>LOW STOCK ALERT</h2>

<table border="1">
<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Quantity</th>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/testdb",
    "root",
    "YOUR_PASSWORD"
);

PreparedStatement pst = con.prepareStatement(
    "SELECT pid, pname, qty FROM product WHERE qty < 5"
);

ResultSet rs = pst.executeQuery();

boolean found = false;

while(rs.next()) {
    found = true;
%>

<tr>
<td><%=rs.getInt("pid")%></td>
<td><%=rs.getString("pname")%></td>
<td><%=rs.getInt("qty")%></td>
</tr>

<%
}

if(!found) {
%>

<tr>
<td colspan="3">No Low Stock Products</td>
</tr>

<%
}

rs.close();
pst.close();
con.close();
%>

</table>

</center>
</body>
</html>