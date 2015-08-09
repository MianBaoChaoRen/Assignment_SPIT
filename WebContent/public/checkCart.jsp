<!-- 
		ST0291 ENTERPRISE APPLICATION DEVELOPMENT
				2015/2016 SEMESTER 1
					ASSIGNMENT 1
	
	Class DISM/FT/2A/02
	Marcus Tan 		- 1448892
	Theodoric Lim 	- 1431223
	William Tay 	- 1455656\


 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SP IT! TM | Index Page</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cart.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
	function inputFocus(i) {
		if (i.value == i.defaultValue) {
			i.value = "";
			i.style.color = "#000";
		}
	}
	function inputBlur(i) {
		if (i.value == "") {
			i.value = i.defaultValue;
			i.style.color = "#888";
		}

	}

		

</script>
</head>

<body>

	<%
		String [] userdetails = (String []) session.getAttribute("userdetails");
	  	try{
			
		    if (userdetails == null){
		    	response.sendRedirect("../public/index.jsp");
		    }else {
	%>


	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">SP IT! TM</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Welcome <%=userdetails[0] %></a>
                    </li>
                    <li>
                        <a href="../public/memberprofile.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="../login/logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<h1>Shopping Cart</h1>

	<div class="shopping-cart">

		<div class="column-labels">
			<label class="product-image">Image</label> <label
				class="product-details">Product</label> <label class="product-price">Price</label>
			<label class="product-quantity">Quantity</label> <label
				class="product-line-price">Total</label>
		</div>
		<%
			ArrayList<Cart> al = (ArrayList<Cart>) session.getAttribute("cart");

			int subtotals = 0;
			int tax = 0;
			int shipping = 0;
			int totals = 0;
			if (al != null) {
				int i = 0;

				for (Cart c : al) {
					c.setCount(i);
					i++;
		%>
		<form action="UpdateCartServlet" id="uForm"></form>

		<div class="product">
			<div class="product-image">
				<img src="<%=c.getImagePath()%>">
			</div>
			<div class="product-details">
				<div class="product-title"><%=c.getShortDesc()%></div>
				<p class="product-description"></p>
			</div>
			<div class="product-price">
				<%=c.getPrice()%>
			</div>
			<div class="product-quantity">
				<%=c.getQuantity()%>
				<input type="hidden" name="quantity" value="<%=c.getQuantity()%>">
			</div>

			<div class="product-line-price"><%=c.getTotalPrice()%></div>
		</div>
		<%
			subtotals += c.getTotalPrice();

				}
				tax = (int) (subtotals * (5.0f / 100.0f));
				shipping = (int) (subtotals * (2.0f / 100.0f));
				totals = subtotals + tax + shipping;

			}
		%>
		<form action="BuyCartServlet" id="bForm">
			<div class="totals">

				<div class="totals-item">
					<label>Subtotal</label>
					<div class="totals-value" id="cart-subtotal"><%=subtotals%></div>
				</div>
				<div class="totals-item">
					<label>Tax (5%)</label>
					<div class="totals-value" id="cart-tax"><%=tax%></div>
				</div>
				<div class="totals-item">
					<label>Shipping (2%)</label>
					<div class="totals-value" id="cart-shipping"><%=shipping%></div>
				</div>
				<div class="totals-item totals-item-total">
					<label>Grand Total</label>
					<div class="totals-value" id="cart-total"><%=totals%></div>
				</div>

			
				<div class="totals-item2">
					<label>Name</label>
					<div class="totals-value2">
					<%=userdetails[0] %>
					<input type = "hidden" name = "name" id = "name" value = "<%=userdetails[0] %>">
					</div>
				</div>
				<div class="totals-item2">
					<label>Contact</label>
					<div class="totals-value2">
					<%=userdetails[1] %>
					<input type = "hidden" name = "contact" id = "contact" value = "<%=userdetails[1] %>">
					</div>
				</div>
				<div class="totals-item2">
					<label>Email</label>
					<div class="totals-value2">
					<%=userdetails[2] %>
					<input type = "hidden" name = "email" id = "email" value = "<%=userdetails[2] %>">
					</div>
				</div>
				
				<div class="totals-item2">
					<label>Mailing Address</label>
					<div class="totals-value2">
					<%=userdetails[3] %>
					<input type = "hidden" name = "address" id = "address" value = "<%=userdetails[3] %>">
					</div>
				</div>
				
				<div class="totals-item2">
					<label>Credit Card No</label>
					<div class="totals-value2">
						<input type="text" name="creditcard" id = "creditcard" style="color: #888; width: 300px;" value="Credit Card"
							onfocus="inputFocus(this)" onblur="inputBlur(this)" />
					</div>
				</div>

				<div class="totals-item2">
					<label>Card Type</label>
					<div class="totals-value2">
						<select name="cardtype" style="color: #888; width: 300px;"
							onfocus="inputFocus(this)" onblur="inputBlur(this)">
							<option value="mastercard">MasterCard</option>
							<option value="visa">Visa</option>
						</select>
					</div>
				</div>
				
				<div class="totals-item2">
					<label>Expire Date</label>
					<div class="totals-value2">

						<select id="month" name = "month" style="color: #888; width: 150px;"
							onfocus="inputFocus(this)" onblur="inputBlur(this)">
							<option value="01">1</option>
						    <option value="02">2</option>
						    <option value="03">3</option>
						    <option value="04">4</option>
						    <option value="05">5</option>
						    <option value="06">6</option>
						    <option value="07">7</option>
						    <option value="08">8</option>
						    <option value="09">9</option>
						    <option value="10">10</option>
						    <option value="11">11</option>
						    <option value="12">12</option>
						</select>	
						<select id="year" name="year" style="color: #888; width: 150px;"
							onfocus="inputFocus(this)" onblur="inputBlur(this)">
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
						</select>
					</div>
				</div>
				
				<div class="totals-item2">
					<label>CVC/CVV</label>
					<div class="totals-value2">
						<input type="text" name="cvc" id = "cvc" style="color: #888; width: 300px;"
							value="CVC/CVV" onfocus="inputFocus(this)" onblur="inputBlur(this)" />
					</div>
				</div>
				<div class="totals-item">
					<input type = "submit" class="checkout" onclick = "return chkForm()" value = "BuyNow">
					<button class="back" form="uForm">Update</button>
				</div>
			</div>
		</form>

</div>
			

<script>
	 function chkForm(){

			var creditcard=document.getElementById("creditcard").value;
			var cvc = document.getElementById("cvc").value;
		 	
		 	var error=false;
		 	var errMsg="";
		 	
		 	var validcreditcard = creditcard.match("^[0-9]{16,16}$");
		 	
		 	var validcvc = cvc.match("^[0-9]{3,3}$");
		 	
		 	if ((creditcard == "" && cvc == "") || (creditcard == "Credit Card" && cvc == "CVC/CVV")){
		 		error=true;
		 		errMsg+="Please ensure all Fields are filled";	 		
		 	}else if(creditcard == "" || creditcard == "Credit Card"){
		 		error=true;
		 		errMsg+="Please enter your Credit Card number";
		 	}else if (validcreditcard == null){
		 		error=true;
		 		errMsg+="Please enter a valid 16 digit Credit Card number";
		 	}else if(cvc == "" || cvc == "CVC/CVV"){
		 		error=true;
		 		errMsg+="Please enter your CVC number";
		 	}else if(validcvc == null || cvc == "000"){
		 		error=true;
		 		errMsg+="Please enter a valid 3 digit CVC";
		 	}
		 	
		 	if(error){
		 		alert(errMsg);
		 		return false;
		 	}else {
		 		return true;
		 	}
		 	
		 }
</script>
	<%
    }
    	} catch(Exception e){
			out.println(e);
		}
	%>
</body>
</html>