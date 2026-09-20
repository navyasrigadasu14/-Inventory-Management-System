<html>
<body bgcolor="grey" text="white">
<center><h1>
<%@page import="java.sql.*"%>
<%
try{
	String s1=request.getParameter("t1");
	String s2=request.getParameter("t2");
	String s3=request.getParameter("t3");
	String s4=request.getParameter("t4");
	String s5=request.getParameter("t5");
	String s6=request.getParameter("t6");
	String s7=request.getParameter("t7");
	String s8=request.getParameter("t8");
	String s9=request.getParameter("t9");
	String s10=request.getParameter("t10");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/testdb","root","YOUR_PASSWORD");
	PreparedStatement pst=con.prepareStatement("insert into staff values(?,?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1,s1);
	pst.setString(2,s2);
	pst.setString(3,s3);
	pst.setString(4,s4);
	pst.setString(5,s5);
	pst.setString(6,s6);
	pst.setString(7,s7);
	pst.setString(8,s8);
	pst.setString(9,s9);
	pst.setString(10,s10);
	pst.setString(11,"Active");
int x=pst.executeUpdate();
out.println(s1+"Registration Successfull");
pst.close();
con.close();
}
catch(Exception e){
System.out.println(e);
}
%>
<br><a href='addstaff.jsp'> click here </a> to back <br>
</body>
</html>
	        