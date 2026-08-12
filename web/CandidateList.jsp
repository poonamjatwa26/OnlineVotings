<%@page import="java.util.List"%>
<%@page import="Factory.Test1"%>
<%@page import="Model.Candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Candidate List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
      rel="stylesheet">
<style>

    body{
        background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
        font-family:Arial,sans-serif;
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

    .table th,
    .table td{
        text-align:center;
        vertical-align:middle;
        white-space:nowrap;
    }

    .photo{
        width:60px;
        height:60px;
        border-radius:50%;
        object-fit:cover;
        border:3px solid #0d6efd;
    }

    .symbol{
        width:55px;
        height:55px;
        object-fit:contain;
        border:1px solid #ddd;
        border-radius:8px;
        padding:4px;
        background:white;
    }

    .party{
        background:#0d6efd;
        color:white;
        padding:6px 12px;
        border-radius:20px;
    }

    .btn{
        margin:2px;
    }

</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container-box">
    <div class="card">
        <div class="card-header">
            <i class="bi bi-person-badge-fill"></i>
            <h2>Candidate List</h2>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Party</th>
                            <th>Symbol</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%

                            List<Candidate> li = Test1.read();

                            for(Candidate ob : li){

                        %>

                        <tr>
                            <td>
                                <%=ob.getId()%>
                            </td>
                            <td>
                                <img src="Images/<%=ob.getPhoto()%>"
                                     class="photo">
                            </td>
                            <td>
                                <%=ob.getName()%>
                            </td>
                            <td>
                                <%=ob.getAge()%>
                            </td>
                            <td>
                                <%=ob.getGender()%>
                            </td>
                            <td>
                                <%=ob.getMobile()%>
                            </td>
                            <td>
                                <span class="party">
                                    <%=ob.getParty()%>
                                </span>
                            </td>
                            <td>
                                <img src="Images/<%=ob.getSymbol()%>"
                                     class="symbol">
                            </td>
                            <td>
                                <%=ob.getAddress()%>
                            </td>
                            <td>
                                <a href="EditCandidate.jsp?id=<%=ob.getId()%>"
                                   class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil-square"></i>
                                </a>

                                <a href="DeleteCandidate.jsp?id=<%=ob.getId()%>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this candidate?');">
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
