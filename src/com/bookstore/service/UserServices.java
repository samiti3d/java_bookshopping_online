package com.bookstore.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

public class UserServices {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public UserServices(HttpServletRequest request,  HttpServletResponse response) {
		
		this.request = request;
		this.response = response;
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		entityManager = entityManagerFactory.createEntityManager();
		
		userDAO = new UserDAO(entityManager);
	}
	
	public void listuser() throws ServletException, IOException{
		listUser(null);
	}

	public void listUser(String message) throws ServletException, IOException{
		
		List<Users> listUsers = userDAO.listAll();
		
		request.setAttribute("listUsers", listUsers);
		
		if( message != null) {
			request.setAttribute("status", message);
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list.jsp");
		requestDispatcher.forward(request,response);		
	}
	
	public void listUser(String message, String page) throws ServletException, IOException{
		
		List<Users> listUsers = userDAO.listAll();
		
		request.setAttribute("listUsers", listUsers);
		
		if( message != null) {
			request.setAttribute("status", message);
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
		requestDispatcher.forward(request,response);		
	}
	
	public void createUser() throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users userChkEmail = userDAO.findByEmail(email);
		
		if(userChkEmail != null){
			
			String message = "This email already exists";
			listUser(message);
			
		}else {
			Users newUser = new Users(email, fullName, password);
			userDAO.create(newUser);
			response.setCharacterEncoding("UTF-8");
			
			String message = "User created successfully!";
			listUser(message);

		}
		
	}
	
	public void editUser() throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("id"));
		Users userById = userDAO.get(userId);
	
		if(userById != null){
			String editPage = "user_form.jsp";
			request.setAttribute("user", userById);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage );
			requestDispatcher.forward(request, response);
		}
	}

	public void updateUser() throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users userById = userDAO.get(userId);
		Users userByEmail = userDAO.findByEmail(email);
		
		if(userByEmail != null && userByEmail.getUserId() != userById.getUserId()){
			String message = "Coudn't update the user";
			listUser(message, "user_form.jsp");
	
		}else{
			Users user = new Users(userId, email, fullName, password);
			userDAO.update(user);
			
			String message = "User has been updated successfully";
			listUser(message);				
		}
	
	}

	public void deleteUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDAO.delete(userId);
		String message = "User has been deleted";
		listUser(message, "user_list.jsp");		
	}

}
