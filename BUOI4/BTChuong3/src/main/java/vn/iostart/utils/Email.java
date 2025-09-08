package vn.iostart.utils;

import java.util.Random;

import vn.iostart.model.User;

public class Email {
	//Sinh code random
	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}
	
	//Sendmail
	public boolean sendEmail(User user) {
		boolean test = false;
		user.getEmail();
		return test;
	}
}
