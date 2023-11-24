import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders(){

  List<SliderModel> sliders = [];

  SliderModel sliderModel = new SliderModel();

  sliderModel.name = "Bussiness";
  sliderModel.image = "assets/images/Vishnu.jpg";
  sliders.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Entertainment";
  sliderModel.image = "assets/images/Vishnu.jpg";
  sliders.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Politics";
  sliderModel.image = "assets/images/Vishnu.jpg";
  sliders.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Health";
  sliderModel.image = "assets/images/Vishnu.jpg";
  sliders.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Sports";
  sliderModel.image = "assets/images/Vishnu.jpg";
  sliders.add(sliderModel);
  sliderModel = new SliderModel();

  return sliders;
}
