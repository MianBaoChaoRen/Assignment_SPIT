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
    
    <%@ page import="java.sql.*,model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
        <title>SP IT! TM | Generate Code</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../admin/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- jQuery 2.0.2 -->
        <script src="../admin/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../admin/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="../admin/js/AdminLTE/app.js" type="text/javascript"></script>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="../admin/js/html5shiv.js"></script>
          <script src="../admin/js/respond.min.js"></script>
        <![endif]-->
        
        <link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
</head>
<body class="skin-blue">
<form action = "addgenerateCode.jsp" method = "post">

	
	<% int promocode = (int) (Math.random() * 100000);%>


<h2 align = "center">Display the promo code:  

      <FONT COLOR="RED">
      <div name = "promocode1">
        <%= promocode %>
        </div>
        
      </FONT>
	</h2>
    <H4 ALIGN="CENTER">Refresh the page to see if the promo changes...</H4>
  
  
  <br>
<input type = "submit" value = "Display Promo Code" />
</form>








</body>
</html>