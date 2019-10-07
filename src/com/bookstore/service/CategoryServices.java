package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class CategoryServices  {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response, EntityManager entityManager) {
		this.request = request;
		this.response = response;		
		categoryDAO = new CategoryDAO();

	}
	
	public void listCategory() throws ServletException, IOException{
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("categoryList", listCategory);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("category_list.jsp");
		requestDispatcher.forward(request,response);
		
	}
	
	public void createCategory() throws ServletException, IOException{
		String category = request.getParameter("category");
		
		Category categoryExist = categoryDAO.findByName(category);
		String status = "Couldn't create the category";
		
		if(categoryExist != null){
			request.setAttribute("message", status);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("category_form.jsp");
			requestDispatcher.forward(request, response);
			
		}else{
			
			Category newCategory = new Category(category);
			String message = "Category has been created";
			categoryDAO.create(newCategory);
			request.setAttribute("status", message);
			listCategory();
			
		}
		
	}

	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category categoryExist = categoryDAO.get(categoryId);
		
		if(categoryExist != null ){
			Category category = categoryDAO.get(categoryId);
			request.setAttribute("category", category);
			
			String page = "category_form.jsp";
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
			requestDispatcher.forward(request, response);
			
		}else{
			
			request.setAttribute("status", "Sorry, This Id - " 
			+ categoryId + " does not exist!");
			
			listCategory();
			
		}
	}
	
	public void updateCategory() throws ServletException, IOException{
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("category");
		
		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);
				
		if(categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()){
			request.setAttribute("status", "This category has been existed");
			request.setAttribute("category", categoryById);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("category_form.jsp");
			requestDispatcher.forward(request, response);
			
			
			
		}else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			
			request.setAttribute("status", "Category Updated!");
			listCategory();
		}
		
	}

	public void deleteCategory() throws ServletException, IOException {
		
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category categoryById = categoryDAO.get(categoryId);
		BookDAO bookDAO = new BookDAO();
		long numberOfBooks = bookDAO.countByCategory(categoryId);
		
		if(numberOfBooks > 0) {
			String message = "Cannot Delete! This ID: %d contains some book.";
			message = String.format(message, numberOfBooks);
			request.setAttribute("status", message);
		}else {
			if(categoryById != null){
				categoryDAO.delete(categoryId);
				request.setAttribute("status", "User ID " + categoryId + " has been deleted");
			}else{
				request.setAttribute("status", "No Category ID " + categoryId +  "found");
			}
		}
		
		listCategory();
	}
	
	

}
