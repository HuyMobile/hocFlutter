import 'package:flutter/material.dart';

import 'Product.dart';

class ProducDetail extends StatelessWidget {
  const ProducDetail({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                product.image,
                width: screenSize.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 30,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 24,
                child: Text(
                  product.name,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                )
              )
            ],
          ),
          SizedBox(height: 16,),
          Text(product.price,style: TextStyle(color: Colors.black,fontSize: 50),)
        ],
      ),
    );
  }
}
