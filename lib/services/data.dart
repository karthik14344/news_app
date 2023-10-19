import '../models/categories_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "US";
  categoryModel.countryId = "us";
  categoryModel.image = "lib/assets/images/US.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "India";
  categoryModel.countryId = "in";
  categoryModel.image = "lib/assets/images/India.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "China";
  categoryModel.countryId = "ch";
  categoryModel.image = "lib/assets/images/China.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "France";
  categoryModel.countryId = "fr";
  categoryModel.image = "lib/assets/images/France.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Russia";
  categoryModel.countryId = "rs";
  categoryModel.image = "lib/assets/images/Russia.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
