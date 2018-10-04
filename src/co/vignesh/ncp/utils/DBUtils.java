package co.vignesh.ncp.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import co.vignesh.ncp.beans.*;
 
public class DBUtils {
 
    public static UserAccount findUser(Connection conn, //
            String userName, String password) throws SQLException {
 
        String sql = "Select a.User_Name, a.Password, a.first_name, a.last_name, a.email, a.phone_no, a.balance from USER_ACCOUNT a " //
                + " where a.User_Name = ? and a.password= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
            String firstName = rs.getString("FIRST_NAME");
            String email = rs.getString("EMAIL");
            String lastName = rs.getString("LAST_NAME");
            String phoneno = rs.getString("PHONE_NO");
            int balance = rs.getInt("BALANCE");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);	
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNo(phoneno);
            user.setBalance(balance);
            return user;
        }
        return null;
    }
    
//    public static int getUserId(Connection conn, UserAccount user) throws SQLException {
//    	
//    	System.out.println("######################THE REQUESTED USERNAME IS " + user.getUserName());
//    	
//    	String sql = "Select user_id from USER_ACCOUNT where user_name = ?";
//    	
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, user.getUserName());
//        
//        ResultSet rs = pstm.executeQuery();
//        
//        if (rs.next()) {
//            int user_id = rs.getInt("user_id");
//            return user_id;
//        }
//        else {
//        	return 0;
//        }
//        
//    }
    
  public static UserAccount findUser(Connection conn, String userName) throws SQLException {

      String sql = "Select a.User_Name, a.Password from USER_ACCOUNT a "//
              + " where a.User_Name = ? ";

      PreparedStatement pstm = conn.prepareStatement(sql);
      pstm.setString(1, userName);

      ResultSet rs = pstm.executeQuery();

      if (rs.next()) {
          String password = rs.getString("Password");
          String firstName = rs.getString("FIRST_NAME");
          UserAccount user = new UserAccount();
          user.setUserName(userName);
          user.setPassword(password);
          user.setFirstName(firstName);
          return user;
      }
      return null;
  }
  
	public static void insertUser(Connection conn, UserAccount user) throws SQLException {
	String sql = "Insert into USER_ACCOUNT(user_name, first_name, last_name, password, email, phone_no, balance) values (?,?,?,?,?,?,?)";
	
	PreparedStatement pstm = conn.prepareStatement(sql);
	
	pstm.setString(1, user.getUserName());
	pstm.setString(2, user.getFirstName());
	pstm.setString(3, user.getLastName());
	pstm.setString(4, user.getPassword());
	pstm.setString(5, user.getEmail());
	pstm.setString(6, user.getPhoneNo());
	pstm.setInt(7, user.getBalance());
	
	pstm.executeUpdate();
	}

	public static void insertCreditCard(Connection conn, String userName, CreditCard newCreditCard) throws SQLException {
		// TODO Auto-generated method stub
				
		String sql = "Insert into CREDIT_CARD(user_id, owner, card_number, expiry_month, expiry_year) values (?, ?, ?, ?, ?)";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		    	
    	String sql2 = "Select user_id from USER_ACCOUNT where user_name = ?";
    	
        PreparedStatement pstm2 = conn.prepareStatement(sql2);
        pstm2.setString(1, userName);
        
        ResultSet rs = pstm2.executeQuery();
        
        int user_id=0;
        
        if (rs.next()) {
            user_id = rs.getInt("user_id");
        }
        
        System.out.println("THE RETURNED USER_ID IS NOW ======= " + user_id);
        
		pstm.setInt(1, user_id);
//		pstm.setInt(1, DBUtils.getUserId(conn, thisUser));
		pstm.setString(2, newCreditCard.getOwner());
		pstm.setString(3, newCreditCard.getCardNo());
		pstm.setString(4, newCreditCard.getExpiryMonth());
		pstm.setString(5, newCreditCard.getExpiryYear());
		
		pstm.executeUpdate();
		
	}
	
	public static void insertAadharCard(Connection conn, String userName, AadharCard newcard) throws SQLException {
		// TODO Auto-generated method stub
				
		String sql = "Insert into AADHAR_CARD(user_id, name, card_no, pan) values (?, ?, ?, ?)";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		    	
    	String sql2 = "Select user_id from USER_ACCOUNT where user_name = ?";
    	
        PreparedStatement pstm2 = conn.prepareStatement(sql2);
        pstm2.setString(1, userName);
        
        ResultSet rs = pstm2.executeQuery();
        
        int user_id=0;
        
        if (rs.next()) {
            user_id = rs.getInt("user_id");
        }
        
        System.out.println("THE RETURNED USER_ID IS NOW ======= " + user_id);
        
		pstm.setInt(1, user_id);
//		pstm.setInt(1, DBUtils.getUserId(conn, thisUser));
		pstm.setString(2, newcard.getName());
		pstm.setString(3, newcard.getCardNo());
		pstm.setString(4, newcard.getPanNo());
		
		pstm.executeUpdate();
		
	}
	
	public static int checkCreditCard(Connection conn, String userName) throws SQLException {
		// TODO Auto-generated method stub
				
		
		String sql = "Select user_id from USER_ACCOUNT where user_name = ?";
    	
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        
        ResultSet rs = pstm.executeQuery();
        
        int user_id=0;
        
        if (rs.next()) {
            user_id = rs.getInt("user_id");
        }
        
		String sql2 = "Select * FROM  CREDIT_CARD where user_id = ?";
		
		PreparedStatement pstm2 = conn.prepareStatement(sql2);
		pstm2.setString(1, String.valueOf(user_id));    	
		
		rs = pstm2.executeQuery();
		
		int flag = 0;
		
		if (rs.next()) {
            flag = 1;
	    }
		return flag;
	}
	
	public static int checkAadharCard(Connection conn, String userName) throws SQLException {
		// TODO Auto-generated method stub
				
		
		String sql = "Select user_id from USER_ACCOUNT where user_name = ?";
    	
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        
        ResultSet rs = pstm.executeQuery();
        
        int user_id=0;
        
        if (rs.next()) {
            user_id = rs.getInt("user_id");
        }
        
		String sql2 = "Select * FROM  AADHAR_CARD where user_id = ?";
		
		PreparedStatement pstm2 = conn.prepareStatement(sql2);
		pstm2.setString(1, String.valueOf(user_id));    	
		
		rs = pstm2.executeQuery();
		
		int flag = 0;
		
		if (rs.next()) {
            flag = 1;
	    }
		return flag;
	}
	
	
	
}
 
