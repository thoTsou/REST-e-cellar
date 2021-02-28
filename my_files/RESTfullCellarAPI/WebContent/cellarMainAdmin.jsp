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
<body >

<!--  NavBar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  LIQUOR-E-PLACE |
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" >Logged In As Admin | </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logOut.jsp">Log Out </a>
      </li>
    </ul>
  </div>
</nav>

<!-- table -->

	
	<h2>ADMIN Menu</h2>
		
			<table id="Mytable" class="center table">
				<tr scope="row">
		    		<th>Action</th>
		    		<th>Button</th> 
		  		</tr>
				  <tr>
				    <td>Add beer</td>
				    <td><button onclick="myFunction(1)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV1" scope="row">
				  	<form method="post" action="AddBeer2.jsp" onsubmit="return validation()">
					<td>	
						<input type="text" placeholder="beer's name" name="name" required/><br/><br/>
						<input type="text" placeholder="color(type acceptable color)" name="color" id="beerColor" required/><br/><br/>
						<input type="text" placeholder="price" name="price" required/><br/><br/>
						<input type="text" placeholder="origin" name="origin" required/><br/><br/>
						<input type="text" placeholder="alcohol" name="alcohol" required/><br/><br/>
						<input type="text" placeholder="quantityAdded" name="quantityAdded" required/><br/><br/>
					
					
					</td>
				    <td><input type="submit" value="add beer" class="btn btn-success"/></td>
				    </form>
				</tr>
				  <tr scope="row">
				    <td>Remove beer</td>
				    <td><button onclick="myFunction(2)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV2" scope="row">
				  	<form method="post" action="RemoveBeer2.jsp" >
					<td>	
						<input type="text" placeholder="beer's id" name="id" required/><br/><br/>
					</td>
				    <td><input type="submit" value="remove beer" class="btn btn-danger"/></td>
				    </form>
				</tr>
				  <tr scope="row">
				    <td>Add wine</td>
				    <td><button onclick="myFunction(3)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV3" scope="row">
				  	<form method="post" action="AddWine2.jsp" onsubmit="return wineValidation()">
					<td>	
						<input type="text" placeholder="wine's name" name="name" required/><br/><br/>
						<input type="text" placeholder="color(type acceptable value)" name="color" id="wineColor" required/><br/><br/>
						<input type="text" placeholder="price" name="price" required/><br/><br/>
						<input type="text" placeholder="origin" name="origin" required/><br/><br/>
						<input type="text" placeholder="alcohol" name="alcohol" required/><br/><br/>
						<input type="text" placeholder="category(type acceptable value)" name="category" id="wineCategory" required/><br/><br/>
						<input type="text" placeholder="quantityAdded" name="quantityAdded" required/><br/><br/>
					
					
					</td>
				    <td><input type="submit" value="add wine" class="btn btn-success"/></td>
				    </form>
				</tr>
				  <tr scope="row">
				    <td>Remove wine</td>
				    <td><button onclick="myFunction(4)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV4" scope="row">
				  	<form method="post" action="RemoveBeer2.jsp" >
					<td>	
						<input type="text" placeholder="wine's id" name="id" required/><br/><br/>
					</td>
				    <td><input type="submit" value="remove wine" class="btn btn-danger"/></td>
				    </form>
				</tr>
				<tr scope="row">
				    <td>Add spirit</td>
				    <td><button onclick="myFunction(5)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV5" scope="row">
				  	<form method="post" action="AddSpirit.jsp" >
					<td>	
						<input type="text" placeholder="spirit's name" name="name" required/><br/><br/>
						<input type="text" placeholder="price" name="price" required/><br/><br/>
						<input type="text" placeholder="origin" name="origin" required/><br/><br/>
						<input type="text" placeholder="alcohol" name="alcohol" required/><br/><br/>
						<input type="text" placeholder="category(type acceptable value)" name="category" id="wineCategory" required/><br/><br/>
						<input type="text" placeholder="quantityAdded" name="quantityAdded" required/><br/><br/>
					
					
					</td>
				    <td><input type="submit" value="add spirit" class="btn btn-success"/></td>
				    </form>
				</tr>
				<tr scope="row">
				    <td>Remove spirit</td>
				    <td><button onclick="myFunction(6)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV6" scope="row">
				  	<form method="post" action="RemoveSpirit.jsp" >
					<td>	
						<input type="text" placeholder="spirit's id" name="id" required/><br/><br/>
					</td>
				    <td><input type="submit" value="remove spirit" class="btn btn-danger"/></td>
				    </form>
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
				    	<td>Users List </td>
				    	<td><form method="post"> <input type="submit"  value="Perform Action" name="btn4" class="btn btn-primary"/> </form> </td>
				  	</tr>
				  	<tr>
				    	<td>Orders List </td>
				    	<td><form method="post"> <input type="submit"  value="Perform Action" name="btn10" class="btn btn-primary"/> </form> </td>
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
				  <td>Search Spirits</td>
				    <td><button onclick="myFunction(8)" class="btn btn-primary">Perform Action</button></td>
				  </tr>
				  <tr id="myDIV8">
				  	<form method="post" ><td><input type="text" name="category" placeholder="category "/></td>
				  	<td><input type="submit" value="search" name="btn5" class="btn btn-success"/></td></form>
				  </tr>
				  <tr>
				    <td>Drinks with Alcohol >5% </td>
				    <td><form method="post"> <input type="submit"  value="Perform Action" name="btn3" class="btn btn-primary"/> </form> </td>
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
			
			<% /*Users List*/
			if(request.getParameter("btn4")!=null){
	
				
				Client client5 = Client.create();
				WebResource webResource5 = client5.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/usersList");
				ClientResponse myresp5 = webResource5.accept("application/json").get(ClientResponse.class);
			
				String output5 = myresp5.getEntity(String.class);
				
				JSONArray jsonArray = new JSONArray(output5);
				
				for (int i = 0; i < jsonArray.length(); i++) {
					  out.println( "Username :"+jsonArray.getJSONObject(i).get("username")+" ,Email : "+jsonArray.getJSONObject(i).get("email")+" , Password: "+jsonArray.getJSONObject(i).get("password"));
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
			
			<% /*orders List*/
			if(request.getParameter("btn10")!=null){
				
				
				Client client11 = Client.create();
				WebResource webResource11 = client11.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/ordersList");
				ClientResponse myresp11 = webResource11.accept("application/json").get(ClientResponse.class);
			
				String output11 = myresp11.getEntity(String.class);
				
				JSONArray orders = new JSONArray(output11);
				
				
				for (int i = 0; i < orders.length(); i++) {
					JSONObject order = orders.getJSONObject(i);
					
					  out.println( "<b>Order Id :"+order.get("orderId")+"</b> ,Customer Full Name : "+order.get("customerFullname")+" ,Address: "+order.get("customerAddress")+" ,City: "+order.get("customerCity")+" ,Region: "+order.get("customerRegion")+" ,Postal Code: "+order.get("customerPostalCode")+" ,Email: "+order.get("customerEmail")+" ,Phone Number:"+order.get("customerPhoneNum")+", Order Products: "+order.get("orderProducts")+" ,<b>Order Total:"+order.get("orderTotal")+"</b> ,<b>Order Date: "+order.get("date")+"</b>" );
					  %><hr/><% 
					}
					
			
			}
						
			%>  
						
			
			
</body>
</html>