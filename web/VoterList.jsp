<%--
    Document   : VoterList
    Created on : 3 Aug, 2026
    Author     : poona
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Register"%>
<%@page import="Factory.Test"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Voter List</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
                font-family:Arial, sans-serif;
            }

            .container-box{
                width:95%;
                margin:30px auto;
            }

            .card{
                border:none;
                border-radius:18px;
                overflow:hidden;
                box-shadow:0 10px 25px rgba(0,0,0,.25);
            }

            .card-header{
                background:linear-gradient(135deg,#0d6efd,#0b5ed7);
                color:#fff !important;
                text-align:center;
                padding:18px;
            }

            .card-header i{
                font-size:35px;
            }

            .card-header h2{
                margin-top:8px;
                font-weight:bold;
            }

            .table{
                margin-bottom:0;
            }

            .table thead{
                background:#0d6efd;
                color:white;
            }

            .table th{
                text-align:center;
                vertical-align:middle;
                white-space:nowrap;
            }

            .table td{
                text-align:center;
                vertical-align:middle;
            }

            .table tbody tr:hover{
                background:#f1f7ff;
            }

            .photo{
                width:70px;
                height:70px;
                border-radius:50%;
                object-fit:cover;
                border:2px solid #0d6efd;
            }

            .btn{
                margin:2px;
            }

            @media(max-width:768px){
                .photo{
                    width:50px;
                    height:50px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-box">
            <div class="card">
                <div class="card-header">
                    <i class="bi bi-people-fill"></i>
                    <h2>Voter List</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>DOB</th>
                                    <th>Mobile</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Voter ID</th>
                                    <th>Photo</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Register> li = Test.read();

                                    for (Register ob : li) {
                                %>
                                <tr>
                                    <td><%=ob.getId()%></td>
                                    <td><%=ob.getName()%></td>
                                    <td><%=ob.getDob()%></td>
                                    <td><%=ob.getMobile()%></td>
                                    <td><%=ob.getEmail()%></td>
                                    <td><%=ob.getPassword()%></td>
                                    <td><%=ob.getVoterId()%></td>
                                    <td>
                                        <img src="Images/<%=ob.getPhoto()%>" class="photo">
                                    </td>

                                    <td><%=ob.getAddress()%></td>

                                    <td>

                                        <a href="EditRegister.jsp?id=<%=ob.getId()%>"
                                           class="btn btn-warning btn-sm">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>

                                        <a href="DeleteRegister.jsp?id=<%=ob.getId()%>"
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('Are you sure to delete?')">
                                            <i class="bi bi-trash"></i>
                                        </a>

                                    </td>

                                </tr>

                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>