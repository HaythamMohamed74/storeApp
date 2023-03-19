import 'package:store_app/helper/api.dart';
import 'package:store_app/models/productmodel.dart';

class AddProductService{
   // var data;
  Future<ProductModel> addProduct({required String title,required String price,required String description,required String image,required String category}) async{
     Map<String,dynamic>data= await Api().createPost(
           url: 'https://fakestoreapi.com/products',

           body: {
            "title": title
           ,"price": price
           ,"description":description
           ,"image":image
           ,"category":category
           });
      // Map data=
           return ProductModel.fromJson(data);

  }
} 