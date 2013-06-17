package com.aisino2.jdy.test;

public class SimpleTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(String.format("%03d", 1204));
		System.out.println(Integer.parseInt("021"));
		java.util.regex.Pattern.matches("\\{[\\w_\\d]*\\}", "sdfsdfsaf{ffff}sdfsdf");
	}

}
