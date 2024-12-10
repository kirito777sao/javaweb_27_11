<%-- 
    Document   : xoasp
    Created on : Nov 27, 2024, 4:22:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Xóa sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }
        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            width: 300px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px; }
        button {
            width: 100%;
            padding: 10px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="MuaHang" method="POST">
        <h2 style="text-align: center;">Xóa sản phẩm</h2>
        <input type="hidden" name="action" value="delete">
        <input type="number" name="id" placeholder="ID sản phẩm" required>
        <button type="submit">Xóa sản phẩm</button>
        <br><br>
        <a href="MuaHang" style="text-align: center; display: block;">Quay lại</a>
    </form>
</body>
</html>
