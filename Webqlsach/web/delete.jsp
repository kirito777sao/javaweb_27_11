<%-- 
    Document   : delete
    Created on : Dec 11, 2024, 8:26:31 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>List Books Search</h1>
        
        <%
            List<Sach> ls = new ArrayList<>();
            ls = (List<Sach>) request.getAttribute("list");
            out.print("<table border = 3>");
            out.print("<tr>");
            out.print("<th>ID</th>");
            out.print("<th>Name</th>");
            out.print("<th>TacGia</th>");
            out.print("<th>NXB</th>");
            out.print("</tr>");
            for (Sach bs : ls){
                out.print("<tr>");
                out.print("<td>"+bs.getMa()+"</td>");
                out.print("<td>"+bs.getTen()+"</td>");
                out.print("<td>"+bs.getTacgia()+"</td>");
                out.print("<td>"+bs.getNxb()+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        %>
    </body>
</html>
