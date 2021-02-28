<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.sun.jersey.api.client.Client" %>
	<%@ page import="com.sun.jersey.api.client.ClientResponse" %>
	<%@ page import="com.sun.jersey.api.client.WebResource" %>
	
    
    <%
    
    String name = request.getParameter("name") ;
	String color = request.getParameter("color") ;
	double price = Double.parseDouble(request.getParameter("price"));
	String origin = request.getParameter("origin") ;
	double alcohol = Double.parseDouble(request.getParameter("alcohol"));
	String category = request.getParameter("category") ;
	int quantityAdded = Integer.parseInt(request.getParameter("quantityAdded"));

	
	Client client = Client.create();
	WebResource webResource = client.resource("http://localhost:8080/RESTfullCellarAPI/rest/CellarService/addWine/"+name+"/"+color+"/"+price+"/"+origin+"/"+alcohol+"/"+category+"/"+quantityAdded);
	ClientResponse myresp = webResource.accept("text/plain").post(ClientResponse.class);

	String site = new String("http://localhost:8080/RESTfullCellarAPI/cellarMainAdmin.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add beer</title>
</head>
<body style="text-align:center">
	

</html>