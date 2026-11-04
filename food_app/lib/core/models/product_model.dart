


class ProductModel {
final int id;
final int categoryId;
final String name;
final double rating;
final String image;
final int time;
final double price;
final String description;

  ProductModel({required this.id, required this.name, required this.rating, required this.time, required this.price, required this.description, required this.categoryId, required this.image}); 

factory ProductModel.fromJson(Map<String , dynamic> json){
  return ProductModel(
    id: int.parse(json['id'].toString()),
    name: json['name'], 
    rating: double.parse(json['rating'].toString()), 
    time: int.parse(json['time'].toString()), 
    price: double.parse(json['price'].toString()), 
    description: json['description'], 
    categoryId: int.parse(json['category_id'].toString()), 
    image: json['image']
    
    );

}


}
