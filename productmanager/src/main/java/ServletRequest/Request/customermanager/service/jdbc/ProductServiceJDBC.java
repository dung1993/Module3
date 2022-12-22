package ServletRequest.Request.customermanager.service.jdbc;



import ServletRequest.Request.customermanager.model.Customer;
import ServletRequest.Request.customermanager.model.Product;
import ServletRequest.Request.customermanager.service.IProductService;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceJDBC extends DatabaseContext implements IProductService {
    private static final String SELECT_ALL_PRODUCT = "select * from `product`;";
    private static final String INSERT_PRODUCT = "INSERT INTO `product` (`name`, `price`, `quantity`,`idBrand`) VALUES (?, ?, ?, ?);";
    private static final String FIND_BY_ID = "select * from `product` where id = ";
    private static final String SP_GET_ALL_PRODUCT_BY_ID_BRAND = "call spGetAllProductByIdBrand(?);";
    private static final String DELETE_PRODUCT = "DELETE FROM `product` WHERE (`id` = ?);";
    private static final String SELECT_PRODUCTS_BY_KW_ID_BRAND = "SELECT * FROM `product` where idBrand = ? and name like ?;";
    private static final String SELECT_PRODUCTS_BY_KW_ALL_BRAND = "SELECT * FROM `product` where `name` like ?;";
    private static final String SELECT_PRODUCTS_BY_KW_ALL_BRAND_PAGGING = "SELECT SQL_CALC_FOUND_ROWS * FROM `product` where `name` like ? limit ? offset ?;";
    private static final String SELECT_PRODUCTS_BY_KW_ID_BRAND_PAGGING = "SELECT SQL_CALC_FOUND_ROWS * FROM `product` where idBrand = ? and `name` like ? limit ? offset ? ;";
    private static final String UPDATE_PRODUCT = "UPDATE `product` SET `name` = ? ,`price` = ? ,`idBrand` = ?  WHERE `id` = ?;";

    private int noOfRecords;
    @Override
    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                Product product = getProductFromResultSet(rs);
                products.add(product);
            }
            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return products;
    }

    @Override
    public List<Product> getAllProductsByKwAndIdBrand(String kw, long idBrand) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement;
            if (idBrand == -1) {
                //SELECT * FROM product where name like ?";
                preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_KW_ALL_BRAND);
                preparedStatement.setString(1, "%" + kw + "%");
            }else{
                //SELECT * FROM customer where idCountry = ? and name like ?;";
                preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_KW_ID_BRAND);
                preparedStatement.setLong(1, idBrand);
                preparedStatement.setString(2,"%" + kw + "%");
            }
            System.out.println(this.getClass() + " getAllProductsByKwAndIdBrand: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               Product product = getProductFromResultSet(rs);
                products.add(product);
            }

            connection.close();
        } catch (SQLException sqlException) {
            
        }
        return products;
    }

    @Override
    public List<Product> getAllProductsByKwAndIdBrandPagging(String kw, long idBrand, int offset, int numberOfPage) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement;
            if (idBrand == -1) {
                //SELECT * FROM Product where name like ? limit ?, ?;
                preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_KW_ALL_BRAND_PAGGING);
                preparedStatement.setString(1, "%" + kw + "%");
                preparedStatement.setInt(3,offset);
                preparedStatement.setInt(2,numberOfPage);
            }else{
                //SELECT * FROM customer where idBrand = ? and name like ? limit ? , ? ";
                preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_KW_ID_BRAND_PAGGING);
                preparedStatement.setLong(1, idBrand);
                preparedStatement.setString(2,"%" + kw + "%");
                preparedStatement.setInt(4,offset);
                preparedStatement.setInt(3,numberOfPage);
            }
            System.out.println(this.getClass() + " getAllProductsByKwAndIdBrandPagging: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = getProductFromResultSet(rs);
                products.add(product);
            }
            System.out.println(this.getClass() + " getAllCustomersByKwAndIdCountry: " + preparedStatement);
            rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");

            while (rs.next()) {
                noOfRecords = rs.getInt(1);
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return products;
    }

    private Product getProductFromResultSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        BigDecimal price = rs.getBigDecimal("price");
        int quantity = rs.getInt("quantity");
        int idBrand = rs.getInt("idBrand");

        Product product = new Product(id, name, price, quantity, idBrand);
        return product;
    }



    @Override
    public void addProduct(Product product) {
        try {
            //INSERT INTO `customer` (`name`, `price`, quantity,`idBrand`) VALUES (?, ?, ?, ?);";
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setBigDecimal(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setLong(4, product.getIdBrand());

            preparedStatement.executeUpdate();

            connection.close();
        }catch (SQLException sqlException){
            printSQLException(sqlException);
        }


    }

    @Override
    public Product findProductById(long id) {

        try{
            Connection connection = getConnection();

            Statement statement = connection.createStatement();
            String query = FIND_BY_ID + id;
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Product product = getProductFromResultSet(rs);
                return product;
            }
            connection.close();
        }catch (SQLException sqlException){
            printSQLException(sqlException);
        }
        return null;
    }

    @Override
    public void updateProduct(Product product) {
        //UPDATE_CUSTOMER = "UPDATE `customer` SET `name` = ? ,`price` = ? ,`idBrand` = ?  WHERE `id` = ?;";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setBigDecimal(2,product.getPrice());

            preparedStatement.setLong(3,product.getIdBrand());
            preparedStatement.setLong(4,product.getId());


            System.out.println(this.getClass() + " update customer: " + preparedStatement);
            preparedStatement.executeUpdate();
            connection.close();
        }catch (SQLException sqlException){
            printSQLException(sqlException);
        }
    }

    @Override
    public void deleteProduct(long id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setLong(1, id);

            System.out.println(this.getClass() + " deleteCustomer: " + preparedStatement);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public List<Product> getAllProductByIdBrand(long idBrand) {
        // ?,?
        List<Product> products = new ArrayList<>();
        try {
            Connection connection  = getConnection();
            CallableStatement callableStatement = connection.prepareCall(SP_GET_ALL_PRODUCT_BY_ID_BRAND);
            callableStatement.setLong(1, idBrand);

            System.out.println(this.getClass() + " getAllCustomerByIdCountry: " + callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Product product = getProductFromResultSet(rs);
                products.add(product);
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return products;
    }

    @Override
    public int getNoOfRecords() {
        return this.noOfRecords;
    }
}
