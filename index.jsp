<!DOCTYPE html>
<html>
<head>
    <title>Inventory Management System</title>
</head>

<body bgcolor="pink" text="black">

<center>
    <h1>INVENTORY MANAGEMENT SYSTEM</h1>
</center>

<form action="verify.jsp" method="post">

    <table border="1"
           style="position:absolute; top:150px; left:600px;">

        <tr>
            <th>User Type</th>
            <td>
                <select name="t1" required>
                    <option value="">---SELECT---</option>
                    <option value="Admin">Admin</option>
                    <option value="Staff">Staff</option>
                </select>
            </td>
        </tr>

        <tr>
            <th>User Name</th>
            <td>
                <input type="text" name="t2" required>
            </td>
        </tr>

        <tr>
            <th>Password</th>
            <td>
                <input type="password" name="t3" required>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Login">
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <a href="register.jsp">Register</a>
            </td>
        </tr>

    </table>

</form>

<img src="IMS.png"
     width="300"
     height="300"
     style="position:absolute; top:100px; left:200px;">

</body>
</html>