import 'package:flutter/material.dart';
import 'package:store_app/models/productmodel.dart';
import 'package:store_app/services/allProductService.dart';

import '../widgets/cardWidet.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
 static String id='Home';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white
        ,leading:IconButton(onPressed:(){} ,icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),)
        ,title: Center(child: Text('New Trend',style: TextStyle(color: Colors.black),)),
        actions: [
          IconButton(
              onPressed: (){}
              ,icon: Icon(Icons.shopping_cart,color: Colors.black,))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 68,left: 8,right: 8),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProductService().getAllProduct() ,
          builder: (context,snapshot){
            if(snapshot.hasData){
              // List<ProductModel>?propducts=snapshot.data!;
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10
                      ,mainAxisSpacing: 100
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(model: snapshot.data![index],);
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }

          }

        )
      ),
      // ),
    );
  }
}




