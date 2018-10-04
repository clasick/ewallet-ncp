package co.vignesh.ncp.beans;

public class CreditCard {
	    
	   private UserAccount user;
	   private String owner;
	   private String cardNo;
	   private String expiryMonth;
	   private String expiryYear;
	   
	   
	   public CreditCard() {
		   
	   }
	 
	   public CreditCard(UserAccount user, String owner, String cardNo, String expiryMonth, String expiryYear) {
		   this.user = user;
		   this.owner = owner;
		   this.cardNo = cardNo;
		   this.expiryMonth = expiryMonth;
		   this.expiryYear = expiryYear;
	   }
	    
	   public String getOwner() {
	       return owner;
	   }
	 
	   public void setOwner(String owner) {
	       this.owner = owner;
	   }
	 
	 
	   public void setCardNo(String cardNo) {
	       this.cardNo = cardNo;
	   }
		 
	   public String getCardNo() {
	       return cardNo;
	   }
	   
	   
	   public void setExpiryMonth(String expiryMonth) {
	       this.expiryMonth = expiryMonth;
	   }
	   
	   public String getExpiryMonth() {
	       return expiryMonth;
	   }
	   
	   public void setExpiryYear(String expiryYear) {
	       this.expiryYear = expiryYear;
	   }
	   
	   public String getExpiryYear() {
	       return expiryMonth;
	   }
}



