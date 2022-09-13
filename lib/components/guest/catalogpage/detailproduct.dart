import 'package:flutter/material.dart';
import 'package:modprinting/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductsDetailPage extends StatelessWidget {
    String? name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg400.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),

                //
                /*
                Image.network(
                  snapshot.data?.docs.elementAt(index)['images'],
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 24),
                */

                Text(
                  'Category: ',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),

                Text(
                  'Name: $ProductModel().$name',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
