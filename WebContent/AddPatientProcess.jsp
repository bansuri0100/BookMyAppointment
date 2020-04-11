<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Patient</title>
	</head>
<body>
		<h1>Adding Patient...</h1>
</body>


<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
		Statement smt = con.createStatement();
		String pid = request.getParameter("pid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String problem = request.getParameter("problem");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String aadhar = request.getParameter("aadhar");
		smt.executeUpdate("insert into patients (pid,fname,lname,address,phoneno,aadhar,problem) values('"+pid+"','"+fname+"','"+lname+"','"+address+"','"+phone+"','"+aadhar+"','"+problem+"');");
		session.setAttribute("patname", fname);
		session.setAttribute("pid", pid);
		response.sendRedirect("BookAppointment.jsp?prob="+problem);
		
	}catch(Exception e){
		System.out.println(e);
	}

%>
</html>