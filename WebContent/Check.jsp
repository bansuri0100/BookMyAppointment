  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verifying...</title>
</head>
<body>
</body>
</html>

<%
	try{
			int i=0;
			RequestDispatcher rd;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
			Statement smt = con.createStatement();
			String id = request.getParameter("check");
			String query="select * from patients where pid="+id;
			ResultSet rs=smt.executeQuery(query);
			String pid;
			String fname;
			String lname;
			String name;
			
			while(rs.next()){
				 i++;
				 pid = String.valueOf(rs.getInt(1));
				 fname = rs.getString(2);
				 lname = rs.getString(3);
				// problem = rs.getString(4);
				 name = fname+' '+lname;
				 rd = request.getRequestDispatcher("UpdatePatient.jsp");
				 request.setAttribute("pid", pid);
				 request.setAttribute("name",name);
				 session = request.getSession();  
			     session.setAttribute("email",request.getParameter("email"));  
				 //request.setAttribute("problem", problem);
				 rd.forward(request, response);
				 break;
			}
				
			if(i==0){
				rd = request.getRequestDispatcher("AfterLogin.jsp");
				String msg = "Patient details not present in database.";
				request.setAttribute("msg", msg);
				rd.forward(request, response);
			}
	}catch(Exception e){
		System.out.println(e);
	}
	
		
%>