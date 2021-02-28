package my.RESTfull.web.services;

public class Spirit extends Drink {
	private String category = new String(); 
	
	
	public Spirit(int productId , String name , String color , double price , String origin , double alcohol, String category , int inStockCount ){
		super(productId , name , color , price ,origin , alcohol ,inStockCount);
		this.setCategory(category);
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
	public String toString() {
		return new String(super.toString()+" \n, Category : "+this.getCategory());
	}
	
}
