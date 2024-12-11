<%-- 
    Document   : edit
    Created on : Dec 11, 2024, 5:26:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Edit" method="post">
        <h2>Sửa sản phẩm</h2>
        <%
            String id = request.getParameter("ma");
            String ten = request.getParameter("ten");
            String tacGia = request.getParameter("tacgia");
            String nxb = request.getParameter("nxb");
        %>
        <input type="hidden" name="ma" placeholder="ID sản phẩm" value="<%= id != null ? id : "" %>" required readonly>
        <input type="text" name="ten" placeholder="Tên" value="<%= ten != null ? ten : "" %>" required>
        <input type="text" name="tacgia" placeholder="Tác giả" value="<%= tacGia != null ? tacGia : "" %>" required>
        <input type="text" name="nxb" placeholder="Nhà xuất bản" value="<%= nxb != null ? nxb : "" %>">
        <button type="submit">Cập nhật</button>
    </form>
    </body>
</html>
