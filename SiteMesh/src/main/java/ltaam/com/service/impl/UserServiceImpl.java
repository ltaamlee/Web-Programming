package ltaam.com.service.impl;

import java.util.List;

import ltaam.com.dao.UserDao;
import ltaam.com.dao.impl.UserDaoImpl;
import ltaam.com.entity.User;
import ltaam.com.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserServiceImpl() {
		this.userDao = new UserDaoImpl();
	}

	@Override
	public User login(String username, String password) {
		User user = userDao.findByUsername(username);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	@Override
	public User create(User entity) {
		return userDao.create(entity);
	}

	@Override
	public User update(User entity) {
		return userDao.update(entity);
	}

	@Override
	public void remove(int id) {
		userDao.remove(id);
	}

	@Override
	public User findById(int id) {
		return userDao.findById(id);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public User findByEmail(String email) {
		return userDao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		return userDao.findByEmail(username);
	}
}
