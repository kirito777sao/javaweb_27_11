<%-- 
    Document   : hienthisanpham
    Created on : Nov 27, 2024, 2:09:03 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 3px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .action-btn {
            display: inline-block;
            padding: 6px 10px;
            margin: 0 5px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .global-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .global-buttons a {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        input[type="text"]{
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
    </style>
    <script>
        function confirmDelete(id, tensp) {
            if (confirm('Bạn có chắc chắn muốn xóa sản phẩm "' + tensp + '" không?')) {
                // Gửi request xóa
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = 'MuaHang';
                
                var actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'delete';
                form.appendChild(actionInput);
                
                var idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'id';
                idInput.value = id;
                form.appendChild(idInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</head>
<body>
    <h1 style="text-align: center; font-family: time-new-roman; font-size: 50px">Danh sách sản phẩm</h1>
    
    <form action="MuaHang" method="get">
        <input type="text" name="search" placeholder="Tìm kiếm sản phẩm..." value="<%= (String)request.getSession().getAttribute("searchKeyword") %>"> 
        <input type="submit" value="Tìm kiếm">
    </form>
    
    <%
        // Lấy danh sách sản phẩm từ session
        List<Product> productList = (List<Product>) session.getAttribute("products");
        
        // Nếu productList null, khởi tạo một list rỗng
        if (productList == null) {
            productList = new ArrayList<>();
        }
    %>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Kiểm tra và hiển thị danh sách sản phẩm
            if (!productList.isEmpty()) {
                for (Product product : productList) { 
            %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getTensp() %></td>
                    <td><%= String.format("%,.2f", product.getGia()) %> VND</td>
                    <td>
                        <!-- Nút sửa -->
                        <a href="suasp.jsp?id=<%= product.getId() %>&tensp=<%= product.getTensp() %>&gia=<%= product.getGia() %>" 
                           class="action-btn edit-btn">Sửa</a>
                        
                        <!-- Nút xóa -->
                        <a href="#" 
                           onclick="confirmDelete(<%= product.getId() %>, '<%= product.getTensp() %>')" 
                           class="action-btn delete-btn">Xóa</a>
                    </td>
                </tr>
            <% 
                } 
            } else {
            %>
                <tr>
                    <td colspan="4">Không có sản phẩm nào</td>
                </tr>
            <% 
            }
            %>
        </tbody>
    </table>

    <div class="global-buttons">
        <a href="themspss.jsp">Thêm sản phẩm mới</a>
    </div>
</body>
</html>