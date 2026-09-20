<%@page import="java.sql.*"%>

<html>
<body bgcolor="wheat" text="blue">

<center>
<h2>

<%
int c = 0;
int d = 0;

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

    pst = con.prepareStatement(
        "SELECT COUNT(sid) FROM stock WHERE type='IN'"
    );

    rs = pst.executeQuery();

    if (rs.next()) {
        c = rs.getInt(1);
    }

    rs.close();
    pst.close();

    pst = con.prepareStatement(
        "SELECT COUNT(sid) FROM stock WHERE type='OUT'"
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

<a href="stockin.jsp">Stock In (<%=c%>)</a>
<br><br>

<a href="stockout.jsp">Stock Out (<%=d%>)</a>

</h2>
</center>

</body>
</html>