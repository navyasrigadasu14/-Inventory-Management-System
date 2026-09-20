<html>
<body bgcolor="powderblue" text="Indianred">
<center>

<%@page import="java.sql.*"%>

<h2>Category Details</h2>

<table border="1">
<tr>
<th>cid</th>
<th>cname</th>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/testdb",
    "root",
    "YOUR_PASSWORD"
);

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from category");

while(rs.next()) {
%>

<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
</tr>

<%
}

rs.close();
st.close();
con.close();
%>

</table>

</center>
</body>
</html>