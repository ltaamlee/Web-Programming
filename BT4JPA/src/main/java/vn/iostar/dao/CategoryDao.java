package vn.iostar.dao;

import java.util.List;

import vn.iostar.entity.Category;

public interface CategoryDao {
	Category get(int id);

	Category create(Category entity);

	Category update(Category entity);

	void remove(int id);

	Category findById(int id);

	List<Category> findAll();

	boolean isExistName(String name);

	boolean isExistName(String name, int userId);

	List<Category> findByUser(int userId);

}
