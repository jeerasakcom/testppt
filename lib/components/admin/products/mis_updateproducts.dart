



/*

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infrastructure/models/product_model.dart';
import 'package:infrastructure/utility/dialog.dart';

class UpdateProductsPage extends StatefulWidget {
  ProductModel? productModel;
  UpdateProductsPage({Key? key, required this.productModel}) : super(key: key);

  @override
  _UpdateProductsPageState createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  File? file;
  String? id, name, price, detail, quantity, category, images;
  ProductModel? productModel;

  @override
  void initState() {
    super.initState();
    productModel = widget.productModel;
    id = productModel!.id;
    name = productModel!.name;
    price = productModel!.price;
    detail = productModel!.detail;
    quantity = productModel!.quantity;
    category = productModel!.category;
    images = productModel!.images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: uploadButton(),
      appBar: AppBar(
        title: Text('ปรับปรุง เมนู ${productModel!.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            nameFood(),
            groupImage(),
            priceFood(),
            detailFood(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton uploadButton() {
    return FloatingActionButton(
      onPressed: () {
        if (name!.isEmpty || price!.isEmpty || detail!.isEmpty) {
          normalDialog(context, 'กรุณากรอกให้ครบ ทุกช่องคะ');
        } else {
          confirmEdit();
        }
      },
      child: Icon(Icons.cloud_upload),
    );
  }

  Future<Null> confirmEdit() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('คุณต้องการจะ เปลี่ยนแปลง เมนูอาหาร จริงๆ นะ ?'),
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  editValueOnMySQL();
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                label: Text('เปลี่ยนแปลง'),
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                label: Text('ไม่เปลี่ยนแปลง'),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Null> editValueOnMySQL() async {
    String? id = productModel!.id;
    String url = '';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'กรุณาลองใหม่ มีอะไร ? ผิดพลาด');
      }
    });
  }

  Widget groupImage() => Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: 250.0,
            height: 250,
            child: file == null
                ? Image.network(
                    //'${MyConstant().domain}${foodModel.pathImage}',
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  )
                : Image.file(file!),
          ),
          IconButton(
            icon: Icon(Icons.add_photo_alternate),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker().getImage(
        source: source,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );
      setState(() {
        file = File(object!.path);
      });
    } catch (e) {}
  }

  Widget nameFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => name = value.trim(),
              initialValue: name,
              decoration: InputDecoration(
                labelText: 'ชื่อ เมนู อาหาร',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget priceFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => price = value.trim(),
              keyboardType: TextInputType.number,
              initialValue: price,
              decoration: InputDecoration(
                labelText: 'ราคา อาหาร',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget detailFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => detail = value.trim(),
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              initialValue: detail,
              decoration: InputDecoration(
                labelText: 'รายละเอียด อาหาร',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}






*/



//1






//3
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/models/product_model.dart';
import 'package:infrastructure/utility/stylepro.dart';

class EditShopProFile extends StatefulWidget {
  const EditShopProFile({Key? key}) : super(key: key);

  @override
  _EditShopProFileState createState() => _EditShopProFileState();
}

class _EditShopProFileState extends State<EditShopProFile> {
  var load = true;
  String? uidLogin, docIdProfile;
  bool? haveProfile;

  ProductModel? productModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProfileShop();
  }

  Future<void> readProfileShop() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {

      await FirebaseFirestore.instance
          .collection('Products')
          .doc()
          .collection('id')
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          setState(() {
            haveProfile = false;
            load = false;
          });
        } else {
          for (var item in value.docs) {
            docIdProfile = item.id;
            setState(() {
              productModel = ProductModel.fromJson(item.data());
            });
          }

          setState(() {
            haveProfile = true;
            load = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          haveProfile == null ? const SizedBox() : buttonInsertOrEdit(context),
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        title: const Text('แก้ไขข้อมูลร้านค้า'),
      ),
      body: load
          ? const ShowProcess()
          : haveProfile!
              ? profileShopModel == null
                  ? const ShowProcess()
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.network(productModel!.images),
                          ),
                          ShowText(
                            title: profileShopModel!.nameShop,
                            textStyle: MyConstant().h2Style(),
                          ),
                          ShowText(
                            title: profileShopModel!.address,
                            textStyle: MyConstant().h2Style(),
                          ),
                        ],
                      ),
                    )
              : Center(
                  child: ShowText(
                  title: 'No Profile',
                  textStyle: MyConstant().h1Style(),
                )),
    );
  }

  ElevatedButton buttonInsertOrEdit(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (haveProfile!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileShop(
                  docIdProfile: docIdProfile,
                ),
              )).then((value) => readProfileShop());
        } else {
          Navigator.pushNamed(context, MyConstant.routInsertProfileShop)
              .then((value) => readProfileShop());
        }
      },
      child: haveProfile!
          ? const Text('Edit Profile')
          : const Text('Insert Profile'),
    );
  }
}




