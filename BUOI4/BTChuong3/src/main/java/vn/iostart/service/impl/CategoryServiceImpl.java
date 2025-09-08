package vn.iostart.service.impl;

import java.io.File;
import java.util.List;

import vn.iostart.dao.CategoryDao;
import vn.iostart.dao.impl.CategoryDaoImpl;
import vn.iostart.model.Category;
import vn.iostart.service.CategoryService;
import vn.iostart.utils.Constant;

public class CategoryServiceImpl implements CategoryService {
	CategoryDao categoryDao = new CategoryDaoImpl();

	@Override
	public void insert(Category category) {
		categoryDao.insert(category);
	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
	}

	@Override
	public void edit(Category newCategory) {
		Category oldCategory = categoryDao.get(newCategory.getCateid());
		oldCategory.setCatename(newCategory.getCatename());
		if (newCategory.getIcon() != null) {
			// XOA ANH CU DI
			String fileName = oldCategory.getIcon();
			final String dir = Constant.DIR;
			File file = new File(dir + "/category" + fileName);
			if (file.exists()) {
				file.delete();
			}
			oldCategory.setIcon(newCategory.getIcon());
		}
		categoryDao.edit(oldCategory);
	}

	@Override
	public Category get(int id) {
		return categoryDao.get(id);
	}

	@Override
	public Category get(String name) {
		return categoryDao.get(name);
	}

	@Override
	public List<Category> getAll() {
		return categoryDao.getAll();
	}

	@Override
	public List<Category> search(String catename) {
		return categoryDao.search(catename);
	}
		
	@Override
	public boolean isExistName(String name) {
		return categoryDao.isExistName(name);
	}

}
