<html>
<body bgcolor="cyan" text="Blue">
<form action='addstaff1.jsp'>
<center><h2> STAFF DETAILS
<%@page import="java.sql.*"%>
<table border="1" width="100%">
<tr>
          <th> Staff Id</th>
          <th> Staff Name</th>
          <th> Contact No</th>
          <th> Email</th>
          <th> Date Of Dirth</th>
          <th>Image </th>
          <th>Joining Date</th>
          <th> Department</th>
</tr>
<%
int staffno=0;
try{
Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("select *from staff where status='Active'");
        ResultSet rs=pst.executeQuery();
         while(rs.next()){
              out.println("<tr>");
              out.println("<th>"+rs.getString(1)+"</th>");
		out.println("<th>"+rs.getString(2)+"</th>");
		out.println("<th>"+rs.getString(3)+"</th>");
		out.println("<th>"+rs.getString(4)+"</th>");
		out.println("<th>"+rs.getString(5)+"</th>");
		String x=rs.getString(7);
		out.println("<th><a href='zoom.jsp?t1="+x+" '><img src=' "+x+" 'width=100 height=100></a></th>");
		out.println("<th>"+rs.getString(8)+"</th>");
 		out.println("<th>"+rs.getString(9)+"</th>");

                out.println("</tr>");
         }
}
catch(Exception e){
     out.println(e);
}
%>
</table>
</form>
</body>
</html>
