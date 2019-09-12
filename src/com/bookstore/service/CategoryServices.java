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
	
	

}
