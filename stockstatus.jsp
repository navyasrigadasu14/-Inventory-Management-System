<%@page import="java.sql.*"%>

<html>
<body bgcolor="lightyellow" text="Orchid">

<center>

<h2>STOCK STATUS</h2>

<table border="1" cellpadding="8" cellspacing="0">

<tr>
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Quantity</th>
    <th>Status</th>
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

        int qty = rs.getInt("qty");
        String status = "";

        if (qty == 0) {
            status = "Out Of Stock";
        } else if (qty < 5) {
            status = "Low Stock";
        } else {
            status = "Available";
        }
%>

<tr>
    <td><%=rs.getInt("pid")%></td>
    <td><%=rs.getString("pname")%></td>
    <td><%=qty%></td>
    <td><%=status%></td>
</tr>

<%
    }

    if (!found) {
%>

<tr>
    <td colspan="4">No Products Found</td>
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