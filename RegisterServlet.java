
package com.learn.mycart1.servlets;



import com.learn.mycart1.entities.User;
import com.learn.mycart1.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;




public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try {
                String userName= request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone= request.getParameter("user_phone");
                String userAddress= request.getParameter("user_address");
                
                //Validations
                if(userName.isEmpty()){
                    out.println("Name is blank");
                    return;
                }
                
                //Creating user object to store data
                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
                  
                int userId;
                try (Session hibernateSession = FactoryProvider.getFactory().openSession()) {
                    Transaction tx = hibernateSession.beginTransaction();
                    userId = (int) hibernateSession.save(user);
                    tx.commit();
                }
               
               
               
                
//               code that display massage to register page
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Registration Successful !!" +userId);
                response.sendRedirect("register.jsp");
                return;
                                
            } catch (IOException | HibernateException e) {
                e.printStackTrace();
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
