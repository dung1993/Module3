package com.example.quanlysinhvien.module;

import java.util.Objects;

public class Customer {
    private long id;
    private String Name;
    private String address;
    private String country;

    public Customer(){

    }

    public Customer(long id, String name, String address, String country) {
        this.id = id;
        Name = name;
        this.address = address;
        this.country = country;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Customer customer = (Customer) o;
        return id == customer.id && Objects.equals(Name, customer.Name) && Objects.equals(address, customer.address) && Objects.equals(country, customer.country);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, Name, address, country);
    }
}
