package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setUpClass(){
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		entityManager = entityManagerFactory.createEntityManager();
		
		userDAO = new UserDAO(entityManager);
	}
	

	@Test
	public void test() {

		Users user1 = new Users();

		user1.setFullName("celica rov23");
		user1.setEmail("celica123_23@gmail.com");
		user1.setPassword("123456789");

		//Move to @BeforeClass
//		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
//		EntityManager entityManager = entityManagerFactory.createEntityManager();

		//Move to userDAO Class
//		entityManager.getTransaction().begin();
//		entityManager.persist(user1);
//		entityManager.getTransaction().commit();
		
		user1 = userDAO.create(user1);

		assertTrue(user1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet(){
		Users user1 = new Users();
				
		userDAO.create(user1);
	}
	
	@Test
	public void testGetUsersFound(){
		
		Integer userId = 9;
		Users user = userDAO.get(userId);
		
		if(user != null) {
			System.out.println(user.getFullName());
		}
		
		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound(){
		Integer userId = 99;
		Users user = userDAO.get(userId);
		
		assertNull(user);
		
	}
	
	@Test
	public void testUpdateUsers() {
        //Entity
		Users user = new Users();
		user.setUserId(9);
		user.setEmail("");
		user.setPassword("55555555555");
		user.setFullName("rov gotupdated");
		
		user = userDAO.update(user);
		
		String expected = "rov gotupdated";
		String  actual = user.getFullName();
		
		assertEquals(expected, actual);	
	}
	
	@Test
	public void testDeleteUsers(){
		
		Integer userId = 13;
		userDAO.delete(userId);
		
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test
	public void testListAll(){
		
		List<Users> listUsers = userDAO.listAll();
		
		for(Users user : listUsers){
			
			System.out.println(user.getFullName());
		}
		
		assertTrue(listUsers.size() > 0);
	}
	
	@Test
	public void testCountAll(){
		long totalUsers = userDAO.count();
		assertEquals(7, totalUsers);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "dekdporhonk@gmail.com";
		Users userEmail = userDAO.findByEmail(email);
		
		assertNotNull(userEmail);
	}
	
	@Test
	public void testUsersLogin(){
		String email = "admin38@gmail.com ";
		String password = "natchanongood";
		
		boolean checkLogin = userDAO.checkUserLogin(email, password);
		assertTrue(checkLogin);
		
	}
	
	@AfterClass
	public static void tearDownClass() {
		entityManager.close();
		entityManagerFactory.close();
	}


}
