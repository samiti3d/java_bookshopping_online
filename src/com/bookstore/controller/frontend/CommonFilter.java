package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

@WebFilter("/*")
public class CommonFilter implements Filter {

	private final CategoryDAO categoryDAO;
	
    public CommonFilter() {
    	categoryDAO = new CategoryDAO();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String path = httpRequest.getRequestURI();
		
		System.out.println("path => " + path);
		System.out.println("Context path => " + httpRequest.getContextPath());
		System.out.println("Context path => " + httpRequest.getContextPath().length());
		System.out.println("Get tails path => " + httpRequest.getRequestURI().substring(httpRequest.getContextPath().length()));

		if(!path.startsWith("/admin/")) {
			System.out.println("Category List Attribute");
			List<Category> categoryList = categoryDAO.listAll();
			request.setAttribute("listCategory", categoryList);
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
