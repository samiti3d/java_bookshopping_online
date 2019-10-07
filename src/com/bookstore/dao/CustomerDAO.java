package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}
	
	@Override
	public Customer get(Object id) {
		return super.find(Customer.class, id);
	}
	
	public Customer update(Customer customer) {
		return super.update(customer);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
	}

	@Override
	public List<Customer> listAll() {
		return null;
	}

	@Override
	public long count() {
		return 0;
	}


}
