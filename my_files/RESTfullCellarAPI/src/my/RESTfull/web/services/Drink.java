package my.RESTfull.web.services;


public class Drink {
	private String name = new String();
	private String color = new String();
	private double price;
	private String origin = new String();
	private double alcohol;
	private int inStockCount;
	private int productId;
	
	
	public Drink(int productId , String name , String color , double price , String origin , double alcohol , int inStockCount ){
		this.setProductId(productId);
		this.setName(name);
		this.setColor(color);
		this.setPrice(price);
		this.setOrigin(origin);
		this.setAlcohol(alcohol);
		this.setInStockCount(inStockCount);
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public double getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(double alcohol) {
		this.alcohol = alcohol;
	}
	public int getInStockCount() {
		return inStockCount;
	}
	public void setInStockCount(int inStockCount) {
		this.inStockCount = inStockCount;
	}
	
	public String toString()
	{
		return new String("Product Id : "+this.getProductId()+" \n, Name : "+this.getName()+" \n, Color : "+this.getColor()+"\n, Price : "+this.getPrice()+" $ \n, Origin : "+this.getOrigin()+"\n, Alhocol : "+this.getAlcohol()+" %\n, In Stock Quantity : "+this.getInStockCount());
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	public int getProductId() {
		return this.productId;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}


}
