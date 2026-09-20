<%@page import="java.sql.*"%>

<html>
<body bgcolor="wheat" text="blue">

<center>
<h2>

<%
int c = 0; // Stock In
int b = 0; // Stock Out
int d = 0; // Products

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    // Stock In count
    pst = con.prepareStatement(
        "SELECT COUNT(sid) FROM stock WHERE type='IN'"
    );
    rs = pst.executeQuery();

    if (rs.next()) {
        c = rs.getInt(1);
    }

    rs.close();
    pst.close();

    // Stock Out count
    pst = con.prepareStatement(
        "SELECT COUNT(sid) FROM stock WHERE type='OUT'"
    );
    rs = pst.executeQuery();

    if (rs.next()) {
        b = rs.getInt(1);
    }

    rs.close();
    pst.close();
    pst = con.prepareStatement(
        "SELECT COUNT(*) FROM product"
    );
    rs = pst.executeQuery();

    if (rs.next()) {
        d = rs.getInt(1);
    }

} catch (Exception e) {
    out.println("Error: " + e);
} finally {
    try {
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>

<a href="viewstock.jsp">
    View Stock (<%=d%>)
</a>
<br><br>

<a href="stockstatus.jsp">
    Stock Status (<%=d%>)
</a>
<br><br>

<a href="viewstockin.jsp">
    View Stock In (<%=c%>)
</a>
<br><br>

<a href="viewstockout.jsp">
    View Stock Out (<%=b%>)
</a>

</h2>
</center>

</body>
</html>