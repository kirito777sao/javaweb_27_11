<%-- 
    Document   : add
    Created on : Dec 11, 2024, 5:16:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD</title>
    </head>
    <body>
        <h1>ADD PRODUCTS</h1>
        <form action="Add" method="POST">
        <h2 style="text-align: center;">Thêm sản phẩm</h2>
        <input type="number" name="ma" placeholder="Ma" required>
        <input type="text" name="ten" placeholder="Ten" required>
        <input type="text" name="tg" placeholder="Tac Gia" required>
        <input type="text" name="nxb" placeholder="NXB" required>
        <button type="submit">Thêm sản phẩm</button>
        <br><br>
        <a href="MuaHang" style="text-align: center; display: block;">Quay lại</a>
    </form>
    </body>
</html>
