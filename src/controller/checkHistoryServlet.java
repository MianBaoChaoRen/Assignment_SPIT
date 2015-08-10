package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Order;
import model.OrderDB;

/**
 * Servlet implementation class checkHistoryServlet
 */
@WebServlet("/checkHistoryServlet")
public class checkHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String daterange=request.getParameter("daterange");
		HttpSession session = request.getSession();
		
		String dateParts[] = daterange.split("/");
		String firstdate  = dateParts[0];
		String seconddate  = dateParts[1];
		
		OrderDB db=new OrderDB();
		
		ArrayList<Order> al = db.top10(firstdate, seconddate);
		
		session.setAttribute("order", al);
		response.sendRedirect("displaytransaction.jsp");
		
	}

}
