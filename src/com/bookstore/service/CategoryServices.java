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

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices  {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private EntityManager entityManager;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response, EntityManager entityManager) {
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;
		
		categoryDAO = new CategoryDAO(entityManager);

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
		int categoryById = Integer.parseInt(request.getParameter("id"));
		
		if(categoryById == (int)categoryById ){
			Category category = categoryDAO.get(categoryById);
			request.setAttribute("category", category);
			
			String page = "category_form.jsp";
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
			requestDispatcher.forward(request, response);
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
	
	

}
