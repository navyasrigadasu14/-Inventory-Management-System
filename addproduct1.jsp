<html>
<body bgcolor="powderblue" text="black">
<center>
<h1>

<%@page import="java.sql.*"%>

<%
String s1 = request.getParameter("t1");
String s2 = request.getParameter("t2");
String s3 = request.getParameter("t3");
String s4 = request.getParameter("t4");
String s5 = request.getParameter("t5");

Connection con = null;
PreparedStatement pst = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    pst = con.prepareStatement(
        "INSERT INTO product VALUES(?,?,?,?,?)"
    );

    pst.setString(1, s1);
    pst.setString(2, s2);
    pst.setString(3, s3);
    pst.setString(4, s4);
    pst.setString(5, s5);

    int x = pst.executeUpdate();

    if (x > 0) {
        out.println(s1 + " Added Successfully");
    } else {
        out.println("Product Insertion Failed");
    }

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if(pst != null) pst.close();
        if(con != null) con.close();
    } catch(Exception e) {
        out.println(e);
    }
}
%>

<br>
<a href="addproduct.jsp">Click here</a> to back

</h1>
</center>
</body>
</html>