<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Process</title>
</head>
<body>
<%
	String email,password,name,id;
	String extractedEmail,extractedpass,extractedName;
	int extractedId;
	PreparedStatement ps;
	Connection con = null;
	RequestDispatcher rd;

	try {
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
	
		id =request.getParameter("hospid");
		email =  request.getParameter("email");
		password =  request.getParameter("password");
		
		String q = "select * from staff where hospid = ?";
		ps = con.prepareStatement(q);
		ps.setString(1, id);
		
		ResultSet rs =  ps.executeQuery();
	
		if(rs.next()!=false) {
		
			extractedId = rs.getInt(1);
			extractedEmail = rs.getString(2);
			extractedpass = rs.getString(3);
			extractedName = rs.getString(4);
	
			if(extractedEmail.equals(email)) {
				if(extractedpass.equals(password)) {
					System.out.println("Login Successful");
					rd = request.getRequestDispatcher("AfterLogin.jsp");
					request.setAttribute("hello", extractedName);
					rd.forward(request, response);
					
					
				}else {
					rd = request.getRequestDispatcher("Login.jsp");
					String msg = "Invalid Password";
					request.setAttribute("msg", msg);
					rd.forward(request, response);
					System.out.println("invalid password");
				}
					
			}else {
				rd = request.getRequestDispatcher("Login.jsp");
				String msg = "Invalid Email";
				request.setAttribute("msg", msg);
				rd.forward(request, response);
				System.out.println("invalid email");
			}
			
		}else {
			rd = request.getRequestDispatcher("Login.jsp");
			String msg = "User does not exist";
			request.setAttribute("msg", msg);
			rd.forward(request, response);
			System.out.println("User does not exist!!");
		}
	}catch(Exception e) {
		//System.out.println(e);
	
	}

%>

</body>
</html>