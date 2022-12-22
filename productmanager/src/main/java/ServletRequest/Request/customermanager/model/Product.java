package ServletRequest.Request.customermanager.model;

import java.math.BigDecimal;

public class Product {
    private long id;
    private String name;
    private BigDecimal price;
    private int quantity;
    private long idBrand;

    public Product() {
    }

    public Product(long id, String name, BigDecimal price, int quantity, long idBrand) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.idBrand = idBrand;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getIdBrand() {
        return idBrand;
    }

    public void setIdBrand(long idBrand) {
        this.idBrand = idBrand;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", idBrand=" + idBrand +
                '}';
    }
}
