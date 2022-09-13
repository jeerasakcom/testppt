import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:modprinting/components/admin/products/mis_listproducts.dart';
import 'package:modprinting/models/product_model.dart';
import 'package:modprinting/utility/category_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modprinting/utility/header.dart';
import 'package:modprinting/utility/stylepro.dart';

//Add Products Pages
class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? file;
  String? id, name, price, detail, quantity, category, images;
  //bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: height,
          child: Column(
            children: [
              StyleProjects().boxSpaceTop2,
              HeaderBackend().headertdvp2(),
              StyleProjects().boxSpace2,
              blockheader(),
              StyleProjects().boxSpace2,
              blockprocate(),
              StyleProjects().boxSpace2,
              blockproid(),
             StyleProjects().boxSpace2,
              blockproname(),
              StyleProjects().boxSpace2,
              blockprodetail(),
              StyleProjects().boxSpace2,
              blockproprice(),
              StyleProjects().boxSpace2,
              blockproquantity(),
              StyleProjects().boxSpace2,
              blockImg(),
              StyleProjects().boxSpace2,
              blockSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockheader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'เพิ่มสินค้าใหม่',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF0FF0B3),
              //color: const Color(0xFFFAD961),
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockprocate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'หมวดสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              /*
              Container(
                width: 200,
                height: 35,
                child: TextField(
                  onChanged: (value) => category = value.trim(),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff000f3b),
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
            */
              ///
              /*
              Container(
                width: 200,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: DropdownButton<String>(
                      value: category,
                      items: DataCategory()
                          .positions
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontFamily: 'THSarabunNew',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff000f3b),
                                ),
                              ),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value;
                        });
                      },
                      hint: Text(
                        'กรุณาเลือกหมวดสินค้าค่ะ',
                        style: TextStyle(
                          fontFamily: 'THSarabunNew',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD80000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              */
              Expanded(
                child: Container(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: DropdownButton<String>(
                      value: category,
                      items: DataCategory()
                          .positions
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontFamily: 'THSarabunNew',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff000f3b),
                                ),
                              ),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value;
                        });
                      },
                      hint: Text(
                        'กรุณาเลือกหมวดสินค้าค่ะ',
                        style: TextStyle(
                          fontFamily: 'THSarabunNew',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD80000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*
          TextFormField(
            maxLines: 1,
            onChanged: (value) => category = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
          */
        ],
      ),
    );
  }

  Widget blockproid() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'รหัสสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 200,
                height: 35,
                child: TextField(
                  onChanged: (value) => id = value.trim(),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff000f3b),
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
          /*
          TextFormField(
            maxLines: 1,
            onChanged: (value) => id = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        */
        ],
      ),
    );
  }

  Widget blockproname() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ชื่อสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 2,
            minLines: 1,
            onChanged: (value) => name = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockprodetail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'รายละเอียด',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 5,
            minLines: 2,
            onChanged: (value) => detail = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockproprice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      /*
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ราคา',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 1,
            onChanged: (value) => price = value.trim(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    */
      child: Row(
        children: [
          Text(
            'ราคา',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            height: 35,
            child: TextField(
              onChanged: (value) => price = value.trim(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff000f3b),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'บาท',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockproquantity() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      /*
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'จำนวน',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            onChanged: (value) => quantity = value.trim(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    */
      child: Row(
        children: [
          Text(
            'จำนวน',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            height: 35,
            child: TextField(
              onChanged: (value) => quantity = value.trim(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff000f3b),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'เล่ม',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockImg() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ภาพสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.camera),
              ),
              Container(
                width: 100,
                height: 100,
                child: file == null
                    ? Image.asset(
                        'assets/images/p22.jpg',
                      )
                    : Image.file(file!),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockSaveButton() {
    return Container(
      //margin: EdgeInsets.all(10),
      child: RaisedButton(
        //color: const Color(0xFF32A54F),
        color: const Color(0xFF459522),
        child: Text(
          "บันทึก",
          style: TextStyle(
            fontFamily: 'THSarabunNew',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: const Color(0xffffffff),
          ),
        ),
        onPressed: () {
          if (file == null) {
            normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
          } else if (id == null ||
              id!.isEmpty ||
              name == null ||
              name!.isEmpty ||
              price == null ||
              price!.isEmpty ||
              detail == null ||
              detail!.isEmpty ||
              quantity == null ||
              quantity!.isEmpty ||
              category == null ||
              category!.isEmpty) {
            normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
          } else {
            /*
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListProductPage(),
              ),
            );
            */

            /*
            setState(() {
              _isProcessing = false;
            });
            */

            uploadPicture();
            Navigator.of(context).pop();

            Route route =
                MaterialPageRoute(builder: (context) => ListProductPage());
            Navigator.push(context, route);
          }
        },
      ),
    );
  }

  Future<Null> uploadPicture() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String namePic = 'products$i.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child('products/$namePic');
    UploadTask storageUploadTask = storageReference.putFile(file!);
    await (await storageUploadTask).ref.getDownloadURL().then((value) {
      images = value;
      print('images = $images');
      insertProducts();
    });
  }

  Future<Null> insertProducts() async {
    ProductModel model = ProductModel(
        id: id,
        name: name,
        detail: detail,
        price: price,
        quantity: quantity,
        category: category,
        images: images);

    Map<String, dynamic> map = model.toJson();

    //await
    FirebaseFirestore.instance
        .collection('Products')
        .doc()
        .set(map)
        .then((value) => Navigator.pop(context));
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );
    file = File(result!.path);
    setState(() {});
  }

  Row imageGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          Container(
            width: 150,
            height: 150,
            child: file == null
                ? Image.asset(
                    'assets/images/newspic002.jpg',
                  )
                : Image.file(file!),
          ),
          IconButton(
            icon: Icon(
              
              Icons.add_photo_alternate,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  Future<Null> normalDialog(BuildContext context, String string) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(string),
        children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //color: const Color(0xff000f3b),
                color: const Color(0xffda0641),
              ),
            ),
          )
        ],
      ),
    );
  }
}
