<%@page import="java.sql.*"%>

<html>
<body bgcolor="powderblue" text="blue">

<center>
<h2>VIEW STOCK</h2>

<table border="1" cellpadding="8" cellspacing="0">

<tr>
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Quantity</th>
    <th>Price</th>
</tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    st = con.createStatement();

    rs = st.executeQuery("SELECT * FROM product");

    boolean found = false;

    while (rs.next()) {
        found = true;
%>

<tr>
    <td><%=rs.getInt("pid")%></td>
    <td><%=rs.getString("pname")%></td>
    <td><%=rs.getString("category")%></td>
    <td><%=rs.getInt("qty")%></td>
    <td><%=rs.getDouble("price")%></td>
</tr>

<%
    }

    if (!found) {
%>

<tr>
    <td colspan="5">No Products Found</td>
</tr>

<%
    }

} catch (Exception e) {
    out.println("Error: " + e);

} finally {
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>

</table>

</center>

</body>
</html>