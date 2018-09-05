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

import co.vignesh.ncp.beans.UserAccount;
import co.vignesh.ncp.utils.*;
import co.vignesh.ncp.conn.*;

@WebServlet(urlPatterns = { "/account" })
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public AccountServlet() {
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
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/accountDetails.jsp");
 
        dispatcher.forward(request, response);
 
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
 
        String username = (String) request.getParameter("username");
        String firstname = (String) request.getParameter("firstname");
        String lastname = (String) request.getParameter("lastname");
        String phone_no = (String) request.getParameter("phone_no");
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password1");
        
       
        UserAccount newUser = new UserAccount(username, firstname, lastname, password,email,phone_no);
 
        String errorString = null;
 
        if (errorString == null) {
            try {
                DBUtils.insertUser(conn, newUser);
            } catch (SQLException e) {
                e.printStackTrace();
                errorString = e.getMessage();
            }
        }
 
        // Store infomation to request attribute, before forward to views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("user", newUser);
 
        // If error, forward to Edit page.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("${pageContext.request.contextPath}/sign-up");
            dispatcher.forward(request, response);
        }
        // If everything nice.
        // Redirect to the product listing page.
        else {
            response.sendRedirect("login");
        }
    }
    }