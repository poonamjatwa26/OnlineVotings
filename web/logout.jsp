<%-- 
    Document   : Logout
    Created on : 4 Aug, 2026, 1:13:49 PM
    Author     : poona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
         <%
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
