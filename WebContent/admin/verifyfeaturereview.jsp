<!-- 
		ST0291 ENTERPRISE APPLICATION DEVELOPMENT
				2015/2016 SEMESTER 1
					ASSIGNMENT 1
	
	Class DISM/FT/2A/02
	Marcus Tan 		- 1448892
	Theodoric Lim 	- 1431223
	William Tay 	- 1455656


 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
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
       			
       			String feature=request.getParameter("featurereview");
       			String pid=request.getParameter("pid");
       			
       			String featuresql="UPDATE review set Featured=1 where CommentID=?";
       			
       			PreparedStatement featurepstmt=conn.prepareStatement(featuresql);
       			
       			featurepstmt.setInt(1,Integer.parseInt(feature));
       			
       			int featurerec=featurepstmt.executeUpdate();
       			
       			out.println(featurerec+ " record(s) deleted");
       			
       			if (featurerec == 1) {
       				response.sendRedirect("viewproductreview.jsp?productID="+pid);
       			} else {
       				
       			}
       	
       		} catch (Exception e){
       			out.println(e);
       		}
       	
       	
       	
       	
       	%>
</body>
</html>