import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/productmodel.dart';
import 'package:store_app/services/updateProductService.dart';
import 'package:store_app/widgets/customTextField.dart';

import '../helper/customSnakBar.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({Key? key}) : super(key: key);
  static String id='update';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
    String? productname;

    String? desc;

    dynamic? price;

    String? image;

    String? category;

    bool isloading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel model=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return  SafeArea(
      child: ModalProgressHUD(
        inAsyncCall:isloading ,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Center(child: Text('Update Product',style: TextStyle(color: Colors.black),)),
              leading:IconButton(onPressed:(){
                Navigator.pop(context);
              } ,icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),)
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Image.network(model.image,width: 100,),
                      Text(model.category)
                    ],
                  ),
                  SizedBox(height: 150,),
                CustomTextField( labelText: 'Product name',  onChanged: (data){
                  productname=data;
                }),
                SizedBox(height: 10,),
                CustomTextField(labelText: 'descreption',  onChanged: (data){
                  desc=data;
                }),
                SizedBox(height: 10,),
                CustomTextField(labelText: 'price ',keyboardType:TextInputType.number , onChanged: (data){
                  price=data;
                }),
                SizedBox(height: 10,),
                CustomTextField(labelText: 'image',  onChanged: (data){
                image=data;
                }),
                SizedBox(height: 10,),
                CustomTextField(labelText: 'category', onChanged: (data){
                  category=data;
                })
                  ,SizedBox(height: 30,)
                  ,Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextButton(
                          onPressed: ()   async {
                            isloading=true;
                            setState(()  {

                            });
                            // UpdataProductMethod(model);
                            try {
                            await  UpdataProductMethod(model);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }  catch (e) {
                              print(e.toString());
                            }
                            isloading=false;
                            setState(() {

                            });


                      }, child: Text('Updata',style: TextStyle(color: Colors.white),)))
              ],),
            ),
          ),

        ),
      ),
    );
  }

  Future<void> UpdataProductMethod(ProductModel model) async {
   await UpdateProductService().updateProduct(
        title:productname==null?model.title: productname!,
        price:price==null?model.price: price!,
        description:desc==null?model.description :desc!,
        image:image==null?model.image: image!,
        category:category==null?model.category: category!,
        id:model.id
    );
  }
}
//flutter.compileSdkVersion