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
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
        <meta charset="UTF-8">
        <title>SP IT! TM | Members</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- jQuery 2.0.2 -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
        
                <script>
			function Confirmclicked(e)
			
			{
			if(!confirm('Click OK to perform action'))e.preventDefault();
			}
		</script>
</head>
<body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                SP IT! TM
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
            
                <div class="navbar-right">
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">                
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="dashboard.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-folder"></i>
                                <span>Sales Report</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                          	<ul class="treeview-menu">
                                <li class="active"><a href="sales.jsp"><i class="fa fa-angle-double-right"></i> Date Range</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-folder"></i>
                                <span>Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                          	<ul class="treeview-menu">
                                <li><a href="viewallcategories.jsp"><i class="fa fa-angle-double-right"></i> View All Categories</a></li>
                                <li><a href="addcategory.jsp"><i class="fa fa-angle-double-right"></i> Add Category</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-archive"></i>
                                <span>Products</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="viewallproduct.jsp"><i class="fa fa-angle-double-right"></i> View All Products</a></li>
                                <li><a href="addproduct.jsp"><i class="fa fa-angle-double-right"></i> Add Products</a></li>
                                <li><a href="unapprovedreview.jsp"><i class="fa fa-angle-double-right"></i> Pending Reviews</a></li>
                            </ul>
                        </li>
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-group"></i>
                                <span> Members</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="viewalladmin.jsp"><i class="fa fa-angle-double-right"></i> View All Members</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Members
                        <small>Tables</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Members</li>
                    </ol>
                </section>



<%
	try{													
	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver");
	// Step 2: Define Connection URL
	String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
	// Step 3 : Establish connection URL
	Connection conn = DriverManager.getConnection(connURL);
	Statement adminstmt= conn.createStatement();
	ResultSet adminColrs = adminstmt.executeQuery("SELECT * FROM member");
	ResultSetMetaData adminColrsmd = adminColrs.getMetaData();
%>
                <!-- Main content -->
                <section class="content">
                
                <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Members Table</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>
                                                <%
													String adminCol1 = adminColrsmd.getColumnName(1);
														
													out.println(adminCol1);
												%>
                                                </th>
                                                <th>
                                                <%
														String adminCol2 = adminColrsmd.getColumnName(2);
														
														out.println(adminCol2);
												%>
                                                </th>
                                                <th>
                                                <%
														String adminCol3 = adminColrsmd.getColumnName(3);
														
														out.println(adminCol3);
												%>
                                                </th>
                                                <th>
                                                
                                                <%
														String adminCol4 = adminColrsmd.getColumnName(4);
														
														out.println(adminCol4);
												%>
                                                
                                                </th>
                                                <th>
                                                <%
														String adminCol5 = adminColrsmd.getColumnName(5);
														
														out.println(adminCol5);
												%>
                                                </th>
                                                <th>
                                                <%
														String adminCol6 = adminColrsmd.getColumnName(6);
														
														out.println(adminCol6);
												%>
                                                </th>
                                                <th>
                                                <%
														String adminCol8 = adminColrsmd.getColumnName(8);
														
														out.println(adminCol8);
												%>
                                                </th>
                                                <th>
                                                <%
														String adminCol9 = adminColrsmd.getColumnName(9);
														
														out.println(adminCol9);
												%>
                                                </th>
                                                <th>
												
													<%
													
														out.println("Option");
													
													%>
												
												</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             
                                                <%
														String adminsql="select * from member";
														ResultSet adminrs= adminstmt.executeQuery(adminsql);
														while (adminrs.next()){
															int idadmin=adminrs.getInt("memberID");
												%>
															<tr>
                                                				<td>
																	<%=
																		adminrs.getString("memberID") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("Name") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("contact") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("dob") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("address") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("email") 
																	%> 
																</td>
																<td>
																	<%=
																		adminrs.getString("admin") 
																	%> 
																</td>
																<td>
																	<%
																		if (adminrs.getInt("Ban") == 0) {
																	%>
																		<i class="fa fa-circle-o"></i> 
																	<%		
																		} else {
																	%>
								                                       <i class="fa  fa-check-circle"></i>
																	<%		
																		}
																	%>  
																
																	
																</td>
																<td> 
																<% 
												                
																	out.println("<form action=verifydeleteadmin.jsp>");
																	out.println("<input type='hidden' name='deleteadmin' value='"+idadmin+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-ban' onclick='return Confirmclicked();'>");
																	out.println("Remove");
																	out.println("</button>");
													                out.println("</form>");
													                
													                if (adminrs.getInt("ban") == 0) {
													                	out.println("<form action=banadmin.jsp>");
													                	out.println("<input type='hidden' name='banadmin' value='"+idadmin+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-times' onclick='return Confirmclicked();'>");
																		out.println("Ban Admin ?");
																		out.println("</button>");
														                out.println("</form>");
													                } else if (adminrs.getInt("ban") != 0) {
													                	out.println("<form action=unbanadmin.jsp>");
													                	out.println("<input type='hidden' name='unbanadmin' value='"+idadmin+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-times' onclick='return Confirmclicked();'>");
																		out.println("UnBan Admin ?");
																		out.println("</button>");
														                out.println("</form>");
													                } 
													                
													                
													                if (adminrs.getInt("admin") == 0) {
													                	out.println("<form action=makeadmin.jsp>");
													                	out.println("<input type='hidden' name='makeadmin' value='"+idadmin+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-times' onclick='return Confirmclicked();'>");
																		out.println("Make Admin ?");
																		out.println("</button>");
														                out.println("</form>");
													                }  else if (adminrs.getInt("admin") == 1) {
													                	out.println("<form action=unmakeadmin.jsp>");
													                	out.println("<input type='hidden' name='unmakeadmin' value='"+idadmin+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-times' onclick='return Confirmclicked();'>");
																		out.println("Remove Admin Rights?");
																		out.println("</button>");
														                out.println("</form>");
													                }
																	
																
																%>
																</td>
															</tr>
												<%			
														}
												%>

                                            
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                
                
                
                
                </section><!-- /.content -->
<%
	conn.close();
	} catch(Exception e){
	out.println(e);
	}
%>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->




    </body>
</html>