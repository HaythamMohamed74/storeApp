import 'package:store_app/helper/api.dart';
import 'package:store_app/models/productmodel.dart';

class UpdateProductService{
  
 Future<ProductModel>updateProduct({ required int id,required String title,required dynamic price,required String description,required String image,required String category}) async {
 Map<String,dynamic>data =await Api().Put(
        url:'https://fakestoreapi.com/products/$id',
        body: {
    "title": title
    ,"price": price
    ,"description":description
    ,"image":image
    ,"category":category
    });
return ProductModel.fromJson(data);

  }
}