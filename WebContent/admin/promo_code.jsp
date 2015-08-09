<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
       		try  {

       			// Step1: Load JDBC Driver
       			Class.forName("com.mysql.jdbc.Driver");
       			// Step 2: Define Connection URL
       			String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
       			// Step 3 : Establish connection URL
       			Connection conn = DriverManager.getConnection(connURL);
       			
       			String approve=request.getParameter("approve");
       			String pid=request.getParameter("pid");
       			
       			String approvesql="UPDATE review set Approved=1 where CommentID=?";
       			
       			PreparedStatement approvepstmt=conn.prepareStatement(approvesql);
       			
       			approvepstmt.setInt(1,Integer.parseInt(approve));
       			
       			int approverec=approvepstmt.executeUpdate();
       			
       			out.println(approverec+ " record(s) deleted");
       			
       			if (approverec == 1) {
       				response.sendRedirect("unapprovedreview.jsp");
       			} else {
       				
       			}
       	
       		} catch (Exception e){
       			out.println(e);
       		}
       	
       	
       	
       	
       	%>




</body>
</html>