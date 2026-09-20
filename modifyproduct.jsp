<%@page import="java.sql.*"%>

<%
if(request.getParameter("update") != null) {

    int productid = Integer.parseInt(request.getParameter("t1"));
    String productname = request.getParameter("t2");
    String category = request.getParameter("t3");
    int quantity = Integer.parseInt(request.getParameter("t4"));
    double price = Double.parseDouble(request.getParameter("t5"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/testdb",
            "root",
            "YOUR_PASSWORD"
        );

        ps = con.prepareStatement(
            "UPDATE product SET pname=?, category=?, qty=?, price=? WHERE pid=?"
        );

        ps.setString(1, productname);
        ps.setString(2, category);
        ps.setInt(3, quantity);
        ps.setDouble(4, price);
        ps.setInt(5, productid);

        int x = ps.executeUpdate();

        if(x > 0) {
            response.sendRedirect("viewproduct.jsp");
        } else {
            out.println("Product ID Not Found");
        }

    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if(ps != null) ps.close();
            if(con != null) con.close();
        } catch(Exception e) {
            out.println(e);
        }
    }
}
%>

<html>
<body bgcolor="wheat" text="brown">
<center>

<h1>Modify Product</h1>

<form method="post">

<table border="1">

<tr>
<td>Product ID</td>
<td><input type="number" name="t1" required></td>
</tr>

<tr>
<td>Product Name</td>
<td><input type="text" name="t2" required></td>
</tr>

<tr>
<td>Category</td>
<td><input type="text" name="t3" required></td>
</tr>

<tr>
<td>Quantity</td>
<td><input type="number" name="t4" min="0" required></td>
</tr>

<tr>
<td>Price</td>
<td><input type="number" name="t5" min="0" step="0.01" required></td>
</tr>

</table>

<br>
<input type="submit" name="update" value="Modify">

</form>

</center>
</body>
</html>