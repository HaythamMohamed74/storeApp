import 'package:flutter/material.dart';
import 'package:store_app/models/productmodel.dart';
import 'package:store_app/screens/updatePage.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    required this.model,
    Key? key,
  }) : super(key: key);
ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // width: 180,
          // height:120,
          // color: Colors.red,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,UpdatePage.id,arguments: model);
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 40,),
                    Text(
                      '${model.title.substring(0,11)}',style: TextStyle(color: Colors.grey),)
                    ,Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( r'$' '${model.price.toString()}',style: TextStyle(fontWeight: FontWeight.w600),)
                        ,IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                      ],)
                  ],),
              )

              ,),
          ),
        ),
        Positioned(
            right: 30,
            bottom: 90,
            child: Image.network(model.image,height: 90,width: 90,))
      ],
    );
  }
}