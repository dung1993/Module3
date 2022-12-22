package ServletRequest.Request.customermanager.service.jdbc;

import ServletRequest.Request.customermanager.model.Brand;
import ServletRequest.Request.customermanager.model.Country;
import ServletRequest.Request.customermanager.service.IBrandService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandServiceJDBC extends DatabaseContext implements IBrandService {
    private static final String SELECT_ALL_BRAND = "select * from brand;";
    private static final String FIND_BRAND_BY_ID = "select * from brand where id = ";
    private static final String SP_INSERT_BRAND = "call spInsertBrand(?, ?);";


    @Override
    public List<Brand> getAllBrand() {
        List<Brand> brands = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BRAND);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Brand brand = getBrandFromResulSet(rs);
                brands.add(brand);
            }
            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return brands;
    }

    private Brand getBrandFromResulSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");


        Brand brand = new Brand(id, name);
        return brand;
    }

    @Override
    public Brand findBrandById(long id) {
        try{
            Connection connection = getConnection();

            Statement statement = connection.createStatement();
            String query = FIND_BRAND_BY_ID + id;
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Brand brand = getBrandFromResulSet(rs);
                return brand;
            }
            connection.close();
        }catch (SQLException sqlException){
            printSQLException(sqlException);
        }
        return null;
    }

    @Override
    public boolean insertBrandBySP(String nameBrand) {
        boolean check = false;
        try {
            // spInsertCountry(?, ?);
            Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(SP_INSERT_BRAND);
            callableStatement.setString(1, nameBrand);
            callableStatement.registerOutParameter(2, Types.BOOLEAN);

            System.out.println(this.getClass() + " insertBrandBySP: " + callableStatement);
            callableStatement.execute();

            check = callableStatement.getBoolean(2);

        } catch (SQLException sqlException) {
            printSQLException(sqlException);


        }
        return check;
    }

    @Override
    public boolean testProcedure() {

        Connection connection = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `brand` (`id`, `name`) VALUES ('7', 'Predator')");
            preparedStatement.executeUpdate();

            connection.prepareStatement("INSERT INTO `brand` (`id`, `name`) VALUES ('6', 'Corsair')");
            preparedStatement.executeUpdate();

            connection.commit();
            connection.close();
        } catch (SQLException sqlException) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            printSQLException(sqlException);

        }
        return false;
    }

}
