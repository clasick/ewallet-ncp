package co.vignesh.ncp.beans;

public class AadharCard {
	    
	   private UserAccount user;
	   private String cardNo;
	   private String panNo;
	   private String name;
	   
	   
	   public AadharCard() {
		   
	   }
	 
	   public AadharCard(UserAccount user, String name, String cardNo, String panNo) {
		   this.user = user;
		   this.name = name;
		   this.cardNo = cardNo;
		   this.panNo = panNo;
	   }
	    
	   public String getName() {
	       return name;
	   }
	   
	   public String getCardNo() {
	       return panNo;
	   }
	   
	   public String getPanNo() {
	       return cardNo;
	   }
	   
}



