import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/models/product.dart';

class HomeData {
  final Categories categories;
  final Products products;

  HomeData({required this.categories, required this.products});
}
