package controller;

import model.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/public/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("productID");
		String stockhold = request.getParameter("stock");
		
		int i = 0;
		
		HttpSession session = request.getSession();	
		CartDB db = new CartDB();
		
		
		ArrayList<Cart> al = (ArrayList<Cart>)session.getAttribute("cart");
		if(al == null){
			al = new ArrayList<Cart>();
		}		
		ArrayList<Cart> c = db.addToCart(id, al);
		
		
		String [] stock = (String [])session.getAttribute("stock");
		if(stock == null){
			stock = new String[100];
		}
		if(c.size() == 1){
			i = 0;
		}else{
			i = c.size() - 1;
		}
		stock[i] = stockhold;
	
		session.setAttribute("stock", stock);
		session.setAttribute("cart", c);	
		response.sendRedirect("displayCart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
