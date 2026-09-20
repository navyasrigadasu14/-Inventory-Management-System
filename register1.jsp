<%@page import="java.sql.*"%>

<%
String staffid = request.getParameter("t1");
String name = request.getParameter("t2");
String pwd = request.getParameter("t3");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    String sql = "INSERT INTO staff (staffid, name, pwd, status) VALUES (?, ?, ?, ?)";

    ps = con.prepareStatement(sql);

    ps.setString(1, staffid);
    ps.setString(2, name);
    ps.setString(3, pwd);
    ps.setString(4, "Active");

    int x = ps.executeUpdate();

    if (x > 0) {
        out.println("<h2>Registration Successful</h2>");
        out.println("<a href='index.jsp'>Go to Login</a>");
    }

} catch(Exception e) {
    out.println("<h3>Error: " + e + "</h3>");
} finally {
    try {
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch(Exception e) {}
}
%>