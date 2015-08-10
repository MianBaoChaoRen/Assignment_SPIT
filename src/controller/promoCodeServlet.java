package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class promoCodeServlet
 */
@WebServlet("/promoCodeServlet")
public class promoCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public promoCodeServlet() {
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
		
		String promocode=request.getParameter("promocode");
		
		boolean error=false;
		
		if (useri=="" ){
			error=true;
		}
		
		else if (!userid.matches(checkuserid)){
			error=true;
		}
		
		if(error){
			
			response.sendRedirect("getuserdetails.jsp");
		}else{
			
			response.sendRedirect("displaydetails.jsp");
		
	

		
	}
	}

}
