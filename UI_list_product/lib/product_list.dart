import 'package:flutter/material.dart';
import 'package:listproduct/product_detail.dart';

import 'Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: (){

          },
        ),
        title: Text("My Shop"),
        backgroundColor: Colors.purple,
        actions:<Widget>   [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: ListProduct(),
    );
  }
}
final List<Product> listProduct=[
  Product(
      "Quần jean",
      "https://upload.wikimedia.org/wikipedia/commons/5/5a/Jeans.jpg",
      "\$5.6",
      false),

  Product(
      "Váy đầm",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Dress_MET_19.181.1_F2.jpeg/266px-Dress_MET_19.181.1_F2.jpeg",
      "\$5.6",
      false),
];

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 3/2,
        crossAxisCount: 2,
    children: [
      for(int i=0;i<listProduct.length;i++)
        InkWell(
        child: ProductItem(product: listProduct[i],
        ),
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProducDetail(product: listProduct[i],)));
          },
        )
    ],);
  }
}

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(product);
}

class _ProductItemState extends State<ProductItem> {
  final Product product;
  _ProductItemState(this.product);
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              product.image,
              width: screenSize.width/2.0 -16,
              //giải thích do màn hình chia làm 2 cột,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            height: 50,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    product.favorite ? Icons.favorite:Icons.favorite_border,
                    color: Color(0xff9f28B4),
                  ),
                  onPressed: (){
                    setState((){
                      product.favorite= !product.favorite;
                    });
                  },
                ),Expanded(child: Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 14
                  ),
                )),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color(0xff9f28B4),
                  ),
                  onPressed: (){

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}





