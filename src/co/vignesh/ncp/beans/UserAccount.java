package co.vignesh.ncp.beans;

public class UserAccount {
	 
	   public static final String GENDER_MALE ="M";
	   public static final String GENDER_FEMALE = "F";
	    
	   private String userName;
	   private String firstName;
	   private String lastName;
	   private String password;
	   private String email;
	   private String phoneNo;
	   private int balance;
	    
	   public UserAccount() {
		   
	   }
	 
	   public UserAccount(String username, String firstname, String lastname, String password, String email, String phoneno) {
		   this.userName = username;
		   this.lastName = lastname;
		   this.firstName = firstname;
		   this.password = password;
		   this.email = email;
		   this.phoneNo = phoneno;
		   this.balance = 0;
	   }
	    
	   public String getUserName() {
	       return userName;
	   }
	 
	   public void setUserName(String userName) {
	       this.userName = userName;
	   }
	 
	 
	   public void setFirstName(String firstName) {
	       this.firstName = firstName;
	   }
		 
	   public String getFirstName() {
	       return firstName;
	   }
	   
	   
	   public void setLastName(String lastName) {
	       this.lastName = lastName;
	   }
	   
	   public String getLastName() {
	       return lastName;
	   }
	   
	   public void setEmail(String email) {
	       this.email = email;
	   }
	   
	   
	   public String getEmail() {
	       return email;
	   }
	   
	   public void setPhoneNo(String phoneNo) {
	       this.phoneNo = phoneNo;
	   }

	   
	   public String getPhoneNo() {
	       return phoneNo;
	   }
	   
	   public void setPassword(String password) {
	       this.password = password;
	   }
	   
	   public String getPassword() {
	       return password;
	   }
	   
	   
	   public int getBalance() {
	       return balance;
	   }
	   
	   public void setBalance(int balance) {
	       this.balance = balance;
	   }

	}



