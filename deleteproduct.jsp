<%@page import="java.sql.*"%>

<%
if(request.getParameter("delete") != null) {

    int id = Integer.parseInt(request.getParameter("id"));

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
            "DELETE FROM product WHERE pid=?"
        );

        ps.setInt(1, id);

        int x = ps.executeUpdate();

        if(x > 0) {
            out.println("Product Deleted Successfully");
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

<h1>Delete Product</h1>

<form method="post">

Enter Product ID:
<input type="number" name="id" required>

<br><br>

<input type="submit" name="delete" value="DELETE">

</form>

</center>
</body>
</html>