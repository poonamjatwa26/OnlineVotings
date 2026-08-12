<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Login</title>
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
                font-family:Arial,sans-serif;
                min-height:100vh;
            }

            .card{
                width:390px;
                border:none;
                border-radius:18px;
                overflow:hidden;
                box-shadow:0 10px 25px rgba(0,0,0,.2);
                margin:60px auto 30px;
            }

            .header{
                background:linear-gradient(135deg,#0d6efd,#0b5ed7);
                color:white;
                text-align:center;
                padding:15px;
            }

            .header i{
                font-size:35px;
            }

            .header h2{
                margin-top:8px;
                font-weight:bold;
            }

            .card-body{
                padding:25px;
            }

            h4{
                color:#0d6efd;
                text-align:center;
                font-weight:bold;
            }

            label{
                font-weight:600;
            }

            .input-group-text{
                background:#E3F2FD;
                color:#0d6efd;
            }

            .form-control:focus{
                border-color:#0d6efd;
                box-shadow:none;
            }

            .btn-primary{
                width:100%;
                font-weight:bold;
            }

            a{
                text-decoration:none!important;
                color:#0d6efd;
                font-weight:bold;
            }

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="card">
            <div class="header">
                <i class="bi bi-check2-square"></i>
                <h2>Online Voting System</h2>
                <p>Secure Digital Voting Platform</p>
            </div>

            <div class="card-body">
                <%@include file="message.jsp" %>
                <h4 class="mb-4">Voter Login</h4>
                <form action="LoginProcess.jsp" method="post">
                    <div class="mb-3">
                        <label>Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-envelope-fill"></i>
                            </span>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="Enter Email Address"
                                   required>
                        </div>
                    </div>



                    <div class="mb-4">
                        <label>Password</label>
                        <div class="input-group">

                            <span class="input-group-text">
                                <i class="bi bi-lock-fill"></i>
                            </span>

                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   placeholder="Enter Password"
                                   required>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-box-arrow-in-right"></i>
                        Login
                    </button>
                </form>

                <hr>

                <p class="text-center mb-0">
                   New Voter?
                    <a href="Register.jsp">
                        <i class="bi bi-person-plus-fill"></i>
                        Register Here
                    </a>
                </p>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>