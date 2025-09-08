package vn.iostart.service.impl;

import vn.iostart.dao.UserDao;
import vn.iostart.dao.impl.UserDaoImpl;
import vn.iostart.model.User;
import vn.iostart.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public User login(String username, String password) {
		
		// Check from DB
		User user = userDao.get(username);
		if (user != null && password.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public User get(String username) {
		return userDao.get(username);
	}

	@Override
//	public boolean register(String username, String password, String email, String fullname, String phone) {
//		if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
//		    return false;
//		}
//		long millis = System.currentTimeMillis();
//		java.sql.Date date = new java.sql.Date(millis);
//		userDao.insert(new User(email, username, fullname, password, null, 5, phone, date));
//		return true;
//	}
	public boolean register(String email, String password, String username, String fullname, String phone) {
	    if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
	        return false;
	    }
	    long millis = System.currentTimeMillis();
	    java.sql.Date date = new java.sql.Date(millis);
	    try {
	        userDao.insert(new User(email, username, fullname, password, null, 3, phone, date));
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}



	public boolean checkExistEmail(String email) {
		return userDao.checkExistEmail(email);
	}

	public boolean checkExistUsername(String username) {
		return userDao.checkExistUsername(username);
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDao.checkExistPhone(phone);
	}

	@Override
	public void insert(User user) {
		userDao.insert(user);
	}

}
