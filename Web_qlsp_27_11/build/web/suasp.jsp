<%-- 
    Document   : suasp
    Created on : Nov 27, 2024, 4:21:42 PM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa sản phẩm</title>
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
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="MuaHang" method="POST">
        <h2 style="text-align: center;">Sửa sản phẩm</h2>
        <input type="hidden" name="action" value="edit">
        
        <%
            // Lấy thông tin sản phẩm từ request (nếu có)
            String idStr = request.getParameter("id");
            String tensp = request.getParameter("tensp");
            String giaStr = request.getParameter("gia");
        %>
        
        <input type="number" name="id" placeholder="ID sản phẩm" 
               value="<%= idStr != null ? idStr : "" %>" required readonly>
        
        <input type="text" name="tensp" placeholder="Tên mới" 
               value="<%= tensp != null ? tensp : "" %>" required>
        
        <input type="number" name="gia" step="0.01" placeholder="Giá mới" 
               value="<%= giaStr != null ? giaStr : "" %>" required>
        
         <button type="submit">Cập nhật sản phẩm</button>
    </form>
</body>
</html>