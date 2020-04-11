<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Update Records</title>
</head>

<body>

	    <nav nav class="navbar navbar-expand-lg navbar-light">
        <span style="margin-left:2%;">
            <a class="navbar-brand" style="text-align: center" href="#">
                <img src="heart.svg" width="30" height="30" alt="Appolo"> Appolo
            </a>
        </span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <span style="margin-left:84%;">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="AfterLogin.jsp">Home</a>
                    <a class="nav-item nav-link"  href = "Logout.jsp">Signout</a>
                </div>
            </span>
    </nav>
    <div class="container">
        <div class="jumbotron" style="margin-top:8%">
           <h2>Patient records present in databse</h2>
           <p>Upadte records if necessary...</p><br>
           	  <div class="container">	
           	  	 <form action="BookAppointment.jsp">
       				<div class="form-group">
                        <label>Patient Id</label>
                        <input type ="text" class="form-control"  name="pid" value=<%= request.getAttribute("pid").toString()%> required>
                    </div>
                    <div class="form-group">
                        <label>Patient Name</label>
                        <input type="text" class="form-control" name="patname" value=<%= request.getAttribute("name").toString()%> required>
                    </div>
                    <div class="form-group">
                        <label>Problem</label>
                        <input type="text" class="form-control" name="prob"  required>
                        <p>Map the problem area of the patient to the doctor specialized in that field<br>
      					i.e General,Orthopedic,Diabetology,Pediatric...
						</p>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
       		</form>		
        </div>
    
    
    
<script src=" https://code.jquery.com/jquery-3.2.1.slim.min.js " integrity="
                    sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN "
        crossorigin=" anonymous "></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js " integrity="
                    sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q "
        crossorigin=" anonymous "></script>
    <script src=" https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js " integrity="
                    sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl "
        crossorigin=" anonymous "></script>
 
</body>

</html>