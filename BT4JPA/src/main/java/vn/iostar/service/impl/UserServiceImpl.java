package vn.iostar.service.impl;

import java.util.List;

import vn.iostar.dao.UserDao;
import vn.iostar.dao.impl.UserDaoImpl;
import vn.iostar.entity.User;
import vn.iostar.service.UserService;

public class UserServiceImpl implements UserService{
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
	public User findByUsername(String username){
		return userDao.findByEmail(username);
	}
	
	
}
