package my.RESTfull.web.services;

public class User {
	private String username = new String();
	private String email = new String();
	private String password = new String();
	
	public User(String username , String email , String password ){
		this.setUsername(username);
		this.setEmail(email);
		this.setPassword(password);
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
