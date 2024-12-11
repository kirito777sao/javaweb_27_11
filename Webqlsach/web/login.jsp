<%-- 
    Document   : login
    Created on : Dec 11, 2024, 3:45:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="Login" method="POST">
            <div>
                <label>Email:</label>
                <input type="email" name="email">
            </div>
            <div>
                <label>PassWord:</label>
                <input type="pass" name="pass">
            </div>
            <div>
                <input type="submit" value="Login" />
                <input type="reset" value="Reset" />
            </div>
        </form>
    </body>
</html>
