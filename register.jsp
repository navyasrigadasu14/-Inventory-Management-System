<!DOCTYPE html>
<html>
<head>
    <title>Staff Registration</title>
</head>
<body bgcolor="lightblue">

<center>
<h1>Staff Registration</h1>

<form action="register1.jsp" method="post">

<table border="1">

<tr>
    <th>Staff ID</th>
    <td><input type="text" name="t1" required></td>
</tr>

<tr>
    <th>Username</th>
    <td><input type="text" name="t2" required></td>
</tr>

<tr>
    <th>Password</th>
    <td><input type="password" name="t3" required></td>
</tr>

<tr>
    <td colspan="2" align="center">
        <input type="submit" value="Register">
    </td>
</tr>

</table>

</form>

<br>
<a href="index.jsp">Back to Login</a>

</center>
</body>
</html>