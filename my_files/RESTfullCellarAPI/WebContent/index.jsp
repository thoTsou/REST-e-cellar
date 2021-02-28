<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.sun.jersey.api.client.Client" %>
	<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
	<%@ page import="com.sun.jersey.api.client.WebResource" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

	<!-- BootStrap -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- jquery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!--My external css -->
	<link rel="stylesheet" type="text/css" href="main.css">
	<!-- My external Js -->
	<script src="./js/main.js"></script>

	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
	<style>
			
		/* Slider */
		
		.slick-slide {
		    margin: 0px 20px;
		}
		
		.slick-slide img {
		    width: 100%;
		}
		
		.slick-slider
		{
		    position: relative;
		    display: block;
		    box-sizing: border-box;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		            user-select: none;
		    -webkit-touch-callout: none;
		    -khtml-user-select: none;
		    -ms-touch-action: pan-y;
		        touch-action: pan-y;
		    -webkit-tap-highlight-color: transparent;
		}
		
		.slick-list
		{
		    position: relative;
		    display: block;
		    overflow: hidden;
		    margin: 0;
		    padding: 0;
		}
		.slick-list:focus
		{
		    outline: none;
		}
		.slick-list.dragging
		{
		    cursor: pointer;
		    cursor: hand;
		}
		
		.slick-slider .slick-track,
		.slick-slider .slick-list
		{
		    -webkit-transform: translate3d(0, 0, 0);
		       -moz-transform: translate3d(0, 0, 0);
		        -ms-transform: translate3d(0, 0, 0);
		         -o-transform: translate3d(0, 0, 0);
		            transform: translate3d(0, 0, 0);
		}
		
		.slick-track
		{
		    position: relative;
		    top: 0;
		    left: 0;
		    display: block;
		}
		.slick-track:before,
		.slick-track:after
		{
		    display: table;
		    content: '';
		}
		.slick-track:after
		{
		    clear: both;
		}
		.slick-loading .slick-track
		{
		    visibility: hidden;
		}
		
		.slick-slide
		{
		    display: none;
		    float: left;
		    height: 100%;
		    min-height: 1px;
		}
		[dir='rtl'] .slick-slide
		{
		    float: right;
		}
		.slick-slide img
		{
		    display: block;
		}
		.slick-slide.slick-loading img
		{
		    display: none;
		}
		.slick-slide.dragging img
		{
		    pointer-events: none;
		}
		.slick-initialized .slick-slide
		{
		    display: block;
		}
		.slick-loading .slick-slide
		{
		    visibility: hidden;
		}
		.slick-vertical .slick-slide
		{
		    display: block;
		    height: auto;
		    border: 1px solid transparent;
		}
		.slick-arrow.slick-hidden {
		    display: none;
		}
	</style>
	<script>
		$(document).ready(function(){
		    $('.customer-logos').slick({
		        slidesToShow: 6,
		        slidesToScroll: 1,
		        autoplay: true,
		        autoplaySpeed: 1500,
		        arrows: false,
		        dots: false,
		        pauseOnHover: false,
		        responsive: [{
		            breakpoint: 768,
		            settings: {
		                slidesToShow: 4
		            }
		        }, {
		            breakpoint: 520,
		            settings: {
		                slidesToShow: 3
		            }
		        }]
		    });
		});
	</script>
</head>
<body>
<h3 style="text-align:center;margin-top:2%">WELCOME TO LIQUOR-E-PLACE</h3>
<!--  login  -->
<div class="container" style="width:65%">
	<form method="post" >
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
	  </div>
	  
	  <input type="submit" class="btn btn-primary" name="button" value="Login">
	  <br/><br/>New User ? <br/>
	</form>
<a href="register.jsp" >^^Register Now^^</a> 
</div>

<!-- partners -->
<div class="container" style="margin-top:5%">
  <h2>Find Everything You Want</h2>**<u>Payment on receipt only</u>
   <section class="customer-logos slider">
      <div class="slide"><img src="./pics/stella2.jpg"></div>
      <div class="slide"><img src="./pics/black.jpg"></div>
      <div class="slide"><img src="./pics/jose.jpg"></div>
      <div class="slide"><img src="./pics/wines.jpg"></div>
      <div class="slide"><img src="./pics/mamos2.jpg"></div>
      <div class="slide"><img src="./pics/mur.jpg"></div>
   </section>
   

</div>

</body>
</html>

<%
	
	if(request.getParameter("button")!=null){

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/checkUserCredentials/"+email+"/"+password);
	ClientResponse myresp = webResource.accept("text/plain").get(ClientResponse.class); 
	
	String output = myresp.getEntity(String.class);
	
	System.out.println(output);
	
	if(output.equals("Success") && email.equals("admin@admin") ){
			
	String site = new String("http://localhost:8080/RESTfullCellarAPI/cellarMainAdmin.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
    
	}else if(output.equals("Success") && !"admin@admin".equals(email)){
		
		session.setAttribute("userEmail", email );
		
		String site = new String("http://localhost:8080/RESTfullCellarAPI/cellarMain.jsp");
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
	    response.setHeader("Location", site);
		
	}else{
		out.println("Wrong Email or Password");
	}

	}
			
%>  