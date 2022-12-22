package ServletRequest.Request.customermanager.controller;

import ServletRequest.Request.customermanager.exception.BrandInvalidException;
import ServletRequest.Request.customermanager.model.Brand;
import ServletRequest.Request.customermanager.model.Country;
import ServletRequest.Request.customermanager.model.Customer;
import ServletRequest.Request.customermanager.model.Product;
import ServletRequest.Request.customermanager.service.IBrandService;
import ServletRequest.Request.customermanager.service.IProductService;
import ServletRequest.Request.customermanager.service.jdbc.BrandServiceJDBC;
import ServletRequest.Request.customermanager.service.jdbc.ProductServiceJDBC;
import ServletRequest.Request.customermanager.utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products", ""})
public class ProductServlet extends HttpServlet {
    private IProductService productService;
    private IBrandService brandService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceJDBC();
        brandService = new BrandServiceJDBC();

        List<Brand> brandList = brandService.getAllBrand();
        System.out.println(brandList);
        if (getServletContext().getAttribute("brands") == null) {
            getServletContext().setAttribute("brands", brandList);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateProduct(req, resp);
                break;
            case "edit":
                showEditProduct(req, resp);
                break;
            case "delete":
                showDeleteProduct(req, resp);
                break;
            default:
                showListProduct(req, resp);
        }


    }

    private void showDeleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        Product product = productService.findProductById(id);

        req.setAttribute("product", product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/delete.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long idBrand = -1;
        String kw = "";
        int numberOfPage = 3;
        int page = 1;
        int i = 0;


        if (req.getParameter("idBrand") != null) {
            idBrand = Long.parseLong(req.getParameter("idBrand"));
        }
        if (req.getParameter("kw") != null) {
            kw = req.getParameter("kw");
        }
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

//        if (page - i < page && page < numberOfPage){
//            List<Product> products = productService.getAllProductsByKwAndIdBrandPagging(kw, idBrand,(page - 1) * numberOfPage, numberOfPage);
//
//            System.out.println(products);
//
//            req.setAttribute("kw", kw);
//            req.setAttribute("idBrand", idBrand);
//            req.setAttribute("products", products);
//        }

        List<Product> products = productService.getAllProductsByKwAndIdBrandPagging(kw, idBrand, (page - 1) * numberOfPage, numberOfPage);

        System.out.println(products);

        req.setAttribute("kw", kw);
        req.setAttribute("idBrand", idBrand);
        req.setAttribute("products", products);



        int noOfRecords = productService.getNoOfRecords();

        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / numberOfPage);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/index1.jsp");

        requestDispatcher.forward(req, resp);


    }

    private void showEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String error = null;
        Product product;
        try {
            long id = Long.parseLong(req.getParameter("id"));
            if ((product = productService.findProductById(id)) == null) {
                error = "ID customer not exists";
                req.setAttribute("error", error);
            } else {
                req.setAttribute("product", product);
            }
        } catch (NumberFormatException numberFormatException) {
            error = "ID customer not valid";
            req.setAttribute("error", error);
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showFormCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                insertProduct(req, resp);
                break;
            }
            case "edit":
                editProduct(req, resp);
                break;

            case "delete":
                deleteProduct(req, resp);
                break;
            default:
        }

    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        long id = Long.parseLong(req.getParameter("id"));
        productService.deleteProduct(id);
        resp.sendRedirect("/products");

//        List<String> errors = new ArrayList<>();
//        Product product = new Product();
//
//        RequestDispatcher requestDispatcher = null;
//        if (errors.isEmpty()) {
//            productService.updateProduct(product);
//            req.setAttribute("index", productService.getAllProducts());
//            requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/index.jsp");
//        } else {
//            req.setAttribute("errors", errors);
//            req.setAttribute("index", product);
//            requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/edit.jsp");
//        }
//        requestDispatcher.forward(req, resp);

    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Product product = new Product();


        validateIdView(errors, req, product);
        validateNameView(errors,req,product);
        validatePriceView(errors,req,product);
        validateQuantity(errors,req,product);
        validateBrandView(errors, req, product);

        RequestDispatcher requestDispatcher;
        if (errors.isEmpty()) {
            productService.updateProduct(product);
            req.setAttribute("index", productService.getAllProducts());
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/index.jsp");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("index", product);
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/edit.jsp");
        }
        requestDispatcher.forward(req, resp);


    }

    private boolean validateIdView(List<String> errors, HttpServletRequest req, Product product) {
        try {
            long id = Long.parseLong(req.getParameter("id"));
            if (productService.findProductById(id) == null) {
                throw new NullPointerException("Product not exists");
            }
            product.setId(id);
        } catch (NumberFormatException numberFormatException) {
            errors.add("ID product not valid");
            return false;
        } catch (NullPointerException nullPointerException) {
            errors.add(nullPointerException.getMessage());
            return false;
        }
        return true;

    }

    private void insertProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Product product = new Product();

        validateNameView(errors, req, product);// false
        validatePriceView(errors, req, product);
        validateQuantity(errors, req, product);
        validateBrandView(errors, req, product);
        if (errors.isEmpty()) {
            product.setId(productService.getAllProducts().size() + 1);
            productService.addProduct(product);
            req.setAttribute("message", "Them san pham thanh cong");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("product", product);
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/create.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void validateQuantity(List<String> errors, HttpServletRequest req, Product product) {
        int quantity = 0;
        try {
            String param = req.getParameter("quantity");
            if (param == null || param.trim().length() == 0) {
                errors.add("quantity is not empty ");
                return;
            }
            quantity = Integer.parseInt(param);
            if (quantity==0) {
                errors.add("quantity is > 0");
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Quantity is not invalid");
        }
        product.setQuantity(quantity);
    }

    private void validatePriceView(List<String> errors, HttpServletRequest req, Product product) {
        System.out.println(req.getParameter("price"));
        System.out.println(req.getParameter("quantity"));
        System.out.println(req.getParameter("idBrand"));
        System.out.println(req.getParameter("name"));

        BigDecimal price = null;
        try {
            String param = req.getParameter("price");
            if (param == null || param.trim().length() == 0) {
                errors.add("Price is not empty");
                return;
            }
            price = new BigDecimal(param);

        } catch (Exception exception) {
            errors.add("Price is not invalid");
        }
        product.setPrice(price);

    }

    private void validateBrandView(List<String> errors, HttpServletRequest req, Product product) {
        long idBrand = -1;

        try {
            idBrand = Long.parseLong(req.getParameter("idBrand"));
            // kiem tra brand co hop le hay khong
            if (brandService.findBrandById(idBrand) == null) {
                throw new BrandInvalidException("Brand is exists");
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Brand is not valid");
        } catch (BrandInvalidException brandInvalidException) {
            errors.add(brandInvalidException.getMessage());
        }
        product.setIdBrand(idBrand);
    }


    private void validateNameView(List<String> errors, HttpServletRequest req, Product product) {
        String name = req.getParameter("name");
        product.setName(name);
        if (name.equals("")) {
            errors.add("Name is not empty");
        } else {
            if (ValidateUtils.isNameValid(name) == false) {
                errors.add("Name not valid. Start with Uppercase");
            }
        }
    }
}
