package ServletRequest.Request.customermanager.service;

import ServletRequest.Request.customermanager.model.Customer;
import ServletRequest.Request.customermanager.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProducts();

    List<Product> getAllProductsByKwAndIdBrand(String kw, long idBrand);
    List<Product> getAllProductsByKwAndIdBrandPagging(String kw, long idBrand, int page, int numberOfPage);
    void addProduct(Product product);
    Product findProductById(long id);
    void updateProduct(Product product);
    void deleteProduct(long id);

    List<Product> getAllProductByIdBrand(long idProduct);

    int getNoOfRecords();
}
