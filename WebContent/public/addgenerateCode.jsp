<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		try{
			
			int promocode=Integer.parseInt(request.getParameter("promocode"));
			
			
			 // Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
			// Step 3 : Establish connection URL
			Connection conn = DriverManager.getConnection(connURL);	     
			
			//Statement stmt= conn.createStatement();
			
			
			String AddgenerateCodesql="Insert into promo_code1 (promo_code) values(?)";
   			
   			PreparedStatement AddgenerateCodepstmt=conn.prepareStatement(AddgenerateCodesql);
   			
   			AddgenerateCodepstmt.setInt(1,Integer.parseInt("promocode"));
   			
			
   			int AddgenerateCoderec=AddgenerateCodepstmt.executeUpdate();
   			
   			if (AddgenerateCoderec == 1) {
   				response.sendRedirect("index.jsp");
   			} else {
   				response.sendRedirect("generateCode.jsp");
   			}
   			
			conn.close();
			
		} catch(Exception e){
			
			out.println(e);
		}
	
	
	
	%>

</body>
</html>