/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.JobFavouriteDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.JobFavourite;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author thain
 */
public class DeleteFavouriteJob extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteFavouriteJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteFavouriteJob at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String jobIdStr = request.getParameter("jobId");
        String username = request.getParameter("username");
        try {
            int jobID = Integer.parseInt(jobIdStr);
            JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
            JobSeeker jobSeeker = jobSeekerDAO.getJobSeekerByAccountId(username);
            JobFavouriteDAO jobFavouriteDAO = new JobFavouriteDAO();
            int seekerID = jobSeeker.getId();
            boolean isDeleted = jobFavouriteDAO.deleteFavouriteJob(jobID, seekerID);
            if (isDeleted) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    Account account = (Account) session.getAttribute("account");
                    String userRole = "guest"; // Default user role
                    String displayName = ""; // Default display name
                    if (account != null) {
                        if (account.getRoleId() == 2) {
                            userRole = "jobseeker";
                            displayName = jobSeeker.getName(); // Reuse jobSeeker object
                            request.setAttribute("user", jobSeeker);
                        }
                    }
                    request.setAttribute("userRole", userRole);
                    request.setAttribute("displayName", displayName);

                    List<JobFavourite> favouriteJobs = new JobFavouriteDAO().getAllFavouriteJobsByJobSeekerId(jobSeeker.getId());
                    request.setAttribute("favouriteJobs", favouriteJobs);

                    request.getRequestDispatcher("jobseeker_editprofile_favouriteJob.jsp").forward(request, response);
                }
            }
        } catch (NumberFormatException e) {
            // Log the exception, inform the user, or handle it appropriately
        }
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
