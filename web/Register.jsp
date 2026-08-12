<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>

            *{margin:0;padding:0;box-sizing:border-box;}

            body{
                background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
                font-family:Arial,sans-serif;
                min-height:100vh;
            }

            .card{
                width:700px;
                border:none;
                border-radius:18px;
                overflow:hidden;
                box-shadow:0 10px 25px #0003;
                margin:30px auto;
            }

            .header{
                background:linear-gradient(135deg,#0d6efd,#0b5ed7);
                color:white;
                text-align:center;
                padding:15px;
            }

            .header i{font-size:35px;}
            .header h2{font-weight:bold;margin-top:5px;}

            .card-body{padding:25px;}

            h4{
                color:#0d6efd;
                text-align:center;
                font-weight:bold;
            }

            label{font-weight:bold;}

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
                font-weight:bold;
                color:#0d6efd;
            }

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="card">
            <div class="header">
                <i class="bi bi-person-check-fill"></i>
                <h2>Online Voting System</h2>
                <p>Voter Registration Portal</p>
            </div>

            <div class="card-body">
                <%@include file="message.jsp" %>
                <h4 class="mb-4">Create Voter Account</h4>
                <form action="save" method="post" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Full Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person"></i></span>
                                <input type="text" name="name" class="form-control" placeholder="Enter Name">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label>Date Of Birth</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                                <input type="date" name="dob" class="form-control">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label>Mobile Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                <input type="text" name="mobile" class="form-control" placeholder="Mobile Number">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email" name="email" class="form-control" placeholder="Email Address">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input type="password" name="password" class="form-control" placeholder="Password">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label>Voter ID</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-vcard"></i></span>
                                <input type="text" name="voterId" class="form-control" placeholder="Enter Voter ID">
                            </div>
                        </div>


                        <div class="col-md-12">
                            <label>Profile Photo</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-image"></i></span>
                                <input type="file" name="photo" class="form-control">
                            </div>
                        </div>


                        <div class="col-md-12">
                            <label>Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                <textarea name="address" class="form-control" rows="3" placeholder="Enter Address"></textarea>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <button class="btn btn-primary">
                                <i class="bi bi-person-plus"></i> Register
                            </button>
                        </div>
                    </div>
                </form>

                <hr>

                <p class="text-center mb-0">
                    Already have an account?
                    <a href="login.jsp">
                        <i class="bi bi-box-arrow-in-right"></i> Login Here
                    </a>
                </p>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>