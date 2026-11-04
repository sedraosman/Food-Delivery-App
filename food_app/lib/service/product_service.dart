import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_app/core/models/product_model.dart';



class ProductService {


  Future<List<ProductModel>> getProducts() async{
    final response = await http.get(
      Uri.parse('http://10.0.2.2/food_api/products.php'),
    );

    final data = jsonDecode(response.body);

    return data 
          .map<ProductModel>((item)=>ProductModel.fromJson(item))
          .toList();

  }
}
