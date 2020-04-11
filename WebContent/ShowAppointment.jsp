<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Your Appointment</title>
</head>
<body>

    <nav nav class="navbar navbar-expand-lg navbar-light">
        <span style="margin-left:2%;">
            <a class="navbar-brand" style="text-align: center" href="#">
                <img src="heart.svg" width="30" height="30" alt="Appolo"> Appolo
            </a>
        </span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <span style="margin-left:84%;">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="AfterLogin.jsp">Home</a>
                    <a class="nav-item nav-link"  href = "Logout.jsp">Signout</a>
                </div>
            </span>
        </div>
    </nav>
    <%
		try{
			RequestDispatcher rd;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
			String query = "select slots from doctors where docid = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, request.getParameter("docid")); 
			ResultSet rs = ps.executeQuery();
			int slots = 0;
			while(rs.next()){
				slots = rs.getInt(1); 
				break;
			}
			if(slots==0){
				slots = 0;
			}else{
				slots -= 1;
			}
			
		   
			query = "update doctors set slots = ? where docid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, String.valueOf(slots));
			ps.setString(2, request.getParameter("docid"));
			ps.executeUpdate();
			
			query = "insert into appointments values (?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1,request.getParameter("dname"));
			ps.setString(2, request.getParameter("pname"));
			ps.setString(3, request.getParameter("date"));
			ps.setString(4, request.getParameter("time"));
			ps.executeUpdate();
		
		
	%>
    
    <div class="container">
        <div class="jumbotron" style="margin-top:8%">
        	<h2>Your Appointment</h2><br>
        	<hr>
            <div class="container">
            	<span><p>Doctor : <%= request.getParameter("dname") %> </p></span>
            	<span><p>Patient : <%= request.getParameter("pname") %> </p></span>
            	<span><p>Date : <%= request.getParameter("date") %> </p></span>
            	<span><p>Timings : <%= request.getParameter("time") %> </p></span>
            </div>
            <hr>
            <br>
            <button type="submit" class="btn btn-primary">Print</button>
          <br><br>
            <hr>
            <br>
            <h2>Appointments</h2><br><br>
            	<table border="1" width="800" align="center">
                    <tr bgcolor="00FF7F">
                    	<th><b>DOCTOR</b></th>
                        <th><b>PATIENT</b></th>
                        <th><b>DATE</b></th>
                        <th><b>TIME</b></th>
                    </tr>
            	
            <%	
            	
	            	
	           		 query = "select * from appointments";
			         ps = con.prepareStatement(query);	        	
			         rs=ps.executeQuery();
			         while(rs.next()){
		        	
            %>

            	 <tr>
			     	<td><%= rs.getString(1) %></td>
			     	<td><%= rs.getString(2) %></td>
			     	<td><%= rs.getString(3) %></td>
			     	<td><%= rs.getString(4) %></td>		     	
     			</tr>
            <%
		         }
			         }catch(Exception e) {
		 			System.out.println(e);
					
		 		}
     
            %>
            
            </table>
         </div>
         
     </div>
            
            
    
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>


</body>
</html>