package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest extends BaseDAOTest {
	
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDAO = new BookDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		
		Book newBook = new Book();
		
//		CategoryDAO categoryDAO = new CategoryDAO(entityManager);
//		Category category = categoryDAO.get(11);
//		newBook.setCategory(category);
		
		Category category = new Category("Ruby");
		newBook.setCategory(category);
		
		newBook.setTitle("RubyConfTH");
		newBook.setAuthor("samiti");
		newBook.setDescription("hello this is kotlinxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
		newBook.setPrice(12.37f);
		newBook.setIsbn("0028796299");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishedDate = dateFormat.parse("10/21/1989");
		newBook.setPublishedDate(publishedDate );
		
		String imagePath = "/Users/natchanon/Desktop/java001.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
		
	}
	
	@Test
	public void testCreateSecondBook() throws ParseException, IOException {
		
		Book newBook = new Book();
				
		Category category = new Category("Julia Programming");
		newBook.setCategory(category);
		
		newBook.setTitle("Julia Progs");
		newBook.setAuthor("samiti");
		newBook.setDescription("This is julia programming");
		newBook.setPrice(10.37f);
		newBook.setIsbn("0028796291");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishedDate = dateFormat.parse("10/21/2000");
		newBook.setPublishedDate(publishedDate );
		
		String imagePath = "/Users/natchanon/Desktop/java001.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
		
	}

	@Test
	public void testUpdateBook() throws ParseException, IOException {
		
		Book newBook = new Book();
		newBook.setBookId(39);
		
		Category category = new Category("Julia");
		category.setCategoryId(13);
		newBook.setCategory(category);
		
		newBook.setTitle("Julia Statistics");
		newBook.setAuthor("samiti");
		newBook.setDescription("lorem ipsum idor...");
		newBook.setPrice(22.37f);
		newBook.setIsbn("0028796219");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishedDate = dateFormat.parse("10/21/1989");
		newBook.setPublishedDate(publishedDate );
		
		String imagePath = "/Users/natchanon/Desktop/java001.jpg";
		
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book updatedBook = bookDAO.update(newBook);
		
		assertEquals(newBook.getTitle(), updatedBook.getTitle());
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDelete() throws Exception {
		Integer bookId = 111;
		bookDAO.delete(bookId);
	}
	
	@Test
	public void testDeleteSuccessfully() throws Exception{
		Integer bookId = 38;
		bookDAO.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testGetFailed() {
		int bookId = 11;
		Book book = bookDAO.get(bookId);
		assertNull(book);
	}
	
	@Test
	public void testGetSuccessfully(){
		int bookId = 35;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBooks = bookDAO.listAll();
		for(Book book :listBooks) {
			System.out.println(book.getTitle() + "<br>");
		}
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void findByTitleNotExist() {
		String title = "Julia Statisticss";
		Book book = bookDAO.findByTitle(title);
		assertNull(book);
	}
	
	@Test
	public void findByTitleExist() {
		String title = "Julia Statistics";
		Book book = bookDAO.findByTitle(title);
		assertNotNull(book);
	}
	
	@Test
	public void countAll() {
		long totalBooks = bookDAO.count();
		assertEquals(2, totalBooks);
		
	}
	
	@Test 
	public void equlTest() {
		
		String title = "robocop";
		Book bookByTitle = bookDAO.findByTitle(title);
		int bookId = bookByTitle.getBookId();
		System.out.println(bookId);
		
		Book book = bookDAO.get(40);
		
		if(book.getBookId() != bookId) {
			System.out.println("diff");
			return;
		}
		
		System.out.println("the same");
		
	}
	
	@Test 
	public void equlxTest() {
		
		String title = "robocop";
		Book bookByTitle = bookDAO.findByTitle(title);
		int bookId = bookByTitle.getBookId();
		System.out.println(bookId);
		
		Book book = bookDAO.get(35);
		
		if(!book.equals(bookByTitle)) {
			System.out.println("diff");
			return;
		}
		
		System.out.println("the same");
		
	}
	
	
}
