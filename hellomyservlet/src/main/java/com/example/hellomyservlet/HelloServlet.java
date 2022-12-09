package com.example.hellomyservlet;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "tudienServlet" , urlPatterns = {"/tudien"})
public class HelloServlet extends HttpServlet {
    private Map<String, String> tudien = new HashMap<>();

    public void init() throws ServletException {
        tudien.put("Japan", "Nhat Ban");
        tudien.put("Apple","qua tao");
        tudien.put("pig","con heo");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/tudien.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String keyword = req.getParameter("keyword");

       String result = tudien.get(keyword);

       Set<String> keys = tudien.keySet();
       req.setAttribute("kq",result);
       req.setAttribute("keys",keys);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/tudien.jsp");
        requestDispatcher.forward(req, resp);
    }

    public void destroy() {
    }
}