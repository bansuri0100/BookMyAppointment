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
    <title>Book Appointment</title>
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
    
    <div class="container">
        <div class="jumbotron" style="margin-top:8%">
            <div class="container">
            <h2> Available Doctors</h2>
             <table border="1" width="800" align="center">  
                    <tr bgcolor="00FF7F">
                    	<th><b>DOCTOR ID</b></th>
                        <th><b>DOCTOR</b></th>
                        <th><b>SPECIALITY</b></th>
                        <th><b>DAYS</b></th>
                        <th><b>TIMINGS</b></th>
                        <th><b>SLOTS</b></th>
                    </tr>
 <%
	 try{
			RequestDispatcher rd;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
			String query = "update patients set problem = ? where pid = ?";
			PreparedStatement ps = con.prepareStatement(query);
			String problem = request.getParameter("prob");
			String pid = request.getParameter("pid");
			String patname = request.getParameter("patname");
			ps.setString(1, problem);
			ps.setString(2, pid);
			int i = ps.executeUpdate();
			query="select docid,name,speciality,days,timings,slots from doctors where speciality = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,problem);
			ResultSet rs=ps.executeQuery();
			if(pid == null && patname ==null){
				pid = session.getAttribute("pid").toString();
				patname = session.getAttribute("patname").toString();
			}
			while(rs.next()){
 %>
     <tr>
     	<td><%=rs.getString(1) %></td>
     	<td><%=rs.getString(2) %></td>
     	<td><%=rs.getString(3) %></td>
     	<td><%=rs.getString(4) %></td>
     	<td><%=rs.getString(5) %></td>
     	<td><%=String.valueOf(rs.getInt(6)) %></td>
     </tr>
     
 <% 
    } 
 
 %>
 
  <br>
  <hr>
	      </table>
	      <br>
	      <hr>
	      <br>
       		<h2>Book Appointment</h3><br>
       		<form action="ShowAppointment.jsp">
       			<div class="form-group">
                        <label>Doctor Id</label>
                        <input type="text" class="form-control" name="docid" required>
                    </div>
                    <div class="form-group">
                        <label>Doctor Name</label>
                        <input type="text" class="form-control" name="dname" required>
                    </div>
                    <div class="form-group">
                        <label>Patient Id</label>
                        <input type="text" class="form-control" name="pid" value=<%=pid%> required>
                    </div>
                    <div class="form-group">
                        <label>Patient Name</label>
                        <input type="text" class="form-control" name="pname" value=<%=patname%> required>
                    </div>
                    <%
	 }catch(Exception e){
		 System.out.println(e);
	 }
                    
                    %>
                    <div class="form-group">
                        <label>Date</label>
                        <input type="text" class="form-control" name="date" required>
                    </div>
                    <div class="form-group">
                        <label>Timings</label>
                        <input type="text" class="form-control" name="time" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Book</button>
       		</form>
            </div>
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