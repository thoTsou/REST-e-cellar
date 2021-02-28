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

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script src="scripts.js"  ></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<%
    Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/DrinksCount");
	ClientResponse myresp = webResource.accept("text/plain").get(ClientResponse.class);

	String output = myresp.getEntity(String.class);
	int Drinkscount = Integer.parseInt(output);
	
	Client client8 = Client.create();
	WebResource webResource8 = client8.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/showAll");
	ClientResponse myresp8 = webResource8.accept("application/json").get(ClientResponse.class);

	String output8 = myresp8.getEntity(String.class);
	
	JSONArray AllDrinks = new JSONArray(output8);
	
    %>
    

<div class="container" style="margin-top:5%">
       <table class="table table-striped">
          <tbody>
             <tr>
                <td colspan="1">
                   <form class="well form-horizontal" method="post" action="storeOrderAndRedirect.jsp" >
                      <fieldset>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Full Name</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="fullName" name="fullName" placeholder="Full Name" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Address Line 1</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine1" name="addressLine1" placeholder="Address Line 1" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">City</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="city" name="city" placeholder="City" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">State/Province/Region</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="state" name="state" placeholder="State/Province/Region" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Postal Code/ZIP</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="postcode" name="postcode" placeholder="Postal Code/ZIP" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Email</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span><input id="email" name="email" placeholder="Email" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Phone Number</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span><input id="phoneNumber" name="phoneNumber" placeholder="Phone Number" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                      </fieldset>
                      <%
				    	String productsDetails = new String();
                      	double total = 0 ;
                      
				    	for(int i=0 ; i<Drinkscount ; i++){
				    		JSONObject drink = AllDrinks.getJSONObject(i);
				    		int drinkID = drink.getInt("productId");
				    		
				    		if(request.getParameter("check"+drinkID)!=null){
				    			int quantity = Integer.parseInt(request.getParameter("quan"+drinkID));
				    			double price = drink.getDouble("price");
				    			productsDetails = new String(productsDetails+"___Id:"+drinkID+",Quantity:"+quantity+",Price:"+price);
				    			total = total + (quantity*price);   
				    		}
				    	}
				    	%><input type="hidden" name="products" value="<% out.print(productsDetails); %>"  />
				    		<input type="hidden" name="total" value="<% out.print(total); %>">
				    	  <%
				    %>
                      <button type="submit" class="btn btn-success" name="SubmitOrderButton">Submit Order</button>
                   </form>
                </td>
             </tr>
          </tbody>
       </table>
    </div>
    
    
    
    <!-- Store Order -->
    

</body>
</html>