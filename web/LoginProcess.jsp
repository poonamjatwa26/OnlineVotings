<%-- 
    Document   : LoginProcess
    Created on : 24 Jul, 2026, 4:32:57 PM
    Author     : poona
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevote", "root", "");
            PreparedStatement psmt = con.prepareStatement("select * from register where email=? and password=?");
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                HttpSession s = request.getSession();
                // Database se values lena
                String name = rs.getString("name");
                String mobile = rs.getString("mobile");
                String userEmail = rs.getString("email");
                String userPassword = rs.getString("password");
                String voterId = rs.getString("voterId");
                String photo = rs.getString("photo");
                String address = rs.getString("address");

                s.setAttribute("name", name);
                s.setAttribute("mobile", mobile);
                s.setAttribute("email", userEmail);
                s.setAttribute("password", userPassword);
                s.setAttribute("voterId", voterId);
                s.setAttribute("photo", photo);
                s.setAttribute("address", address);

                // Admin login
                if (userEmail.equals("abc@gmail.com")
                        && userPassword.equals("abc@123")) {

                    response.sendRedirect("Home.jsp");
                    return;

                } else {

                    response.sendRedirect("StartVoting.jsp");
                    return;
                }

            } else {

                session.setAttribute("message", "Wrong Email and Password");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