//3
*/



/*




// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infrastructure/models/product_model.dart';

import 'package:ungjedshopping/models/product_model.dart';
import 'package:ungjedshopping/utility/my_calculate.dart';
import 'package:ungjedshopping/utility/my_constant.dart';
import 'package:ungjedshopping/utility/my_dialog.dart';
import 'package:ungjedshopping/widgets/show_button.dart';
import 'package:ungjedshopping/widgets/show_form.dart';
import 'package:ungjedshopping/widgets/show_icon_button.dart';
import 'package:ungjedshopping/widgets/show_text.dart';

class EditProducShoper extends StatefulWidget {
  final ProductModel productModel;
  const EditProducShoper({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<EditProducShoper> createState() => _EditProducShoperState();
}

class _EditProducShoperState extends State<EditProducShoper> {
  ProductModel? productModel;
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var urlImages = <String>[];
  var files = <File?>[];

  bool change = false; // true ==> Have Change
  // String? name, quantity, unit, price;
  //File? file;
  String? id, name, price, detail, quantity, category, images;

  @override
  void initState() {
    super.initState();
    productModel = widget.productModel;
    idController.text = productModel!.id!;
    nameController.text = productModel!.name!;
    priceController.text = productModel!.price!;
    detailController.text = productModel!.detail!;
    quantityController.text = productModel!.quantity!;

    
    id = productModel!.id;
    name = productModel!.name;
    detail = productModel!.detail;
    quantity = productModel!.quantity;
    price = productModel!.price;

    urlImages =
        MyCalculate().changeStringToArray(string: productModel!.picture);

    for (var i = 0; i < urlImages.length; i++) {
      files.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return ListView(
          children: [
            formName(),
            formQtyUnit(),
            formPrice(),
            const SizedBox(
              height: 16,
            ),
            listImage(boxConstraints),
            urlImages.length == 4 ? const SizedBox() : iconAddPicture(),
            const SizedBox(
              height: 16,
            ),
            buttonEditProduct(),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      }),
    );
  }

  Row buttonEditProduct() => createCenter(
        widget: ShowButton(
          label: 'Edit Product',
          pressFunc: () {
            if (change) {
              processUploadAndEditData();
            } else {
              MyDialog(context: context).normalDialog(
                  title: 'No Change ?', subTitle: 'Please Edit Something');
            }
          },
        ),
      );

  Future<void> processUploadAndEditData() async {
    for (var i = 0; i < files.length; i++) {
      if (files[i] != null) {
        String nameFile = 'imageEdit${Random().nextInt(1000000)}.jpg';
        Map<String, dynamic> map = {};
        map['file'] =
            await MultipartFile.fromFile(files[i]!.path, filename: nameFile);
        String pathAPI = 'http://www.program2me.com/api/ungapi/saveProduct.php';
        FormData formData = FormData.fromMap(map);
        await Dio().post(pathAPI, data: formData).then((value) async {
          String urlImage =
              'http://www.program2me.com/api/ungapi/product/$nameFile';
          urlImages[i] = urlImage;
        });
      }
    }

    String pathApiEditProduct =
        'http://www.program2me.com/api/ungapi/ProductEditWhereId.php?id=${productModel!.id}&name=$name&unit=$unit&price=$price&qty=$qty&picture=${urlImages.toString()}';

    print('## pathAPIedit ===>>> $pathApiEditProduct');

    await Dio().get(pathApiEditProduct).then((value) {
      Navigator.pop(context);
    });
  }

  Row iconAddPicture() {
    return createCenter(
        widget: SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShowIconButton(
            size: 48,
            color: const Color.fromARGB(255, 18, 112, 188),
            iconData: Icons.add_box_outlined,
            pressFunc: () {
              MyDialog(context: context).normalDialog(
                  label: 'Camera',
                  pressFunc: () {
                    Navigator.pop(context);
                    processAddMorePicture(source: ImageSource.camera);
                  },
                  label2: 'Gallery',
                  pressFunc2: () {
                    Navigator.pop(context);
                    processAddMorePicture(source: ImageSource.gallery);
                  },
                  title: 'Source Image ?',
                  subTitle: 'Please Tap Camera or Gallery');
            },
          ),
        ],
      ),
    ));
  }

  Future<void> processAddMorePicture({required ImageSource source}) async {
    change = true;
    var result = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (result != null) {
      urlImages.add('');
      files.add(null);
      int index = files.length - 1;
      files[index] = File(result.path);
      setState(() {});
    }
  }

  ListView listImage(BoxConstraints boxConstraints) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: urlImages.length,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: boxConstraints.maxWidth * 0.75,
            height: boxConstraints.maxWidth * 0.75,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: boxConstraints.maxWidth * 0.75,
                  height: boxConstraints.maxWidth * 0.75,
                  child: files[index] == null
                      ? Image.network(
                          urlImages[index],
                        )
                      : Image.file(files[index]!),
                ),
                Container(
                  width: boxConstraints.maxWidth * 0.3,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.75)),
                  child: Row(
                    children: [
                      ShowIconButton(
                        color: const Color.fromARGB(255, 89, 225, 93),
                        iconData: Icons.edit_outlined,
                        pressFunc: () {
                          MyDialog(context: context).normalDialog(
                              label: 'Camera',
                              pressFunc: () {
                                Navigator.pop(context);
                                processTakePhoto(
                                    source: ImageSource.camera, index: index);
                              },
                              label2: 'Gallery',
                              pressFunc2: () {
                                Navigator.pop(context);
                                processTakePhoto(
                                    source: ImageSource.gallery, index: index);
                              },
                              title: 'Source Image ?',
                              subTitle: 'Please Tap Camera or Gallery');
                        },
                      ),
                      urlImages.length == 1
                          ? const SizedBox()
                          : ShowIconButton(
                              color: const Color.fromARGB(255, 228, 57, 45),
                              iconData: Icons.delete_forever,
                              pressFunc: () {
                                MyDialog(context: context).normalDialog(
                                    label: 'Confirm',
                                    pressFunc: () {
                                      change = true;
                                      Navigator.pop(context);
                                      print(
                                          'urlImages Before delete ==> $urlImages');
                                      print('delete image index ==>> $index');

                                      urlImages.removeAt(index);
                                      files.removeAt(index);

                                      print(
                                          'urlImages Alter delete ==> $urlImages');

                                      setState(() {});
                                    },
                                    label2: 'Cancel',
                                    pressFunc2: () {
                                      Navigator.pop(context);
                                    },
                                    title: 'Confirm Delete ?',
                                    subTitle: 'Are You Sure Delete Image ?');
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row formPrice() {
    return createCenter(
      widget: ShowForm(
        textEditingController: priceController,
        label: 'Price :',
        iconData: Icons.money,
        changeFunc: (String string) {
          price = string.trim();
          change = true;
        },
      ),
    );
  }

  Row formQtyUnit() {
    return createCenter(
      widget: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShowForm(
              textEditingController: qtyController,
              width: 120,
              label: 'QTY',
              iconData: Icons.android,
              changeFunc: (String string) {
                qty = string;
                change = true;
              },
            ),
            ShowForm(
              textEditingController: unitController,
              width: 120,
              label: 'Unit',
              iconData: Icons.ac_unit,
              changeFunc: (String string) {
                unit = string.trim();
                change = true;
              },
            ),
          ],
        ),
      ),
    );
  }

  Row formName() {
    return createCenter(
        widget: ShowForm(
      textEditingController: nameController,
      label: 'Name :',
      iconData: Icons.fingerprint,
      changeFunc: (String string) {
        name = string.trim();
        change = true;
      },
    ));
  }

  Row createCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }

  AppBar newAppBar() {
    return AppBar(
      title: Text('Edit Product'),
    );
  }

  Future<void> processTakePhoto(
      {required ImageSource source, required int index}) async {
    change = true;
    var result = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    files[index] = File(result!.path);
    setState(() {});
  }
}






*/

