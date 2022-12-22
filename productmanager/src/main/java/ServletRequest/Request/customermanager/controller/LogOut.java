package ServletRequest.Request.customermanager.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogOut", urlPatterns = {"/logout"})
public class LogOut extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("username") != null) {
            httpSession.removeAttribute("username");
            httpSession.removeAttribute("password");
        }

        response.sendRedirect("/products");
    }
}
