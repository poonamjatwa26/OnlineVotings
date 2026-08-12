<%@page import="Factory.Test2"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Candidate"%>
<%@page import="Factory.Test1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Voting Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
            font-family: Arial,sans-serif;
            min-height: 100vh;
        }

        .result-card {
            width: 96%;
            max-width: 1100px;
            margin: 35px auto;
            border: 0;
            border-radius: 18px;
            box-shadow: 0 10px 25px rgba(0,0,0,.20);
            overflow: hidden;
            background: white;
        }

        .header {
            background: linear-gradient(135deg,#0d6efd,#0b5ed7);
            color: white;
            text-align: center;
            padding: 20px;
        }

        .header i {
            font-size: 38px;
        }

        .header h2 {
            margin: 5px 0;
            font-weight: bold;
        }

        .header p {
            margin: 0;
            font-size: 14px;
        }

        .card-body {
            padding: 25px;
        }

        .box {
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,.12);
            padding: 18px;
            text-align: center;
            background: white;
            height: 100%;
            border-top: 4px solid #0d6efd;
        }

        .box i {
            font-size: 30px;
            color: #0d6efd;
            margin-bottom: 5px;
        }

        .box h6 {
            color: #555;
            margin: 5px 0;
            font-weight: bold;
        }

        .box b {
            font-size: 22px;
            color: #0d6efd;
        }

        h4 {
            color: #0d6efd;
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }

        .table {
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
        }

        .table th {
            background: #0d6efd;
            color: white;
            text-align: center;
            vertical-align: middle;
        }

        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table tbody tr:hover {
            background: #eef6ff;
        }

        .win {
            background: #198754;
            color: white;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 20px;
            display: inline-block;
        }

        .runner {
            background: #ffc107;
            color: #212529;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 20px;
            display: inline-block;
        }

        .participated {
            background: #6c757d;
            color: white;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 20px;
            display: inline-block;
        }

        .rank {
            background: #e3f2fd;
            color: #0d6efd;
            font-weight: bold;
            padding: 6px 10px;
            border-radius: 50%;
        }

        .vote-count {
            font-weight: bold;
            color: #198754;
            font-size: 16px;
        }

        .print-btn {
            background: #0d6efd;
            border: none;
            font-weight: bold;
            padding: 11px;
        }

        .print-btn:hover {
            background: #0b5ed7;
        }

        @media print {
            body {
                background: white;
            }

            .result-card {
                width: 100%;
                margin: 0;
                box-shadow: none;
            }

            .print-btn,nav {
                display: none !important;
            }
        }

        @media(max-width:768px) {
            .result-card {
                width: 98%;
                margin: 20px auto;
            }

            .card-body {
                padding: 15px;
            }

            .table {
                font-size: 13px;
            }
        }
    </style>
</head>

<body>
    <%@include file="navbar.jsp" %>

    <%
        List<Candidate> candidates = Test1.read();
        int totalVotes = Test2.getTotalVotes();
        int totalCandidates = candidates.size();
        int highestVotes = 0;
        Candidate winner = null;

        for (Candidate c : candidates) {
            int votes = Test2.getVoteCount(c.getId());
            if (votes > highestVotes) {
                highestVotes = votes;
                winner = c;
            }
        }
    %>

    <div class="result-card">
        <div class="header">
            <i class="bi bi-trophy-fill"></i>
            <h2>Online Voting System</h2>
            <p>Election Result</p>
        </div>

        <div class="card-body p-4">
            <div class="row g-3 mb-4">
                <div class="col-lg-3 col-md-6">
                    <div class="box">
                        <i class="bi bi-people-fill"></i>
                        <h6>Total Votes</h6>
                        <b><%=totalVotes%></b>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="box">
                        <i class="bi bi-person-fill"></i>
                        <h6>Candidates</h6>
                        <b><%=totalCandidates%></b>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="box">
                        <i class="bi bi-bar-chart-fill"></i>
                        <h6>Highest Votes</h6>
                        <b><%=highestVotes%></b>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="box">
                        <i class="bi bi-trophy-fill"></i>
                        <h6>Winner</h6>
                        <b>
                            <%
                                if (winner != null) {
                            %>
                                <%=winner.getName()%>
                            <%
                                } else {
                            %>
                                No Winner
                            <%
                                }
                            %>
                        </b>
                    </div>
                </div>
            </div>

            <h4 class="mb-3">
                <i class="bi bi-bar-chart-fill"></i> Voting Result
            </h4>

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Photo</th>
                            <th>Candidate</th>
                            <th>Party</th>
                            <th>Votes</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            List<Candidate> sortedCandidates = new ArrayList<Candidate>(candidates);

                            for (int i = 0; i < sortedCandidates.size(); i++) {
                                for (int j = i + 1; j < sortedCandidates.size(); j++) {
                                    int vote1 = Test2.getVoteCount(sortedCandidates.get(i).getId());
                                    int vote2 = Test2.getVoteCount(sortedCandidates.get(j).getId());

                                    if (vote2 > vote1) {
                                        Candidate temp = sortedCandidates.get(i);
                                        sortedCandidates.set(i, sortedCandidates.get(j));
                                        sortedCandidates.set(j, temp);
                                    }
                                }
                            }

                            int rank = 1;

                            for (Candidate c : sortedCandidates) {
                                int votes = Test2.getVoteCount(c.getId());
                        %>

                        <tr>
                            <td>
                                <span class="rank"><%=rank%></span>
                            </td>

                            <td>
                                <img src="Images/<%=c.getPhoto()%>"
                                     style="width:55px;height:55px;object-fit:cover;border-radius:50%;border:3px solid #0d6efd;"
                                     alt="Candidate">
                            </td>

                            <td>
                                <strong><%=c.getName()%></strong>
                            </td>

                            <td><%=c.getParty()%></td>

                            <td>
                                <span class="vote-count"><%=votes%></span>
                            </td>

                            <td>
                                <%
                                    if (rank == 1 && votes > 0) {
                                %>
                                    <span class="win">
                                        <i class="bi bi-trophy-fill"></i> Winner
                                    </span>
                                <%
                                    } else if (rank == 2 && votes > 0) {
                                %>
                                    <span class="runner">
                                        <i class="bi bi-award-fill"></i> Runner Up
                                    </span>
                                <%
                                    } else {
                                %>
                                    <span class="participated">Participated</span>
                                <%
                                    }
                                %>
                            </td>
                        </tr>

                        <%
                                rank++;
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <div align="center">
                <button class="btn btn-primary print-btn mb-4" onclick="window.print();">
                    <i class="bi bi-printer-fill"></i> Print Result
                </button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

