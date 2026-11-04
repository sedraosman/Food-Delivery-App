import 'package:food_app/core/models/category_model.dart';
import 'package:food_app/core/models/product_model.dart';

class HomeData {
  
 List<CategoryModel> get categories => [
    CategoryModel(
      id: 1,
      name: 'Meat',
      image: 'assets/images/meat.png',
    ),
    CategoryModel(
      id: 2,
      name: 'Pizza',
      image: 'assets/images/pizza.png',
    ),
  ];
  
List<ProductModel> get products => [
  ProductModel(
    id: 1,
    categoryId: 1,
    name: "Classic Burger",
    image: "assets/images/Burger.png",
    price: 8.99,
    rating: 4.8,
    time: 10,
    description: "Juicy beef burger with cheese and fresh vegetables.",
  ),

  ProductModel(
    id: 2,
    categoryId: 1,
    name: "Double Burger",
    image: "assets/images/Double.png",
    price: 11.99,
    rating: 4.9,
    time: 10,
    description: "Double beef patties with cheddar cheese.",
  ),

  ProductModel(
    id: 3,
    categoryId: 2,
    name: "Pepperoni Pizza",
    image: "assets/images/Pepperoni.png",
    price: 13.50,
    rating: 4.7,
    time: 10,
    description: "Crispy pizza topped with pepperoni and mozzarella.",
  ),

  ProductModel(
    id: 4,
    categoryId: 2,
    name: "Margherita Pizza",
    image: "assets/images/Margherita.png",
    price: 12.00,
    rating: 4.6,
    time: 10,
    description: "Fresh mozzarella, basil and tomato sauce.",
  ),

  ProductModel(
    id: 5,
    categoryId: 3,
    name: "Fried Chicken",
    image: "assets/images/Friedch.png",
    price: 10.99,
    rating: 4.8,
    time: 10,
    description: "Crispy fried chicken with special seasoning.",
  ),

  ProductModel(
    id: 6,
    categoryId: 3,
    name: "Grilled Chicken",
    image: "assets/images/Grilled.png",
    price: 11.50,
    rating: 4.5,
    time: 10,
    description: "Healthy grilled chicken breast.",
  ),

  ProductModel(
    id: 7,
    categoryId: 4,
    name: "French Fries",
    image: "assets/images/Fries.png",
    price: 4.50,
    rating: 4.6,
    time: 10,
    description: "Golden crispy French fries.",
  ),

  ProductModel(
    id: 8,
    categoryId: 4,
    name: "Cheese Fries",
    image: "assets/images/Cheese.png",
    price: 5.99,
    rating: 4.7,
    time: 10,
    description: "French fries topped with melted cheese.",
  ),

  ProductModel(
    id: 9,
    categoryId: 5,
    name: "Chocolate Cake",
    image: "assets/images/Cake.png",
    price: 6.99,
    rating: 4.9,
    time: 10,
    description: "Rich chocolate cake with cream.",
  ),

  ProductModel(
    id: 10,
    categoryId: 5,
    name: "Strawberry Donut",
    image: "assets/images/Donut.png",
    price: 3.99,
    rating: 4.5,
    time: 10,
    description: "Soft donut with strawberry glaze.",
  ),
];
  }