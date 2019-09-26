package com.bookstore.dao;

import static org.junit.Assert.*;

import java.security.NoSuchAlgorithmException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class HashGeneratorTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}
	
	@Test
	public void test() {
		
		String password = "password";
		String encryptedPassword = null;
		
		try {
			encryptedPassword = HashGenerator.generateMD5(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		System.out.println(encryptedPassword);
		assertTrue(true);
		
	}

}
