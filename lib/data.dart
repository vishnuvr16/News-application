import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/bussiness_news_page.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Bussiness";
  categoryModel.image = "assets/images/Vishnu.jpg";
  categoryModel.destination = Bussiness();
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/images/Vishnu.jpg";
  categoryModel.destination = Bussiness();
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Politics";
  categoryModel.image = "assets/images/Vishnu.jpg";
  categoryModel.destination = Bussiness();
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/images/Vishnu.jpg";
  categoryModel.destination = Bussiness();
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/images/Vishnu.jpg";
  categoryModel.destination = Bussiness();
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
