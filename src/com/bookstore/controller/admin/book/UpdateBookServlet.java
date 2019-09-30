package com.bookstore.controller.admin.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.admin.BaseServlet;
import com.bookstore.service.BookServices;

@WebServlet("/admin/update_book")
@MultipartConfig(
		fileSizeThreshold = 1028*10, //10kb
		maxFileSize = 1024*300, //300kb
		maxRequestSize = 1024*1024 //1mb
)
public class UpdateBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateBookServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request, response, entityManager);
		bookServices.updateBook();
	}

}
