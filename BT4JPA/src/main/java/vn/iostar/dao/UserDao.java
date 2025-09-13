package vn.iostar.dao;

import java.util.List;

import vn.iostar.entity.User;

public interface UserDao {
	User create(User entity);

	User update(User entity);

	void remove(int id);

	User findById(int id);

	List<User> findAll();

	User findByEmail(String email);
	User findByUsername(String username);
}
