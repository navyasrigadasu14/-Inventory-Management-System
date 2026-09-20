<%@page import="java.sql.*"%>

<html>
<body bgcolor="lightpink">

<center>
<h2>

<%
Connection con = null;
PreparedStatement ps = null;
PreparedStatement pst = null;
PreparedStatement updatePs = null;
ResultSet rs = null;

try {
    int pid = Integer.parseInt(request.getParameter("t1"));
    int qty = Integer.parseInt(request.getParameter("t2"));

    if (qty <= 0) {
        out.println("Quantity must be greater than zero.");
        return;
    }

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    con.setAutoCommit(false);

    // Check product and available quantity
    ps = con.prepareStatement(
        "SELECT pname, qty FROM product WHERE pid=?"
    );

    ps.setInt(1, pid);
    rs = ps.executeQuery();

    String pname = "";
    int availableQty = 0;

    if (rs.next()) {
        pname = rs.getString("pname");
        availableQty = rs.getInt("qty");
    } else {
        out.println("Product Not Found.");
        return;
    }

    rs.close();
    ps.close();

    if (qty > availableQty) {
        out.println("Insufficient Stock. Available Quantity: "
                    + availableQty);
        return;
    }


    updatePs = con.prepareStatement(
        "UPDATE product SET qty = qty - ? WHERE pid=?"
    );

    updatePs.setInt(1, qty);
    updatePs.setInt(2, pid);

    int updated = updatePs.executeUpdate();

    if (updated == 0) {
        con.rollback();
        out.println("Stock update failed.");
        return;
    }

    updatePs.close();

    
    pst = con.prepareStatement(
        "INSERT INTO stock(pid, pname, qty, type, sdate) " +
        "VALUES(?,?,?,?,CURDATE())"
    );

    pst.setInt(1, pid);
    pst.setString(2, pname);
    pst.setInt(3, qty);
    pst.setString(4, "OUT");

    int inserted = pst.executeUpdate();

    if (inserted > 0) {
        con.commit();
        out.println("<h2>Stock Removed Successfully</h2>");
    } else {
        con.rollback();
        out.println("<h2>Stock Removal Failed</h2>");
    }

} catch (Exception e) {
    out.println("Error: " + e);

    try {
        if (con != null) {
            con.rollback();
        }
    } catch (Exception ex) {
        out.println(ex);
    }

} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (pst != null) pst.close();
        if (updatePs != null) updatePs.close();
        if (con != null) con.close();
    } catch (Exception e) {
        out.println(e);
    }
}
%>

<br><br>
<a href="stockout.jsp">Back to Stock Out</a>

</h2>
</center>

</body>
</html>