<%@page import="Factory.Test1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Delete Candidate</title>
        <style>
            body{
                background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
                font-family:Arial;
                text-align:center;
                padding-top:70px;
                min-height:100vh;
            }

            .card{
                background:white;
                width:320px;
                margin:auto;
                padding:22px;
                border-radius:16px;
                box-shadow:0 8px 25px rgba(0,0,0,.20);
            }

            h2{
                color:#0d6efd;
                font-size:20px;
            }

            p{
                color:#555;
                font-size:14px;
            }

            a{
                background:#0d6efd;
                color:white;
                padding:9px 20px;
                text-decoration:none;
                border-radius:20px;
                display:inline-block;
                font-size:14px;
                font-weight:bold;
            }
        </style>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));

            int i = Test1.delete(id);

            if(i == 0){
        %>
        <div class="card">
            <h2>Candidate Deleted Successfully!</h2>
            <p>
                Candidate has been deleted successfully.
            </p>
            <a href="CandidateList.jsp">
                View Candidates
            </a>
        </div>

        <%
            }else{
        %>

        <div class="card">
            <h2>Candidate Not Deleted!</h2>
            <p>
                Candidate could not be deleted.
            </p>
            <a href="CandidateList.jsp">
                View Candidates
            </a>
        </div>
        <%
            }
        %>
    </body>
</html>