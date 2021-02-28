package my.RESTfull.web.services;

import java.sql.Timestamp;

public class Order {
	private int orderId ;
	private String customerFullname = new String();
	private String customerAddress = new String();
	private String customerCity = new String();
	private String customerRegion = new String();
	private String customerPostalCode = new String();
	private String customerEmail = new String();
	private String customerPhoneNum = new String();
	private String orderProducts = new String();
	private double orderTotal ;
	private Timestamp date ;
	
	public Order(int orderId , String customerFullname , String customerAddress , String customerCity ,String customerRegion,String customerPostalCode,String customerEmail ,String customerPhoneNum ,String orderProducts,double orderTotal,Timestamp date){
		this.setOrderId(orderId);
		this.setCustomerFullname(customerFullname);
		this.setCustomerAddress(customerAddress);
		this.setCustomerCity(customerCity);
		this.setCustomerRegion(customerRegion);
		this.setCustomerPostalCode(customerPostalCode);
		this.setCustomerEmail(customerEmail);
		this.setCustomerPhoneNum(customerPhoneNum);
		this.setOrderProducts(orderProducts);
		this.setOrderTotal(orderTotal);
		this.setTimestamp(date);
	}

	public String getCustomerFullname() {
		return customerFullname;
	}

	public void setCustomerFullname(String customerFullname) {
		this.customerFullname = customerFullname;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerCity() {
		return customerCity;
	}

	public void setCustomerCity(String customerCity) {
		this.customerCity = customerCity;
	}

	public String getCustomerRegion() {
		return customerRegion;
	}

	public void setCustomerRegion(String customerRegion) {
		this.customerRegion = customerRegion;
	}

	public String getCustomerPostalCode() {
		return customerPostalCode;
	}

	public void setCustomerPostalCode(String customerPostalCode) {
		this.customerPostalCode = customerPostalCode;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPhoneNum() {
		return customerPhoneNum;
	}

	public void setCustomerPhoneNum(String customerPhoneNum) {
		this.customerPhoneNum = customerPhoneNum;
	}

	public String getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(String orderProducts) {
		this.orderProducts = orderProducts;
	}

	public double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Timestamp getTimestamp() {
		return date;
	}

	public void setTimestamp(Timestamp date) {
		this.date = date;
	}

}
