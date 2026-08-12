<%-- 
    Document   : AddCandidate
    Created on : 21 Jul, 2026
    Author     : poona
--%>

<%@page import="Model.Candidate"%>
<%@page import="Factory.Test1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Candidate</title>
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
                <p>Candidate Registration Edit Details</p>
            </div>
            <div class="card-body">
                <h4 class="mb-4">Edit Candidate</h4>
                <%                    int id = Integer.parseInt(request.getParameter("id"));
                    Candidate ob = Test1.edit(id);
                %>
                <form action="CandidateUpdate" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<%=ob.getId()%>">

                    <input type="hidden" name="oldsymbol" value="<%=ob.getSymbol()%>">
                    <input type="hidden" name="oldphoto" value="<%=ob.getPhoto()%>">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Candidate Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                <input type="text" name="name" class="form-control" value="<%=ob.getName()%>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Age</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                                <input type="number" name="age" class="form-control" value="<%=ob.getAge()%>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Gender</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>
                                <select name="gender" class="form-control" value="<%=ob.getGender()%>">
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Mobile Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                                <input type="text" name="mobile" class="form-control" value="<%=ob.getMobile()%>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                                <input type="email" name="email" class="form-control" value="<%=ob.getEmail()%>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label>Party Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-flag-fill"></i></span>
                                <input type="text" name="party" class="form-control" value="<%=ob.getParty()%>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label> Current Book Cover</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-image-fill"></i></span>
                                <img src="Images/<%=ob.getSymbol()%>" width="100">
                            </div>
                        </div>    

                        <div  class="col-md-6">
                             <label> Change Book Cover</label>
                            <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-image-fill"></i></span>
                            <input class="form-control" class="form-control" type="file" name="symbol">
                            </div>
                        </div>    


                        <div class="col-md-6">
                            <label>Current Candidate Photo</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-square"></i></span>
                                <img src="Images/<%=ob.getPhoto()%>" width="100">
                            </div>
                        </div>
                                
                        <div class="col-md-6">
                            <label>Change Candidate Photo</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person-square"></i></span>
                                <input class="form-control" class="form-control" type="file" name="photo">
                            </div>
                        </div>        

                        <div class="col-md-12">
                            <label>Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-geo-alt-fill"></i></span>
                                <input name="address" class="form-control" rows="3" value="<%=ob.getAddress()%>">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="bi bi-person-plus-fill"></i>
                                        Update Candidate
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