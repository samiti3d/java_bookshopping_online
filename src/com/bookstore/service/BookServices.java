package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices {
	
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();
	}
	
	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}
	
	public void listBooks(String message) throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		
		if(message != null) {
			request.setAttribute("status", message);
		}
		
		request.setAttribute("listBooks", listBooks);
		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request,response);
	}

	public void showBookNewForm() throws ServletException, IOException {
		List<Category> categoryLists = categoryDAO.listAll();
		request.setAttribute("categories", categoryLists);
		
		String page = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request,response);
	}

	public void creatBook() throws ServletException, IOException {

		String title = request.getParameter("title");
		Book existBook = bookDAO.findByTitle(title);
		if(existBook != null) {
			request.setAttribute("status", "The title alreay exists.");
			listBooks();
			return;
		}
		
		Book newBook = new Book();
		readBookFields(newBook);
		
		Book createdBook = bookDAO.create(newBook);
		if(createdBook.getBookId() > 0) {
			String message = "New Book Created";
			request.setAttribute("status", message);
			
			listBooks();
		}
	}
	
	public void readBookFields(Book book) throws IOException, ServletException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishDate;

		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		}catch(ParseException ex){
			ex.printStackTrace();
			throw new ServletException("Error publish date");
		}
				
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPrice(price);
		book.setPublishedDate(publishDate);
	
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		Category category = categoryDAO.get(categoryId);
		book.setCategory(category);
		
		Part part = request.getPart("bookImage");
		if(part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageByte = new byte[(int) size];
			
			InputStream inputstream = part.getInputStream();
			inputstream.read(imageByte);
			inputstream.close();
			
			book.setImage(imageByte);
		}
	}
	
	public void editBook() throws ServletException, IOException {
		
		int bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("book", book);
		System.out.println("Before dispatcher to some page");
	
		String page = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request,response);
	}

	public void updateBook() throws IOException, ServletException {
		
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		Book bookTitle = bookDAO.findByTitle(title);

		Book existBook = bookDAO.get(bookId);		
		
		if(existBook == null) {
			String message = "No Book ID found!";
			listBooks(message);
		}
				
		if(!existBook.equals(bookTitle) && bookTitle != null) {
			System.out.println("Cannot update book!...");
			String message = "Cannot save the title, Please check!";
			listBooks(message);
			return;
		}
		
		readBookFields(existBook);
		bookDAO.update(existBook);
		String message = "Updated Book successfully";
		listBooks(message);
			
	}

	public void deleteBook() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("id"));
		Book existBook = bookDAO.get(bookId);
		
		if(existBook != null) {
			bookDAO.delete(bookId);
			String message = "The book is deleted complately";
			listBooks(message);
		}else {
			String message = "No book found! please check other.";
			listBooks(message);
		}
		
	}

	public void listByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<Category> listCategory = categoryDAO.listAll();
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		Category category = categoryDAO.get(categoryId);
		
		if(listBooks.size() > 0) {
			request.setAttribute("listBooks", listBooks);
		}else {
			request.setAttribute("status", "Empty Book");
		}
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("category", category);
		
		String page = "/frontend/book_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request, response);
	}

	public void viewBookDetail() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("id"));
		
		Book book = bookDAO.get(bookId);
		if(book == null) {
			request.setAttribute("status", "Sorry, the book with ID " + bookId + "is not available.");
		}else {
			request.setAttribute("book", book);
		}
		
		String page = "/frontend/book_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request,response);
		
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Book> result = null;
		
		if(keyword.equals("")) {
			result = bookDAO.listAll();
		}else {
			result = bookDAO.search(keyword);
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);
		
		String page = "/frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request,response);
	}

}
