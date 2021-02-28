package my.RESTfull.web.services;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONArray;
import org.json.JSONObject;

import my.RESTfull.web.services.Beer;
import my.RESTfull.web.services.Drink;
import my.RESTfull.web.services.Whine;
import my.RESTfull.web.services.User;
import my.RESTfull.web.services.Order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.google.gson.Gson;


@Path("CellarService")
public class cellar {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/cellardb?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false";
	
	static final String USER = "thoTsou";
	static final String PASS = "thotsou30495";
	
	@POST
	@Path("/addBeer/{name}/{color}/{price}/{origin}/{alcohol}/{quantityAdded}")
	@Produces(MediaType.TEXT_PLAIN)
	public void addBeer(@PathParam("name") String name ,@PathParam("color") String color ,@PathParam("price") double price ,@PathParam("origin") String origin ,@PathParam("alcohol") double alcohol ,@PathParam("quantityAdded") int quantityAdded)
	{
		Connection conn = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		PreparedStatement insertBeer = conn.prepareStatement("INSERT INTO drinks (name,color,price,origin,alcohol,quantityInStock) VALUES (?,?,?,?,?,?);");
		
		insertBeer.setString(1,name);
		insertBeer.setString(2,color);
		insertBeer.setFloat(3,(float)price);
		insertBeer.setString(4,origin);
		insertBeer.setFloat(5,(float)alcohol);
		insertBeer.setInt(6, quantityAdded);
		
		
		insertBeer.executeUpdate();
		insertBeer.close();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	@DELETE
	@Path("/removeBeer/{id}")
	@Produces(MediaType.TEXT_PLAIN)
	public void removeBeer(@PathParam("id") int id){
		Connection conn = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		PreparedStatement removeBeer = conn.prepareStatement("DELETE FROM drinks where productId=?");
		
		removeBeer.setInt(1, id);
			
		removeBeer.executeUpdate();
		removeBeer.close();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	@POST
	@Path("/addWine/{name}/{color}/{price}/{origin}/{alcohol}/{category}/{quantityAdded}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addWine(@PathParam("name") String name ,@PathParam("color") String color ,@PathParam("price") double price ,@PathParam("origin") String origin ,@PathParam("alcohol") double alcohol ,@PathParam("category") String category,@PathParam("quantityAdded") int quantityAdded){
		Connection conn = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		PreparedStatement insertBeer = conn.prepareStatement("INSERT INTO drinks (name,color,price,origin,alcohol,category,quantityInStock) VALUES (?,?,?,?,?,?,?);");
		
		insertBeer.setString(1,name);
		insertBeer.setString(2,color);
		insertBeer.setFloat(3,(float)price);
		insertBeer.setString(4,origin);
		insertBeer.setFloat(5,(float)alcohol);
		insertBeer.setString(6,category);
		insertBeer.setInt(7, quantityAdded);
		
		
		
		insertBeer.executeUpdate();
		insertBeer.close();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return "wine added successfully";
	}
	
	@POST
	@Path("/addSpirit/{name}/{color}/{price}/{origin}/{alcohol}/{category}/{quantityAdded}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addSpirit(@PathParam("name") String name ,@PathParam("color") String color ,@PathParam("price") double price ,@PathParam("origin") String origin ,@PathParam("alcohol") double alcohol ,@PathParam("category") String category,@PathParam("quantityAdded") int quantityAdded){
		Connection conn = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		PreparedStatement insertBeer = conn.prepareStatement("INSERT INTO drinks (name,color,price,origin,alcohol,category,quantityInStock) VALUES (?,?,?,?,?,?,?);");
		
		insertBeer.setString(1,name);
		insertBeer.setString(2,color);
		insertBeer.setFloat(3,(float)price);
		insertBeer.setString(4,origin);
		insertBeer.setFloat(5,(float)alcohol);
		insertBeer.setString(6,category);
		insertBeer.setInt(7, quantityAdded);
		
		
		
		insertBeer.executeUpdate();
		insertBeer.close();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return "spirit added successfully";
	}
	
	
	
	@GET
	@Path("/showAll")
	@Produces(MediaType.APPLICATION_JSON)
	public String showAll(){
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
	    	System.out.println("Enter1");
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM drinks");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color = rs.getString("color");
					float price = rs.getFloat("price");
					String origin = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					if(category == null || category.length() == 0) {
						beer = new Beer(productId,name,color,price,origin,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					else {
						whine = new Whine(productId,name,color,price,origin,alcohol,category,quantityInStock);
						drinksList.add(whine);
					}
	
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    
	    Gson gson = new Gson();
    	
    	String drinks = gson.toJson(drinksList);
    	
    	return drinks;
		
	}
	
	@GET
	@Path("/showWines")
	@Produces(MediaType.APPLICATION_JSON)
	public String showWines(){
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM drinks WHERE category='X' OR category='G' OR category='H';");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color = rs.getString("color");
					float price = rs.getFloat("price");
					String origin = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Whine whine;
					
					whine = new Whine(productId,name,color,price,origin,alcohol,category,quantityInStock);
					drinksList.add(whine);
					
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    
	    Gson gson = new Gson();
    	
    	String wines = gson.toJson(drinksList);
    	
    	return wines;
		
	}
	
	@GET
	@Path("/showSpirits")
	@Produces(MediaType.APPLICATION_JSON)
	public String showSpirits(){
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM drinks WHERE color='-' ");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color = rs.getString("color");
					float price = rs.getFloat("price");
					String origin = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Spirit spirit;
					
					spirit = new Spirit(productId,name,color,price,origin,alcohol,category,quantityInStock);
					drinksList.add(spirit);
					
					
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    
	    Gson gson = new Gson();
    	
    	String spirits = gson.toJson(drinksList);
    	
    	return spirits;
		
	}
	
	@GET
	@Path("/showBeers")
	@Produces(MediaType.APPLICATION_JSON)
	public String showBeers(){
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM drinks WHERE color='blond' OR color='red' OR color='weiss' ");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color = rs.getString("color");
					float price = rs.getFloat("price");
					String origin = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					if(category == null || category.length() == 0) {
						beer = new Beer(productId,name,color,price,origin,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    
	    Gson gson = new Gson();
    	
    	String beers = gson.toJson(drinksList);
    	
    	return beers;
		
	}
	
	
	
	
	@GET
	@Path("/searchBeers/{origin}/{color}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchBeers(@PathParam("color") String color ,@PathParam("origin") String origin) {
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM drinks where color=? AND origin=?");
				ps.setString(1, color);
				ps.setString(2, origin);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color2 = rs.getString("color");
					float price = rs.getFloat("price");
					String origin2 = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					if(category == null || category.length() == 0) {
						beer = new Beer(productId,name,color2,price,origin2,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					else {
						whine = new Whine(productId,name,color2,price,origin2,alcohol,category,quantityInStock);
						drinksList.add(whine);
					}
	
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    

	    Gson gson = new Gson();
    	
    	String drinks = gson.toJson(drinksList);
    	
    	return drinks;
		
	}
	
	
	@GET
	@Path("/searchWines/{origin}/{category}")
	@Produces(MediaType.APPLICATION_JSON)
public String searchWines(@PathParam("category") String category ,@PathParam("origin") String origin) {
		
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM drinks where category=? AND origin=?");
				ps.setString(1, category);
				ps.setString(2, origin);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color2 = rs.getString("color");
					float price = rs.getFloat("price");
					String origin2 = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category2 = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					if(category2 == null || category2.length() == 0) {
						beer = new Beer(productId,name,color2,price,origin2,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					else {
						whine = new Whine(productId,name,color2,price,origin2,alcohol,category2,quantityInStock);
						drinksList.add(whine);
					}
	
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    Gson gson = new Gson();
    	
    	String drinks = gson.toJson(drinksList);
    	
    	return drinks;
		
	}
	
	@GET
	@Path("/searchSpirits/{category}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchSpirits(@PathParam("category") String category ) {
		
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM drinks where category=? ");
				ps.setString(1, category);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color2 = rs.getString("color");
					float price = rs.getFloat("price");
					String origin2 = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category2 = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					if(category2 == null || category2.length() == 0) {
						beer = new Beer(productId,name,color2,price,origin2,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					else {
						whine = new Whine(productId,name,color2,price,origin2,alcohol,category2,quantityInStock);
						drinksList.add(whine);
					}
	
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    Gson gson = new Gson();
    	
    	String drinks = gson.toJson(drinksList);
    	
    	return drinks;
		
	}
	
	
	@GET
	@Path("/searchByName/{name}")
	@Produces(MediaType.TEXT_PLAIN)
	public String searchByName(@PathParam("name") String name ) {
		
		Connection conn = null;

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("select * from drinks where name LIKE ? ");
				ps.setString(1, "%"+name+"%");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name2 = rs.getString("name");
					String color2 = rs.getString("color");
					float price = rs.getFloat("price");
					String origin2 = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category2 = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					Spirit spirit;
					if(category2 == null || category2.length() == 0) {
						beer = new Beer(productId,name2,color2,price,origin2,alcohol,quantityInStock);
						System.out.println("1");
						return beer.toString();
					}
					else if(category2.equals("X") || category2.equals("G") || category2.equals("H") ) {
						whine = new Whine(productId,name2,color2,price,origin2,alcohol,category2,quantityInStock);
						System.out.println("2");
						return whine.toString();
						
					}else {
						spirit = new Spirit(productId,name2,color2,price,origin2,alcohol,category2,quantityInStock);
						return spirit.toString();
					}
	
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	    System.out.println("3");
		return "error";
	    
	}
	
	
	@GET
	@Path("/alcAll")
	@Produces("application/json")
	public String alcoholAll() {
		Connection conn = null;
	    ArrayList<Drink> drinksList = new ArrayList<Drink>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM drinks where alcohol>5 ORDER BY alcohol DESC");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int productId = rs.getInt("productId");
					String name = rs.getString("name");
					String color2 = rs.getString("color");
					float price = rs.getFloat("price");
					String origin2 = rs.getString("origin");
					float alcohol = rs.getFloat("alcohol");
					String category2 = rs.getString("category");
					int quantityInStock = rs.getInt("quantityInStock");
					
					//create objects
					Beer beer;
					Whine whine;
					if(category2 == null || category2.length() == 0) {
						beer = new Beer(productId,name,color2,price,origin2,alcohol,quantityInStock);
						drinksList.add(beer);
					}
					else {
						whine = new Whine(productId,name,color2,price,origin2,alcohol,category2,quantityInStock);
						drinksList.add(whine);
					}
	
				}
				
				for(Drink drink:drinksList) {
					System.out.println(drink.toString());
				}
				
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	Gson gson = new Gson();
	    	
	    	String drinks = gson.toJson(drinksList);
	    	
	    	return drinks;
	    
	}
	
	
	@POST
	@Path("/addUser/{username}/{email}/{password}")
	@Produces(MediaType.TEXT_PLAIN)
	public String addUser(@PathParam("username") String username ,@PathParam("email") String email ,@PathParam("password") String password )
	{
		Connection conn = null;
		String message = new String();
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//check availabilty of email
		PreparedStatement ps = conn.prepareStatement("Select * FROM users");
		
		ResultSet rs = ps.executeQuery();
		
		int flag=0;
		
		while(rs.next()) {
			//retrieve values
			String EMAIL = rs.getString("email");
			if(EMAIL.equals(email)) {
				flag=1;
			}
		}
		
		if(flag==0) {
		//sql goes here
		System.out.println(email+" "+username+" "+password);
		PreparedStatement insertUser = conn.prepareStatement("INSERT INTO users (username,email,password) VALUES (?,?,?)");
		
		insertUser.setString(1,username);
		insertUser.setString(2,email);
		insertUser.setString(3,password);
		
		
		insertUser.executeUpdate();
		insertUser.close();
		 message = new String("Success");
		}else {
		 message = new String("Not Valid");
		}
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return message;
		
	}
	
	@GET
	@Path("/usersList")
	@Produces("application/json")
	public String usersList() {
		Connection conn = null;
	    ArrayList<User> users = new ArrayList<User>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM users");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					String username = rs.getString("username");
					String email = rs.getString("email");
					String password = rs.getString("password");
					
					//create objects
					
					User user = new User(username,email,password);
					users.add(user);
				}
			
				
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	Gson gson = new Gson();
	    	
	    	String usersJson = gson.toJson(users);
	    	
	    	return usersJson;
	    
	}
	
	@GET
	@Path("/ordersList")
	@Produces("application/json")
	public String ordersList() {
		Connection conn = null;
	    ArrayList<Order> ordersList = new ArrayList<Order>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM orders");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int orderId = rs.getInt("orderId");
					String FullName = rs.getString("FullName");
					String address = rs.getString("address");
					String city = rs.getString("city");
					String region = rs.getString("region");
					String postalCode = rs.getString("postalCode");
					String email = rs.getString("email");
					String phoneNum = rs.getString("phoneNum");
					String products = rs.getString("products");
					double total = rs.getDouble("total");
					Timestamp date = rs.getTimestamp("date");
					
					//create objects
					
					Order order = new Order(orderId,FullName,address,city,region,postalCode,email,phoneNum,products,total,date);
					ordersList.add(order);
				}
			
				
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	Gson gson = new Gson();
	    	
	    	String orders = gson.toJson(ordersList);
	    	
	    	return orders;
	    
	}

	

	@GET
	@Path("/checkUserCredentials/{email}/{password}")
	@Produces(MediaType.TEXT_PLAIN)
	public String checkUserCredentials(@PathParam("email") String email ,@PathParam("password") String password) {
		Connection conn = null;
		String message = new String();
	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM users");
				
				ResultSet rs = ps.executeQuery();
				
				int flag=0;
				
				while(rs.next()) {
					//retrieve values
					String EMAIL = rs.getString("email");
					String PASS = rs.getString("password");
					System.out.println(email+" "+password);
					if(email.equals(EMAIL) && PASS.equals(password)){
						flag=1;
					}
				}
			
				if(flag==1) {
					message="Success";
				}else {
					message="error";
				}
				
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	
	    	return message;
	    
	}
	
	
	@GET
	@Path("/DrinksCount")
	@Produces(MediaType.TEXT_PLAIN)
	public String DrinksCount(){
		Connection conn = null;
		Integer count=0;

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM drinks;");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					count++;
				}
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    
	   
    	return count.toString();
		
	}
	
	@POST
	@Path("/addOrder/{customerFullName}/{customerAddress}/{customerCity}/{customerRegion}/{customerPostalCode}/{customerEmail}/{customerPhoneNum}/{orderProducts}/{orderTotalCost}")
	@Produces(MediaType.TEXT_PLAIN)
	public void addOrder(@PathParam("customerFullName") String customerFullName ,@PathParam("customerAddress") String customerAddress ,@PathParam("customerCity") String customerCity , @PathParam("customerRegion") String customerRegion ,@PathParam("customerPostalCode") String customerPostalCode , @PathParam("customerEmail") String customerEmail ,@PathParam("customerPhoneNum") String customerPhoneNum, @PathParam("orderProducts") String orderProducts , @PathParam("orderTotalCost") double orderTotalCost )
	{
		Connection conn = null;
		System.out.println("Enter");
		try {
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		PreparedStatement insertBeer = conn.prepareStatement("INSERT INTO orders (FullName,address,city,region,postalCode,email,phoneNum,products,total) VALUES (?,?,?,?,?,?,?,?,?);");
		
		insertBeer.setString(1,customerFullName);
		insertBeer.setString(2,customerAddress);
		insertBeer.setString(3,customerCity);
		insertBeer.setString(4,customerRegion);
		insertBeer.setString(5,customerPostalCode);
		insertBeer.setString(6, customerEmail);
		insertBeer.setString(7, customerPhoneNum);
		insertBeer.setString(8, orderProducts);
		insertBeer.setDouble(9, orderTotalCost);
		
		
		insertBeer.executeUpdate();
		insertBeer.close();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	@GET
	@Path("/retrieveUsername/{email}")
	@Produces(MediaType.TEXT_PLAIN)
	public String retrieveUsername(@PathParam("email") String email ) {
		Connection conn = null;
		String username = new String();
		
	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM users WHERE email=?");
				
				ps.setString(1,email);
				
				ResultSet rs = ps.executeQuery();
				
				
				
				while(rs.next()) {
					username = rs.getString("username");
				}
			
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	
	    	return username;
	    
	}
	
	@GET
	@Path("/customerOrdersHistory/{email}")
	@Produces("application/json")
	public String customerOrdersHistory(@PathParam("email") String email) {
		Connection conn = null;
	    ArrayList<Order> userOrders = new ArrayList<Order>();

	    try {
		    	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL,USER,PASS);
				//sql goes here
				//Create objects from database
				PreparedStatement ps = conn.prepareStatement("Select * FROM orders WHERE email=?");
				ps.setString(1,email);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					//retrieve values
					int orderId = rs.getInt("orderId");
					String FullName = rs.getString("FullName");
					String address = rs.getString("address");
					String city = rs.getString("city");
					String region = rs.getString("region");
					String postalCode = rs.getString("postalCode");
					String email2 = rs.getString("email");
					String phoneNum = rs.getString("phoneNum");
					String products = rs.getString("products");
					double total = rs.getDouble("total");
					java.sql.Timestamp date = rs.getTimestamp("date");
					
					//create objects
					
					Order order = new Order(orderId,FullName,address,city,region,postalCode,email2,phoneNum,products,total,date);
					userOrders.add(order);
				}
			
				
				
			ps.close(); 
			}
	    	catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
	    	
	    	Gson gson = new Gson();
	    	
	    	String orders = gson.toJson(userOrders);
	    	
	    	return orders;
	    
	}
	
	@DELETE
	@Path("/deleteOrder/{id}")
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteOrder(@PathParam("id") int id){
		Connection conn = null;
		Timestamp orderDate = null;
		String message = new String();
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		//sql goes here
		
		PreparedStatement ps = conn.prepareStatement("Select * FROM orders WHERE orderId=?");
		ps.setInt(1,id);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			//retrieve date
			orderDate = rs.getTimestamp("date");
		}
		
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	
		long dif = compareTwoTimeStamps(currentTime,orderDate);
		
		//System.out.println(dif);
		
		ps.close(); 
		
		if(dif<=10) {
			PreparedStatement removeBeer = conn.prepareStatement("DELETE FROM orders where orderId=?");
			
			removeBeer.setInt(1, id);
				
			removeBeer.executeUpdate();
			removeBeer.close();
			message = new String("Success");
		}else {
			message = new String("CantDelete");
		}
		
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return message;
		
	}
	
	
	public static long compareTwoTimeStamps(java.sql.Timestamp currentTime, java.sql.Timestamp oldTime)
	{
	    long milliseconds1 = oldTime.getTime();
	  long milliseconds2 = currentTime.getTime();

	  long diff = milliseconds2 - milliseconds1;
	  long diffSeconds = diff / 1000;
	  long diffMinutes = diff / (60 * 1000);
	  long diffHours = diff / (60 * 60 * 1000);
	  long diffDays = diff / (24 * 60 * 60 * 1000);

	    return diffMinutes;
	}

	
}
