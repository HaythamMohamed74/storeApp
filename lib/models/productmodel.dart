class ProductModel
{
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel
      ({
    required this.id,required this.title,required this.price,required this.description,required this.category, required this.image,required this.ratingModel
      });

  factory ProductModel.fromJson(jsonData)
  {
    return ProductModel
      (
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        ratingModel: RatingModel.fromJson(jsonData['rating'])
    );
  }
}

class RatingModel{
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.rate,required this.count});
  
  factory RatingModel.fromJson(jsonData)
  {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}



// "id": 1,
// "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
// "price": 109.95,
// "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
// "category": "men's clothing",
// "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
// "rating": {
// "rate": 3.9,
// "count": 120