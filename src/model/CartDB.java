package model;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;
import java.sql.Date;

public class CartDB {
	public ArrayList<Cart> addToCart(String id, ArrayList<Cart> al){
		try{
			Connection conn=connDB.getConnectionDB();
			String sqlStr = "Select * from product where ProductID LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int productID = rs.getInt("ProductID");
				String shortDesc = rs.getString("ShortDesc");
				int price = rs.getInt("Price");
				String imagePath = rs.getString("ImagePath");
				String desc = rs.getString("Desc");
				
				Cart c = new Cart(productID, shortDesc, price, imagePath, desc, 0, 1, 0);
				al.add(c);
				
				
			}
			conn.close();
			return al;
		}catch(Exception e){
			System.out.println(e);
			return null;			
		}
		
	}
	

	public ArrayList<Cart> confirmCart(ArrayList<Cart> al, int quantity, int total, int i){
		Cart c = al.get(i);

		int productID = c.getProductID();
		String shortDesc = c.getShortDesc();
		int price = c.getPrice();
		String imagePath = c.getImagePath();
		String desc = c.getDesc();
			
		Cart d = new Cart(productID, shortDesc, price, imagePath, desc, 0, quantity, total);

		al.set(i, d);
		
		return al;
	}
	
	public int recordCart(String name, String contact, String email,  String address, String creditcard,
				String cardtype, String exmonth, String exyear, String cvc, ArrayList<Cart> Al){
		try{
			Connection conn = connDB.getConnectionDB();
			
			
			ArrayList<Cart> al = Al;
			int orderID = 0;
			int memberID = 0;
			
				
				String orderid = "select orderid from ordercart";
				
				String memberid = "select memberID from member where email = ? && contact = ?";
				
				String sql = "insert into ordercart (orderid, orderdate, memberid, name, contact, email, address, creditcard, cardtype, exmonth, exyear, cvc, productID, totalprice, quantity)" + 
						" Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				
				
				PreparedStatement pstmt = conn.prepareStatement(orderid);
				PreparedStatement pstmt2 = conn.prepareStatement(sql);
				PreparedStatement pstmt3 = conn.prepareStatement(memberid);
				
				pstmt3.setString(1, email);
				pstmt3.setString(2, contact);
				
				ResultSet rs = pstmt.executeQuery();
				ResultSet rs2 = pstmt3.executeQuery();
				
				while(rs.next()){
					orderID = rs.getInt("orderid");
				}
				
					if(orderID == 0){
						orderID = 1;
					}else{
						orderID++;
					}
				
				while(rs2.next()){
					memberID = rs2.getInt("memberID");
				}
			
				DateFormat df = new SimpleDateFormat("yyyy-dd-MM");
				Calendar calobj = Calendar.getInstance();
				String orderdate = df.format(calobj.getTime());
				
				pstmt2.setInt(1, orderID);
				pstmt2.setString(2, orderdate);
				pstmt2.setInt(3, memberID);				
				pstmt2.setString(4, name);
				pstmt2.setString(5, contact);
				pstmt2.setString(6, email);
				pstmt2.setString(7, address);
				pstmt2.setString(8, creditcard);
				pstmt2.setString(9, cardtype);
				pstmt2.setString(10, exmonth);
				pstmt2.setString(11, exyear);
				pstmt2.setString(12, cvc);
				
				for(Cart c: al){
					pstmt2.setInt(13, c.getProductID());
					pstmt2.setInt(14, c.getTotalPrice());
					pstmt2.setInt(15, c.getQuantity());					
					pstmt2.executeUpdate();
				}	
				return orderID;

		}catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}
	
	public int getStock(String productId){
		try{
			int stock = 0;
			
			Connection conn = connDB.getConnectionDB();
			
			String getStock = "Select quantity from product where ProductID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(getStock);
			
			pstmt.setString(1, productId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				stock = rs.getInt("quantity");
			}
			return stock;
		}catch(Exception e){
			System.out.println(e);
			return 0;
		}
	}
	
	public void updateStock(ArrayList<Cart> al){
		try{
			int oldstock = 0;
			int newstock = 0;
			int productID = 0;
			
			Connection conn = connDB.getConnectionDB();
			
			String getStock = "Select quantity from product where ProductID = ?";			
			String updateStock = "Update product SET quantity = ? WHERE productID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(getStock);
			PreparedStatement pstmt2 = conn.prepareStatement(updateStock);
			
			for(Cart c: al){
				productID = c.getProductID();
				pstmt.setInt(1, productID);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					oldstock = rs.getInt("quantity");
				}
				
				newstock = oldstock - c.getQuantity();
				pstmt2.setInt(1, newstock);
				pstmt2.setInt(2, productID);
				
				
				pstmt2.executeUpdate();
				
			}
			

		}catch(Exception e){
			System.out.println(e);
		}
	}
}
