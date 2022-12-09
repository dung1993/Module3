package com.example.productdiscountcaculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Product Discount Calculator", value = "/display-discount")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("Product Description");
        float listPrice = Float.parseFloat(req.getParameter("List Price"));
        int discountPercent = Integer.parseInt(req.getParameter("Discount Percent"));

        double discountAmount = listPrice*discountPercent*0.01;
        double price = listPrice - discountAmount;

        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h1>Product Description: " + productDescription + "</h1>");
        printWriter.println("<h1>List Price: " + listPrice + "</h1>");
        printWriter.println("<h1>Discount Percent: " + discountPercent + "</h1>");
        printWriter.println("<h1>Discount Amount: " + discountAmount + "</h1>");
        printWriter.println("<h1>Price: " + price + "</h1>");
        printWriter.println("</html>");
    }
}