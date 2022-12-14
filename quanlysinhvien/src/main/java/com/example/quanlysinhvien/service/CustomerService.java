package com.example.quanlysinhvien.service;

import com.example.quanlysinhvien.module.Customer;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerService", value = "/customers")
public class CustomerService extends HttpServlet {
    private List<Customer> customers;


    public CustomerService() {
        customers = new ArrayList<>();
        customers.add(new Customer(1L, "Dang Van Quang", "28 NTP", "Viet Nam"));
        customers.add(new Customer(2L, "Dang Van Quý", "28 NTP", "Viet Nam"));
        customers.add(new Customer(3L, "Nguyen Quoc Cuong", "28 NTP", "Viet Nam"));
        customers.add(new Customer(4L, "Thuc Nguyen", "28 NTP", "Viet Nam"));
        customers.add(new Customer(5L, "Tan Dung", "28 NTP", "Viet Nam"));
    }

    public List<Customer> getAllCustomers() {
        return this.customers;
    }


    public void addCustomer(Customer customer) {
        customers.add(customer);
    }

    public Customer findCustomerById(long id) {
        for (Customer customer : customers) {
            if (customer.getId() == id) {
                return customer;
            }
        }
        return null;
    }

    public void updateCustomer(Customer customer) {
        for (Customer c : customers) {
            if (c.getId() == customer.getId()) {
                c.setName(customer.getName());
                c.setAddress(customer.getAddress());
                c.setCountry(customer.getCountry());
            }
        }
    }

    public void removeCustomer(long id) {
        List<Customer> customers = getAllCustomers();
        customers.removeIf(customer -> customer.getId() == id);

    }
}