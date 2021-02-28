<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="my.RESTfull.web.services.Drink" %>
    
    <%@ page import="com.sun.jersey.api.client.Client" %>
	<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
	<%@ page import="com.sun.jersey.api.client.WebResource" %>
	
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="java.util.List" %>
	<%@ page import="org.json.*"%>
	<%@ page import="org.json.JSONObject" %>
	<%@ page import="org.json.JSONArray" %>
	
	
	<%
	String userEmail = (String)session.getAttribute("userEmail");
	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/retrieveUsername/"+userEmail);
	ClientResponse myresp = webResource.accept("text/plain").get(ClientResponse.class); 
	
	String output = myresp.getEntity(String.class);
	
	session.setAttribute("username", output );
	
	%>
    
    
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
	
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script src="scripts.js"  ></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<!--  NavBar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  LIQUOR-E-PLACE |
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" >Welcome <% out.println(output); %> |</a>
      </li>
       <li class="nav-item">
        	<a class="nav-link" href="logOut.jsp">Log Out </a>
      </li>
    </ul>
  </div>
</nav>

<!-- table -->
	<h2>Menu</h2>
		
			<table id="Mytable" class="center table">
				<tr scope="row">
		    		<th>Action</th>
		    		<th>Button</th> 
		  		</tr>
				  				  
				  <tr scope="row">
				    <td>List Of Drinks</td>
				    <td><button onclick="myFunction(7)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV7" scope="row">
					<td>
						
						<% 
						Client client8 = Client.create();
						WebResource webResource8 = client8.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/showAll");
						ClientResponse myresp8 = webResource8.accept("application/json").get(ClientResponse.class);
					
						String output8 = myresp8.getEntity(String.class);
						
						JSONArray AllDrinks = new JSONArray(output8);
						
						for (int i = 0; i < AllDrinks.length(); i++) {
							
							
								if(AllDrinks.getJSONObject(i).get("color").equals("blond") || AllDrinks.getJSONObject(i).get("color").equals("red") || AllDrinks.getJSONObject(i).get("color").equals("weiss") ){
							  %><p><% out.println( "ID :"+AllDrinks.getJSONObject(i).get("productId")+", Name:"+AllDrinks.getJSONObject(i).get("name")+" , Category: Beer" ); %> </p> <%
							  }else if(AllDrinks.getJSONObject(i).get("category").equals("X") || AllDrinks.getJSONObject(i).get("category").equals("H") || AllDrinks.getJSONObject(i).get("category").equals("G") ){
							  	%><p><% out.println( "ID :"+AllDrinks.getJSONObject(i).get("productId")+", Name:"+AllDrinks.getJSONObject(i).get("name")+" , Category: Wine" ); %> </p> <%
							  }else{
							  	%><p><% out.println( "ID :"+AllDrinks.getJSONObject(i).get("productId")+", Name:"+AllDrinks.getJSONObject(i).get("name")+" , Category: "+AllDrinks.getJSONObject(i).get("category") ); %> </p> <%
							  }
								out.print("<hr/>");
							}
							
						%>
							  
						
					</td>
				    <td></td>
				</tr>
				  <tr>
				    <td>Search beers</td>
				    <td><button onclick="myFunction(10)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV10">
				  	<form method="post" ><td><input type="text" name="color" placeholder="color "/><br/><br/><input type="text" name="origin" placeholder="origin "/></td>
				  	<td><input type="submit" value="search" name="btn1" class="btn btn-success"/></td></form>
				  </tr>
				  <tr>
				    <td>Search wines</td>
				    <td><button onclick="myFunction(11)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV11">
				  	<form method="post" ><td><input type="text" name="category" placeholder="category "/><br/><br/><input type="text" name="origin" placeholder="origin "/></td>
				  	<td><input type="submit" value="search" name="btn2" class="btn btn-success"/></td></form>
				  </tr>
				  <tr>
				  <td>Search Spirits</td>
				    <td><button onclick="myFunction(8)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr>
				  <tr id="myDIV8">
				  	<form method="post" ><td><input type="text" name="category" placeholder="category "/></td>
				  	<td><input type="submit" value="search" name="btn5" class="btn btn-success"/></td></form>
				  </tr>
				    <td>Search by Drink's Name</td>
				    <td><button onclick="myFunction(12)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV12">
				  	<form method="post" ><td><input type="text" name="name" placeholder="name "/></td>
				  	<td><input type="submit" value="search" name="btn8" class="btn btn-success"/></td></form>
				  </tr>
				  
				  <tr>
				    <td>Drinks with Alcohol >5% </td>
				    <td><form method="post"> <input type="submit"  value="Perform Action" name="btn3" class="btn btn-primary"/> </form> </td>
				  </tr>
				  <tr>
				    <td><b>New Order --></b> </td>
				    <td><a href="orderPage.jsp"> <input type="submit"  value="Buy Some Drinks" name="btn7" class="btn btn-success"/> </a> </td>
				  </tr>
			</table>
			
			<% /*Search beers*/
			if(request.getParameter("btn1")!=null){
				String origin = request.getParameter("origin");
				String color = request.getParameter("color");
				
				Client client2 = Client.create();
				WebResource webResource2 = client2.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/searchBeers/"+origin+"/"+color);
				ClientResponse myresp2 = webResource2.accept("application/json").get(ClientResponse.class);
			
				String output2 = myresp2.getEntity(String.class);
				
				JSONArray jsonArray = new JSONArray(output2);
				
				for (int i = 0; i < jsonArray.length(); i++) {
					  out.println( "Name :"+jsonArray.getJSONObject(i).get("name")+" ,Color : "+jsonArray.getJSONObject(i).get("color")+" , Origin: "+jsonArray.getJSONObject(i).get("origin"));
					  %><hr/><% 
					}
					
			
			}
						
			%>  
			
			<% /*Search wines*/
			if(request.getParameter("btn2")!=null){
				String origin = request.getParameter("origin");
				String category = request.getParameter("category");
				
				Client client3 = Client.create();
				WebResource webResource3 = client3.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/searchWines/"+origin+"/"+category);
				ClientResponse myresp3 = webResource3.accept("application/json").get(ClientResponse.class);
			
				String output3 = myresp3.getEntity(String.class);
				
				JSONArray jsonArray = new JSONArray(output3);
				
				for (int i = 0; i < jsonArray.length(); i++) {
					  out.println( "Name :"+jsonArray.getJSONObject(i).get("name")+" ,Color : "+jsonArray.getJSONObject(i).get("color")+" , Origin: "+jsonArray.getJSONObject(i).get("origin")+", Category: "+jsonArray.getJSONObject(i).get("category"));
					  %><hr/><% 
					}
					
			}
						
			%>  
			
			<% /*alcAll*/
			if(request.getParameter("btn3")!=null){
	
				
				Client client4 = Client.create();
				WebResource webResource4 = client4.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/alcAll");
				ClientResponse myresp4 = webResource4.accept("application/json").get(ClientResponse.class);
			
				String output4 = myresp4.getEntity(String.class);
				
				JSONArray jsonArray = new JSONArray(output4);
				
				for (int i = 0; i < jsonArray.length(); i++) {
					  out.println( "Drink name :"+jsonArray.getJSONObject(i).get("name")+" ,Drink alcohol : "+jsonArray.getJSONObject(i).get("alcohol")+"%");
					  %><hr/><% 
					}
			}
						
			%>  
			
			
			<% /*Search spirits*/
			if(request.getParameter("btn5")!=null){
				String category = request.getParameter("category");
				
				Client client6 = Client.create();
				WebResource webResource6 = client6.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/searchSpirits/"+category);
				ClientResponse myresp6 = webResource6.accept("application/json").get(ClientResponse.class);
			
				String output6 = myresp6.getEntity(String.class);
				
				JSONArray jsonArray = new JSONArray(output6);
				
				for (int i = 0; i < jsonArray.length(); i++) {
					  out.println( "Name :"+jsonArray.getJSONObject(i).get("name")+" ,Category : "+jsonArray.getJSONObject(i).get("category")+" , Origin: "+jsonArray.getJSONObject(i).get("origin"));
					  %><hr/><% 
					}
					
			
			}
						
			%>  
			
			<% /*Search By Name*/
			if(request.getParameter("btn8")!=null){
				String name = request.getParameter("name");
				
				Client client9 = Client.create();
				WebResource webResource9 = client9.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/searchByName/"+name);
				ClientResponse myresp9 = webResource9.accept("text/plain").get(ClientResponse.class);
			
				String output9 = myresp9.getEntity(String.class);
				
				out.println(output9);
					  %><hr/><% 
		
			
			}
						
			%>  
						
			
			
</body>
</html>