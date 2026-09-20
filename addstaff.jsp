<html>
<body bgcolor="cyan" text="Blue">
<form action='addstaff1.jsp'>
<center><h2> STAFF REGISTRATION
<%@page import="java.sql.*"%>
<%
int no=0;
try{
Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("select max(staffid) from staff");
        ResultSet rs=pst.executeQuery();
         if(rs.next()){
              no=Integer.parseInt(rs.getString(1))+1;
         }
}
catch(Exception e){
no=10001;
}
%>
<table border="1" width="30%">
<tr>
<th>Staff Id</th>
<td><input type="text" name="t1" value= <%=no%> readonly></td>
</tr>
<tr>
<th>Name</th>
<td><input type="text" name="t2"></td>
</tr>
<tr>
<th>Contact No</th>
<td><input type="number" name="t3"></td>
</tr>
<tr>
<th> Email</th>
<td><input type="email" name="t4"></td>
</tr>
<tr>
<th>Date Of Birth</th>
<td><input type="date" name="t5"></td>
</tr>
<tr>
<th>Gender</th>
<td><input type="radio" name="t6" value="Male">Male
<input type="radio" name="t6" value="Female">Female
<input type="radio" name="t6" value="Others">Others</td>
</tr>
<tr>
<th>Image</th>
<td><input type="file" name="t7"></td>
</tr>
<tr>
<th>Joining Date</th>
<%
     java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd-MM-yyyy");
    String str=sd.format(new java.util.Date()).toString();
%>
<td><input type="text" name="t8" value=<%= str%> readonly></td>
</tr>
<tr>
<th>Department</th>
<td><select name="t9">
                           <option>---SELECT---</option>
                           <option>Store</option>
                            <option>Sales</option>
                            <option>Purchase</option>
			    <option>Accounts</option>
                             
                 </select>
          </td>
</tr>
<tr>
<th>Password</th>
 <td><input type="password" name="t10"></td>
</tr>
</table>
<input type="submit" value="REGISTER">
</center>
</form>
</body>
</html>