//2

/*
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/utility/stylepro.dart';
import 'package:infrastructure/models/product_model.dart';



class UpdateProductsPage extends StatefulWidget {
  final ProductModel productModel;
  final String docIdProducts;
  const UpdateProductsPage({
    Key? key,
    required this.productModel,
    required this.docIdProducts,
  }) : super(key: key);

  @override
  State<UpdateProductsPage> createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  ProductModel? productModel;
  String? docIdProducts;
  String? id, name, price, detail, quantity, category, images;

  TextEditingController idController = TextEditingController();
  TextEditingController nameButtonController = TextEditingController();
  TextEditingController priceButtonController = TextEditingController();
  TextEditingController detailButtonController = TextEditingController();
  TextEditingController quantityButtonController = TextEditingController();


  File? file;
  TextEditingController textEditingController = TextEditingController();
  bool load = true, active = false;

  @override
  void initState() {
    super.initState();
    productModel = widget.productModel;
    docIdProducts = widget.docIdProducts;

    idController.text = productModel!.id ?? '';
    nameButtonController.text = productModel!.name ?? '';
    priceButtonController.text = productModel!.price ?? '';
    detailButtonController.text = productModel!.detail ?? '';
    quantityButtonController.text = productModel!.quantity ?? '';

  }



  Future<void> findCurrentProducts() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);
      textEditingController.text = userModel!.name;
      load = false;
      setState(() {});
    });
  }
/*
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          blockproid(),
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
                  onChanged: (value) => idController,
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

 


}





*/