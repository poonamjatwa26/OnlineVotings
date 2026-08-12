<%-- 
    Document   : Navbar
    Created on : 20 Jul, 2026
    Author     : poona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Online Voting System Navbar</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <style>
            .navbar{
                background: linear-gradient(90deg,#0d6efd,#0dcaf0);
                box-shadow:0 3px 10px rgba(0,0,0,.2);
            }

            .navbar-brand{
                color:white !important;
                font-size:26px;
                font-weight:bold;
            }

            .nav-link{
                color:white !important;
                font-size:17px;
                margin-left:20px;
                transition:.3s;
            }

            .nav-link:hover{
                background:white;
                color:#0d6efd !important;
                border-radius:5px;
                padding:8px 15px;
            }


            /* Login Button */
            .btn-login{
                background:white;
                color:#0d6efd;
                font-weight:bold;
                border:none;
                padding:8px 20px;
                border-radius:20px;
            }

            .btn-login:hover{
                background:#0b5ed7;
                color:white;
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="Home.jsp">
                    <i class="fa-solid fa-check-to-slot"></i>
                    Online Voting System
                </a>

                <!-- Mobile Toggle -->
                <button class="navbar-toggler" 
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <!-- Left Side Menu -->
                    <ul class="navbar-nav me-auto">
                    </ul>
                    <!-- Right Side Login -->
                    <div class="collapse navbar-collapse" id="menu">

                        <ul class="navbar-nav ms-auto">
                            <div class="d-flex">
                                <%
                                    String Username = (String) session.getAttribute("name");

                                    if (Username == null) {

                                %>
                                <a href="login.jsp" class="btn btn-login">
                                    <i class="fa-solid fa-right-to-bracket"></i>
                                    Login
                                </a>
                                <%                      } else if ("Admin".equalsIgnoreCase(Username)) {

                                %>

                                <li class="nav-item">
                                    <a class="nav-link active"><i class="bi bi-person-circle"></i> <%=Username%></a>
                                </li> 
                                <li class="nav-item">
                                    <a class="nav-link active" href="logout.jsp"><i class="bi bi-box-arrow-left"></i> logout</a>
                                </li> 
                                <%

                                } else {

                                %>

                                <li class="nav-item">
                                    <a class="nav-link active"><i class="bi bi-person-circle"> </i>  <%=Username%></a>
                                </li> 
                                <li class="nav-item">
                                    <a class="nav-link active" href="logout.jsp"><i class="bi bi-box-arrow-left"></i> logout</a>
                                </li> 
                                <%

                                    }
                                %>   
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>