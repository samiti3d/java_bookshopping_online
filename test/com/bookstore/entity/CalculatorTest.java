package com.bookstore.entity;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculatorTest {

	@Test
	public void testAdd() {
		Calculator calculator = new Calculator();
		int a = 10;
		int b = 5;
		int result = calculator.add(a,b);
		
		int expected = 15;
		
		assertEquals(expected, result);
		
	}

}
