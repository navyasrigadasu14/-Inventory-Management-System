<%@page import="java.sql.*"%>

<%

if(request.getParameter("update")!=null)
{

	int staffid=Integer.parseInt(request.getParameter("t1"));
	String stname= request.getParameter("t2");
	String phno= request.getParameter("t3");
	String email= request.getParameter("t4");
	String dob= request.getParameter("t5");
	String gender = request.getParameter("t6");
	String img = request.getParameter("t7");
	String jdate=request.getParameter("t8");
	String dname = request.getParameter("t9");
	String pwd=request.getParameter("t10");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "YOUR_PASSWORD");
	PreparedStatement ps= con.prepareStatement("update staff set name=?,phno=?,email=?,dob=?,gender=?,img=?,jdate=?,dname=?,pwd=? where staffid=?");
	ps.setString(1,stname);
	ps.setString(2,phno);
	ps.setString(3,email);
	ps.setString(4,dob);
	ps.setString(5,gender);
	ps.setString(6,img);
	ps.setString(7,jdate);
	ps.setString(8,dname);
	ps.setString(9,pwd);
	ps.setInt(10,staffid);

	int x=ps.executeUpdate();
	ps.close();
	con.close();
	if(x>0){
	response.sendRedirect("viewstaff.jsp");
	}
	else{
	out.println("Update failed");
	}
}
	catch(Exception e)
	{
		out.println(e);
	}
}

%>

<html>
<body bgcolor="wheat" text="brown">
<center><h1>Modify User</h1>
<form method="post">
<table border="1">
<tr>
<th>Staff Id</th>
<td><input type="text" name="t1" ></td>
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
<input type="submit" name="update" value="Modify">
</form>
</center>
</body>
</html>