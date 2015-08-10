<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,model.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<!-- jQuery 2.0.2 -->
        <script src="../admin/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../admin/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="../admin/js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- daterange picker -->
        <link href="../admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="../admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- Bootstrap Color Picker -->
        <link href="../admin/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
        <!-- Bootstrap time Picker -->
        <link href="../admin/css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="../admin/js/html5shiv.js"></script>
          <script src="../admin/js/respond.min.js"></script>
        <![endif]-->
</head>
<body>


<body class="skin-blue">
    <%
    String email = (String) session.getAttribute("email");
    
	
    if (email != null){
    	response.sendRedirect("../login/login.html");
    }
    
   	Connection conn=connDB.getConnectionDB();
    
	Statement stmt= conn.createStatement();
	try{
	%>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                SP IT! TM
            </a>
            
            
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
            </nav>
            
            
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
           
            
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Transaction History
                        
                    </h1>
                  
                </section>

                 <!-- Main content -->
                <%
                ArrayList<Order> al = (ArrayList<Order>) session.getAttribute("order");
                
                OrderDB db=new OrderDB();
                
                
                int counter=0;
                %>
                
				<table class="table table-striped">
                 	<tr>
                 		<th>ProductID</th>
                 		<th>Product Name</th>
                 		<th>Number of Order</th>
                 	</tr>
                <%
                
                for (Order o: al){
                	counter++;
                	int productid = o.getProductID();
                	String top10productname = db.top10productname(productid);
                	%>
                	<tr>
                		<td><%=counter %></td>
                		<td><%=o.getProductID() %></td>
                		<td><%=top10productname %></td>
                		<td><%=o.getAmount() %></td>
                		
                	</tr>
                	<%
                	
                }
                %>
                </table><!-- /.table -->
 <%																	
	conn.close();
	} catch(Exception e){
	out.println(e);
	}
%>

</body>
</html>