//    public static UserAccount findUser(Connection conn, String userName) throws SQLException {
// 
//        String sql = "Select a.User_Name, a.Password, a.Gender from User_Account a "//
//                + " where a.User_Name = ? ";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, userName);
// 
//        ResultSet rs = pstm.executeQuery();
// 
//        if (rs.next()) {
//            String password = rs.getString("Password");
//            String gender = rs.getString("Gender");
//            UserAccount user = new UserAccount();
//            user.setUserName(userName);
//            user.setPassword(password);
//            user.setGender(gender);
//            return user;
//        }
//        return null;
//    }
 
//    public static List<Product> queryProduct(Connection conn) throws SQLException {
//        String sql = "Select a.Code, a.Name, a.Price from Product a ";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
// 
//        ResultSet rs = pstm.executeQuery();
//        List<Product> list = new ArrayList<Product>();
//        while (rs.next()) {
//            String code = rs.getnewCreditCardString("Code");
//            String name = rs.getString("Name");
//            float price = rs.getFloat("Price");
//            Product product = new Product();
//            product.setCode(code);
//            product.setName(name);
//            product.setPrice(price);
//            list.add(product);
//        }
//        return list;
//    }
// 
//    public static Product findProduct(Connection conn, String code) throws SQLException {
//        String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, code);
// 
//        ResultSet rs = pstm.executeQuery();
// 
//        while (rs.next()) {
//            String name = rs.getStnewCreditCardring("Name");
//            float price = rs.getFloat("Price");
//            Product product = new Product(code, name, price);
//            return product;
//        }
//        return null;
//    }
// 
//    public static void updateProduct(Connection conn, Product product) throws SQLException {
//        String sql = "Update Product set Name =?, Price=? where Code=? ";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
// 
//        pstm.setString(1, product.getName());
//        pstm.setFloat(2, product.getPrice());
//        pstm.setString(3, product.getCode());
//        pstm.executeUpdate();
//    }
// 
//    public static void insertProduct(Connection conn, Product product) throws SQLException {
//        String sql = "Insert into Product(Code, Name,Price) values (?,?,?)";
// 
//        PreparedStatement pstm = cnewCreditCardonn.prepareStatement(sql);
// 
//        pstm.setString(1, product.getCode());
//        pstm.setString(2, product.getName());
//        pstm.setFloat(3, product.getPrice());
// 
//        pstm.executeUpdate();
//    }
// 
//    public static void deleteProduct(Connection conn, String code) throws SQLException {
//        String sql = "Delete From Product where Code= ?";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
// 
//        pstm.setString(1, code);
// 
//        pstm.executeUpdate();
//    }
// 
//}