<%-- 
    Document   : AddCandidate
    Created on : 21 Jul, 2026
    Author     : poona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Candidate</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>

            *{margin:0;padding:0;box-sizing:border-box;}

            body{
                background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);
                font-family:Arial,sans-serif;
            }

            .card{
                width:750px;
                margin:30px auto;
                border:none;
                border-radius:18px;
                overflow:hidden;
                box-shadow:0 10px 25px rgba(0,0,0,.2);
            }

            .header{
                background:linear-gradient(135deg,#0d6efd,#0b5ed7);
                color:white;
                text-align:center;
                padding:15px;
            }

            .header i{font-size:35px;}
            .header h2{font-weight:bold;}

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

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="card">
            <div class="header">
                <i class="bi bi-person-badge-fill"></i>
                <h2>Online Voting System</h2>
                <p>Candidate Registration</p>
            </div>
            <div class="card-body">
                <%@include file="message.jsp" %>
                <h4 class="mb-4">Add Candidate</h4>
                <form action="CandidateSaves" method="post" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Candidate Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                <input type="text" name="name" class="form-control" placeholder="Enter Candidate Name">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Age</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                                <input type="number" name="age" class="form-control" placeholder="Enter Age">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Gender</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>

                                <select name="gender" class="form-control">
                                    <option value="">Select Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Mobile Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                                <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile Number">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                                <input type="email" name="email" class="form-control" placeholder="Enter Email Address">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Party Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-flag-fill"></i></span>
                                <input type="text" name="party" class="form-control" placeholder="Enter Party Name">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Party Symbol</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-image-fill"></i></span>
                                <input type="file" name="symbol" class="form-control" accept="image/*">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Candidate Photo</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-square"></i></span>
                                <input type="file" name="photo" class="form-control" accept="image/*">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label>Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-geo-alt-fill"></i></span>
                                <textarea name="address" class="form-control" rows="3" placeholder="Enter Address"></textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="row g-2">

                                <div class="col-md-6">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="bi bi-person-plus-fill"></i>
                                        Add Candidate
                                    </button>
                                </div>

                                <div class="col-md-6">
                                    <button type="reset" class="btn btn-secondary w-100">
                                        <i class="bi bi-arrow-clockwise"></i>
                                        Reset
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>