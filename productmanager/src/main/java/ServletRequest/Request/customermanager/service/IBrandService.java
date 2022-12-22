package ServletRequest.Request.customermanager.service;

import ServletRequest.Request.customermanager.model.Brand;
import ServletRequest.Request.customermanager.model.Country;

import java.util.List;

public interface IBrandService {
    List<Brand> getAllBrand();
    Brand findBrandById(long id);

    boolean insertBrandBySP(String nameBrand);


    boolean testProcedure();
}
