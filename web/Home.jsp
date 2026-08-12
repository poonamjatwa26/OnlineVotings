<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                min-height:100vh;
                font-family:Arial,sans-serif;
                background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
            }

            .dashboard{
                width:94%;
                margin:35px auto;
            }

            .welcome{
                background:linear-gradient(135deg,#0d6efd,#0b5ed7);
                color:white;
                border-radius:18px;
                padding:25px;
                text-align:center;
                box-shadow:0 8px 25px rgba(0,0,0,.20);
                margin-bottom:30px;
            }

            .welcome i{
                font-size:45px;
            }

            .welcome h2{
                margin:8px 0 5px;
                font-weight:bold;
            }

            .welcome p{
                margin:0;
                opacity:.9;
            }

            .menu-card{
                background:white;
                border:none;
                border-radius:18px;
                padding:28px 20px;
                text-align:center;
                height:100%;
                box-shadow:0 8px 25px rgba(0,0,0,.15);
                transition:.3s;
            }

            .menu-card:hover{
                transform:translateY(-7px);
                box-shadow:0 12px 30px rgba(0,0,0,.22);
            }

            .icon{
                width:75px;
                height:75px;
                margin:auto;
                border-radius:50%;
                display:flex;
                align-items:center;
                justify-content:center;
                background:#E3F2FD;
                color:#0d6efd;
                font-size:35px;
            }

            .menu-card h4{
                margin:18px 0 8px;
                font-weight:bold;
                color:#212529;
            }

            .menu-card p{
                color:#6c757d;
                font-size:14px;
                min-height:42px;
            }

            .btn-menu{
                display:inline-block;
                padding:9px 22px;
                border-radius:8px;
                background:#0d6efd;
                color:white;
                text-decoration:none;
                font-weight:bold;
            }

            .btn-menu:hover{
                background:#0b5ed7;
                color:white;
            }

            .success .icon{
                background:#e8f5e9;
                color:#198754;
            }

            .success .btn-menu{
                background:#198754;
            }

            .warning .icon{
                background:#fff3cd;
                color:#f59f00;
            }

            .warning .btn-menu{
                background:#f59f00;
            }

            .info .icon{
                background:#e0f7fa;
                color:#0dcaf0;
            }

            .info .btn-menu{
                background:#0aa2c0;
            }

            .danger .icon{
                background:#fdeaea;
                color:#dc3545;
            }

            .danger .btn-menu{
                background:#dc3545;
            }

            .footer{
                text-align:center;
                margin:30px 0 15px;
                color:#495057;
                font-size:14px;
            }

            @media(max-width:768px){
                .dashboard{
                    width:96%;
                    margin:20px auto;
                }

                .welcome{
                    padding:20px 10px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="dashboard">
            <!-- WELCOME -->
            <div class="welcome">
                <i class="bi bi-speedometer2"></i>
                <h2>Admin Dashboard</h2>
                <p>Online Voting System Management Panel</p>
            </div>

            <div class="row g-4">
                <!-- START VOTING -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card success">
                        <div class="icon">
                            <i class="bi bi-play-circle-fill"></i>
                        </div>
                        <h4>Start Voting</h4>
                        <p>
                            Start and manage the online voting process.
                        </p>
                        <a href="StartVoting.jsp" class="btn-menu">
                            <i class="bi bi-play-fill"></i>
                            Start Voting
                        </a>
                    </div>
                </div>


                <!-- ADD CANDIDATE -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card">
                        <div class="icon">
                            <i class="bi bi-person-plus-fill"></i>
                        </div>
                        <h4>Add Candidate</h4>
                        <p>
                            Add candidate name, party, photo and election symbol.
                        </p>
                        <a href="AddCandidate.jsp" class="btn-menu">
                            <i class="bi bi-plus-circle"></i>
                            Add Candidate
                        </a>
                    </div>
                </div>


                <!-- MANAGE CANDIDATES -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card info">
                        <div class="icon">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <h4>Manage Candidates</h4>
                        <p>
                            View, update and delete registered candidates.
                        </p>
                        <a href="CandidateList.jsp" class="btn-menu">
                            <i class="bi bi-eye-fill"></i>
                            View Candidates
                        </a>
                    </div>
                </div>


                <!-- ELECTION RESULT -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card warning">
                        <div class="icon">
                            <i class="bi bi-bar-chart-fill"></i>
                        </div>
                        <h4>Election Result</h4>
                        <p>
                            View candidate-wise votes and election results.
                        </p>
                        <a href="Result.jsp" class="btn-menu">
                            <i class="bi bi-bar-chart"></i>
                            View Result
                        </a>
                    </div>
                </div>

                <!-- ADD VOTER -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card info">
                        <div class="icon">
                            <i class="bi bi-person-plus-fill"></i>
                        </div>
                        <h4>Add Voter</h4>
                        <p>
                            Register a new voter with voter ID, name, mobile and photo.
                        </p>
                        <a href="Register.jsp" class="btn-menu">
                            <i class="bi bi-person-plus"></i>
                            Add Voter
                        </a>
                    </div>
                </div>

                <!-- MANAGE VOTERS -->
                <div class="col-lg-4 col-md-6">
                    <div class="menu-card">
                        <div class="icon">
                            <i class="bi bi-person-vcard-fill"></i>
                        </div>
                        <h4>Manage Voters</h4>
                        <p>
                            View registered voters and their voting status.
                        </p>
                        <a href="VoterList.jsp" class="btn-menu">
                            <i class="bi bi-person-lines-fill"></i>
                            View Voters
                        </a>
                    </div>
                </div>
            </div>
            <!-- FOOTER -->
            <div class="footer">
                <i class="bi bi-shield-check"></i>
                Online Voting System &copy; 2026 | Admin Panel
            </div>
        </div>
    </body>
</html>
