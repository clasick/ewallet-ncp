package co.vignesh.ncp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import co.vignesh.ncp.beans.UserAccount;
import co.vignesh.ncp.beans.AadharCard;
import co.vignesh.ncp.beans.CreditCard;
import co.vignesh.ncp.utils.*;
import co.vignesh.ncp.conn.*;

@WebServlet(urlPatterns = { "/aadhar-card" })
public class AadharServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public AadharServlet() {
        super();
    }
 
    // Show Login page.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Forward to /WEB-INF/views/loginView.jsp
        // (Users can not access dirPasswordectly into JSP pages placed in WEB-INF)
        HttpSession session = request.getSession();

        request.setAttribute("firstname", MyUtils.getLoginedUser(session).getFirstName());
        request.setAttribute("lastname", MyUtils.getLoginedUser(session).getLastName());
        request.setAttribute("email", MyUtils.getLoginedUser(session).getEmail());
        request.setAttribute("phoneno", MyUtils.getLoginedUser(session).getPhoneNo());
        request.setAttribute("balance", MyUtils.getLoginedUser(session).getBalance());
        
    	
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/aadharLink.jsp");
 
        dispatcher.forward(request, response);
 
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        String owner = (String) request.getParameter("owner");
        String cardNumber = (String) request.getParameter("number");
        String panNumber = (String) request.getParameter("input_pan");
        
        HttpSession session = request.getSession();
        
        System.out.println((String) session.getAttribute("user"));
        
        UserAccount thisUser = (UserAccount) session.getAttribute("user");
       
        AadharCard newcard = new AadharCard(thisUser, owner, cardNumber, panNumber);
 
        String errorString = null;
 
        if (errorString == null) {
            try {
                DBUtils.insertAadharCard(conn, MyUtils.getLoginedUser(session).getUserName(), newcard);
            } catch (SQLException e) {
                e.printStackTrace();
                errorString = e.getMessage();
            }
        }
 
        // Store infomation to request attribute, before forward to views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("aadharcard", newcard);
        
        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("${pageContext.request.contextPath}/aadhar-card");
            dispatcher.forward(request, response);
        }
        // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect("browse.html");
        }
    }
    }