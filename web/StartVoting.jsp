<%@page import="Factory.Test2"%>
<%@page import="java.util.List"%>
<%@page import="Model.Candidate"%>
<%@page import="Factory.Test1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Start Voting</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
              rel="stylesheet">
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                background: linear-gradient(
                    135deg,
                    #E3F2FD,
                    #BBDEFB,
                    #90CAF9
                    );

                font-family: Arial, sans-serif;
                min-height: 100vh;
            }

            .container-box {
                width: 96%;
                margin: 30px auto;
            }

            /* CARD */

            .card {
                border: none;
                border-radius: 18px;
                overflow: hidden;
                background: white;
                box-shadow: 0 8px 25px rgba(0,0,0,.22);
            }

            /* HEADER */

            .head {
                background: linear-gradient(
                    135deg,
                    #0d6efd,
                    #0b5ed7
                    );

                color: white;
                text-align: center;
                padding: 17px;
            }

            .head i {
                font-size: 30px;
            }

            .head h3 {
                margin: 5px 0 0;
                font-weight: bold;
            }

            /* TABLE */

            .table {
                margin-bottom: 0;
            }

            .table th,
            .table td {
                text-align: center;
                vertical-align: middle;
                white-space: nowrap;
            }

            .table thead {
                background: #0d6efd;
                color: white;
            }

            .table tbody tr:hover {
                background: #eef6ff;
            }

            /* PHOTO */

            .photo {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #0d6efd;
                padding: 2px;
                background: white;
            }

            /* SYMBOL */

            .symbol {
                width: 55px;
                height: 55px;
                object-fit: contain;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 4px;
                background: white;
            }

            /* VOTER ID */

            .voter-id {
                background: #e3f2fd;
                color: #0d6efd;
                padding: 6px 10px;
                border-radius: 15px;
                font-weight: bold;
            }

            /* PARTY */

            .party {
                background: #0d6efd;
                color: white;
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 13px;
            }

            /* NOT VOTED */

            .not-voted {
                background: #ffc107;
                color: #212529;
                padding: 6px 10px;
                border-radius: 15px;
                font-weight: bold;
                font-size: 12px;
            }

            /* VOTED */

            .voted {
                background: #198754;
                color: white;
                padding: 6px 12px;
                border-radius: 15px;
                font-weight: bold;
                font-size: 12px;
            }

            /* VOTE BUTTON */

            .vote-btn {
                background: #198754;
                color: white;
                padding: 8px 16px;
                border-radius: 7px;
                text-decoration: none;
                font-weight: bold;
                display: inline-block;
            }

            .vote-btn:hover {
                background: #157347;
                color: white;
            }

            /* INSTRUCTION */

            .instruction {
                margin: 20px;
                padding: 12px 15px;
                background: #E3F2FD;
                border-left: 5px solid #0d6efd;
                border-radius: 8px;
                color: #084298;
            }

            /* MESSAGE */

            .message-box {
                width: 96%;
                margin: 20px auto;
            }

            /* MOBILE */

            @media(max-width:768px) {

                .container-box {
                    width: 98%;
                    margin: 20px auto;
                }

                .photo {
                    width: 50px;
                    height: 50px;
                }

                .symbol {
                    width: 45px;
                    height: 45px;
                }

            }

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <%   
            String voterId = (String) session.getAttribute("voterId");
            String name = (String) session.getAttribute("name");
            String mobile = (String) session.getAttribute("mobile");
            String photo = (String) session.getAttribute("photo");
            boolean hasVoted = false;

            if (voterId != null) {

                hasVoted = Test2.checkVote(voterId);
            }

        %>
        <div class="message-box">
            <%    String msg = request.getParameter("msg");

                if ("success".equals(msg)) {

            %>
            <div class="alert alert-success text-center">
                <i class="bi bi-check-circle-fill"></i>
                <strong>
                    Your vote has been submitted successfully.
                </strong>
            </div>

            <%} else if ("alreadyVoted".equals(msg)) {

            %>
            <div class="alert alert-warning text-center">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <strong>
                    You have already voted.
                </strong>
                One voter can vote only once.
            </div>
            <%} else if ("error".equals(msg)) {

            %>
            <div class="alert alert-danger text-center">
                <i class="bi bi-x-circle-fill"></i>
                <strong>
                    Unable to submit your vote.
                </strong>
            </div>
            <%} else if ("invalid".equals(msg)) {
            %>
            <div class="alert alert-danger text-center">
                Invalid candidate.
            </div>
            <%    }

            %>
        </div>
        <div class="container-box">
            <div class="row g-4">
                <div class="col-lg-5">
                    <div class="card">
                        <div class="head">
                            <i class="bi bi-person-badge-fill"></i>
                            <h3>
                                Voter Details
                            </h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Voter ID</th>
                                        <th>Name</th>
                                        <th>Photo</th>
                                        <th>Mobile</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>
                                            <span class="voter-id">
                                                <%=voterId%>
                                            </span>
                                        </td>

                                        <td>
                                            <strong>
                                                <%=name%>
                                            </strong>
                                        </td>

                                        <td>
                                            <img src="Images/<%=photo%>"
                                                 class="photo"
                                                 alt="Voter Photo">
                                        </td>

                                        <td>
                                            <i class="bi bi-phone text-primary"></i>
                                            <%=mobile%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="card">
                        <div class="head">
                            <i class="bi bi-check2-square"></i>
                            <h3>
                                Candidate Details
                            </h3>
                        </div>

                        <div class="instruction">
                            <i class="bi bi-info-circle-fill"></i>
                            <strong>
                                Voting Instructions:
                            </strong>
                            Select one candidate and click on Vote.
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Party</th>
                                        <th>Symbol</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%

                                        List<Candidate> li = Test1.read();

                                        for (Candidate ob : li) {

                                    %>
                                    <tr>
                                        <td>
                                            <img src="Images/<%=ob.getPhoto()%>"
                                                 class="photo"
                                                 alt="Candidate Photo">
                                        </td>

                                        <td>
                                            <strong>
                                                <%=ob.getName()%>
                                            </strong>
                                        </td>

                                        <td>
                                            <span class="party">
                                                <i class="bi bi-flag-fill"></i>
                                                <%=ob.getParty()%>
                                            </span>
                                        </td>

                                        <td>
                                            <img src="Images/<%=ob.getSymbol()%>"
                                                 class="symbol"
                                                 alt="Party Symbol">
                                        </td>

                                        <td>
                                            <%

                                                if (hasVoted) {

                                            %>
                                            <span class="voted">
                                                <i class="bi bi-check-circle-fill"></i>
                                                Voted
                                            </span>

                                            <%} else {

                                            %>

                                            <span class="not-voted">
                                                <i class="bi bi-exclamation-circle"></i>
                                                Not Voted
                                            </span>

                                            <%    }

                                            %>
                                        </td>

                                        <td>
                                            <%    if (hasVoted) {

                                            %>
                                            <span class="voted">
                                                <i class="bi bi-check-circle-fill"></i>
                                                Vote Submitted
                                            </span>

                                            <%} else {

                                            %>

                                            <a href="VoteCandidate?id=<%=ob.getId()%>"
                                               class="vote-btn"
                                               onclick="return confirm('Are you sure you want to vote for <%=ob.getName()%>?');">
                                                <i class="bi bi-check-circle-fill"></i>
                                                Vote
                                            </a>
                                            <%

                                                }

                                            %>
                                        </td>
                                    </tr>
                                    <%    }

                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>