<%-- 
    Document   : display
    Created on : Dec 11, 2024, 3:26:32 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display</title>
    </head>
    <body>
        <form action="./Search" method="GET">
        <label for="Ten">Nhập tên sách:</label>
        <input type="text" id="Ten" name="Ten" placeholder="Tên sách">
        <input type="submit" value="Tìm kiếm">
    </form>

    
    <h1>Danh sách Sách</h1>
    
    <%
        List<Sach> ls = new ArrayList<>();
        ls = (List<Sach>) request.getAttribute("list");

        if (ls == null || ls.isEmpty()) {
            out.println("<p>Không có sách nào.</p>");
        } else {
    %>
    <table border="1">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Tác giả</th>
            <th>Nhà xuất bản</th>
            <th>Thao tác</th>
        </tr>
        <% for (Sach bs : ls) { %>
        <tr>
            <td><%= bs.getMa() %></td>
            <td><%= bs.getTen() %></td>
            <td><%= bs.getTacgia() %></td>
            <td><%= bs.getNxb() %></td>
            <td>
                <td>
                    <a href="edit.jsp?ma=<%= bs.getMa() %>">Sửa</a> |
                    <form action="Delete" method="post">
                    <input type="hidden" name="ma" value="<%= bs.getMa() %>">
                    <button type="submit">Xóa</button>
                </form>
                </td>
            </td>
        </tr>
        <% } %>
    </table>
    <% } %>

    <a href="add.jsp">Thêm sách mới</a>
    </body>
</html>
