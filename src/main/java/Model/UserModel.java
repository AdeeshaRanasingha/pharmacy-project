package Model;

public class UserModel {

	
	private int id;
	private String fullname;
	private String password;
	private String email;
	private String phone;
	private String usertype;
	private String propicurl;
	
	/*public UserModel(int id, String fullname, String password, String confirmpassword, String email, String phone,
			String usertype, String propicurl) {
		
		this.id = id;
		this.fullname = fullname;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.email = email;
		this.phone = phone;
		this.usertype = usertype;
		this.propicurl = propicurl;
	}*/
	
	
	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getUsertype() {
		return usertype;
	}


	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}


	public String getPropicurl() {
		return propicurl;
	}


	public void setPropicurl(String propicurl) {
		this.propicurl = propicurl;
	}





	public String getConfirmpassword() {
		return confirmpassword;
	}





	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	
	
		
		
		

	
}
