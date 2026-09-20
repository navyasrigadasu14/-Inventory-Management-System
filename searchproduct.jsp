<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Search Product</title>

    <style>
        body {
            background-color: powderblue;
            font-family: Arial;
            text-align: center;
        }

        table {
            margin: auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid black;
        }

        th {
            background-color: lightgreen;
        }

        input {
            padding: 8px;
        }

        .btn {
            padding: 8px 15px;
        }
    </style>
</head>

<body>

<center>

<h2>Search Product</h2>

<form method="get" action="searchproduct.jsp">

    <input type="text"
           name="keyword"
           placeholder="Enter Product Name"
           required>

    <input type="submit"
           value="Search"
           class="btn">

</form>

<br>

<%
String keyword = request.getParameter("keyword");

if(keyword != null && !keyword.trim().isEmpty()) {

    try {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/testdb",
            "root",
            "YOUR_PASSWORD"
        );

        PreparedStatement pst = con.prepareStatement(
            "SELECT * FROM product WHERE pname LIKE ?"
        );

        pst.setString(1, "%" + keyword + "%");

        ResultSet rs = pst.executeQuery();

        boolean found = false;
%>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Category</th>
    <th>Qty</th>
    <th>Price</th>
</tr>

<%
        while(rs.next()) {

            found = true;
%>

<tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getInt(4)%></td>
    <td><%=rs.getDouble(5)%></td>
</tr>

<%
        }

        if(!found) {
%>

<p>No product found.</p>

<%
        }

        rs.close();
        pst.close();
        con.close();

    }
    catch(Exception e) {
%>

<p style="color:red;">
    Error: <%=e.getMessage()%>
</p>

<%
    }

}
%>

</table>

</center>

</body>
</html>