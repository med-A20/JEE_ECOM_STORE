package beans;

public class User {
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	
	

	public User(String firstName, String lastName, String password, String email) {
		super();
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.password = password;
		this.email = email;
	}

	public User() {
		// TODO Auto-generated constructor stub
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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	
}
