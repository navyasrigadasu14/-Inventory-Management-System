<%@page import="java.sql.*"%>

<%
String t1 = request.getParameter("t1");
String t2 = request.getParameter("t2");
String t3 = request.getParameter("t3");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb",
        "root",
        "YOUR_PASSWORD"
    );

    if ("Admin".equals(t1)) {

        if ("Admin".equals(t2) && "Admin".equals(t3)) {
            session.setAttribute("name", t2);
            response.sendRedirect("AdminPage.jsp");
            return;
        } else {
            out.println("<h3>Invalid Admin Username or Password</h3>");
        }

    } else if ("Staff".equals(t1)) {

        ps = con.prepareStatement(
            "SELECT * FROM staff WHERE name=? AND pwd=? AND status='Active'"
        );

        ps.setString(1, t2.trim());
        ps.setString(2, t3);

        rs = ps.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            session.setAttribute("name", name);

            response.sendRedirect("StaffPage.jsp");
            return;
        } else {
            out.println("<h3>Invalid Staff Name or Password</h3>");
        }

    } else {
        out.println("<h3>Please select Admin or Staff</h3>");
    }

} catch(Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");

} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch(Exception e) {}
}
%>
