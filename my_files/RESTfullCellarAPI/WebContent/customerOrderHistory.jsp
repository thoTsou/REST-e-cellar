<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.sun.jersey.api.client.Client" %>
	<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
	<%@ page import="com.sun.jersey.api.client.WebResource" %>
	
	<%@ page import="org.json.JSONObject" %>
	<%@ page import="org.json.JSONArray" %>
	
	<%@ page import="java.sql.Timestamp" %>
	
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
	
	<link rel="stylesheet" type="text/css" href="main.css" />
	<script src="main.js"  ></script>
	
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
		      <li class="nav-item ">
		        <span class="nav-link" ><% out.println( (String)session.getAttribute("username")+"'s ->" ); %> Orders History | <span class="sr-only">(current)</span></span>
		      </li>
		      <li class="nav-item ">
        		<a class="nav-link" href="orderPage.jsp">Place an order<span class="sr-only">(current)</span></a>
      		</li>
		    </ul>
		  </div>
	</nav>
	
	<!-- check if order can be deleted -->
	<% /*Delete order (within 10 minutes from order confirmation)*/
			if(request.getParameter("btn1")!=null){
				int orderId = Integer.parseInt( request.getParameter("orderId") );
				
				Client client9 = Client.create();
				WebResource webResource9 = client9.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/deleteOrder/"+orderId);
				ClientResponse myresp9 = webResource9.accept("text/plain").delete(ClientResponse.class);
			
				String output9 = myresp9.getEntity(String.class);
				
				out.println("<b>"+output9+"</b>");	
			}
						
			%>  

<!-- orders -->
			<%
	                Client client = Client.create();
					WebResource webResource = client.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/customerOrdersHistory/"+(String)session.getAttribute("userEmail"));
					ClientResponse myresp = webResource.accept("application/json").get(ClientResponse.class);
				
					String output = myresp.getEntity(String.class);
					
					JSONArray usersOrders = new JSONArray(output);
					
			%>
			
			
<div class="container" style="margin-top:7%;width:50%">
	<div class="row">
    	<div class="col align-self-center">
			<%			
						for (int i = 0; i < usersOrders.length(); i++) {
							JSONObject order = usersOrders.getJSONObject(i); 
							int orderId = order.getInt("orderId");
							String date = order.getString("date");
							
								
	        %>
			<div class="card" >
			  <h5 class="card-header">Order ID : <% out.print(orderId); %></h5>
			  <div class="card-body">
			    <h5 class="card-title">Products</h5>
			    <p class="card-text"><% 
			    
			    for(int j=0 ; j < order.getString("orderProducts").length() ; j++){
			    	if(order.getString("orderProducts").charAt(j) == '_' && order.getString("orderProducts").charAt(j+1)== '_' && order.getString("orderProducts").charAt(j+2)== '_' ){
			    		%><br/><%
			    	}
			    	out.print( order.getString("orderProducts").charAt(j) ); 
			    }
			    
			    %></p>
			    <h5 class="card-title">Total Cost : <% out.print(order.getDouble("orderTotal")+"$"); %></h5>
			    <h5 class="card-title">Date : <% out.print(date); %></h5>
			    <form method="post">
				    <input type=submit class="btn btn-danger" name="btn1" value="Delete Order" />**within 10 minutes from order confirmation!!
				    <input type="hidden" name="orderId" value="<% out.print(orderId); %>"/>
			    </form>
			  </div>
			</div><br/>
			<% } %>
		</div>
	</div>
</div>



</body>
</html>