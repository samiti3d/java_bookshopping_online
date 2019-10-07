package com.bookstore.dao;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {

	private static CustomerDAO customerDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO =  new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	public void testCreate() {
		
		Customer customer = new Customer();
		customer.setEmail("1412@gmail.com");
		customer.setFirstname("John");
		customer.setLastname("Dev");
		customer.setAddress("GooseHollow apt. Tigard");
		customer.setCity("Portland");
		customer.setCountry("USA");
		customer.setPhone("0927876564");
		customer.setZipcode("97035");
		customer.setPassword("admin");
		Customer createdCustomer = customerDAO.create(customer);
		System.out.println(createdCustomer.getCustomerId());
		
		assertTrue(createdCustomer.getCustomerId() > 0);
		
	}
	
	@Test
	public void testGet() {
		int id = 4;
		Customer getCustomer = customerDAO.get(id);
		assertNotNull(getCustomer);
	}
	
	@Test
	public void testUpdate() {
		Customer customer = customerDAO.get(4);
		customer.setFirstname("udie");
		
		Customer updatedCus = customerDAO.update(customer);
		
		assertTrue(updatedCus.getFirstname().equals("udie"));
	}
	
	@Test
	public void testDelete() {
		int customerId = 4;
		customerDAO.delete(customerId);
		
		Customer customer = customerDAO.get(customerId);
		assertNull(customer);
	}

}
