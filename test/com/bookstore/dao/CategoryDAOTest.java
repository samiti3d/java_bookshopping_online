package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryDAOTest extends BaseDAOTest{

	private static CategoryDAO categoryDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		BaseDAOTest.setUpBeforeClass();
		categoryDAO = new CategoryDAO(entityManager);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateCategory() {
		Category newCategory = new Category("Java Core");
		
		Category category = categoryDAO.create(newCategory);
		
		assertTrue(category != null && category.getCategoryId() > 0);
		
	}

	@Test
	public void testUpdateCategory() {
		Category updateCat = new Category();
		int catId = 11;
		updateCat.setCategoryId(catId);
		updateCat.setName("PHP");
		
		Category category = categoryDAO.update(updateCat);
		
		assertEquals(updateCat.getName(), category.getName());
		
	}
	
	@Test
	public void testListAll() {
		List<Category> listCat = categoryDAO.listAll();
		listCat.forEach(c -> System.out.println(c.getName() + ", "));
		assertTrue(listCat.size() > 0);
	}

	@Test
	public void testGet() {
		
		int catId = 11;
		Category catDAO = categoryDAO.find(Category.class, catId);
		
		assertNotNull(catDAO);
	}

	@Test
	public void testDeleteCategory() {
		int catId =11;
		categoryDAO.delete(catId);
		
		Category catDAODelete = categoryDAO.get(catId);
		
		assertNull(catDAODelete);
	}

	@Test
	public void testCount() {
		
		long catCount = categoryDAO.count();
		
		assertEquals(0, catCount);
	}
	

}
