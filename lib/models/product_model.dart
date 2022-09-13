class ProductModel {
  String? id;
  String? name;
  String? detail;
  String? price;
  String? quantity;
  String? category;
  String? images;

  ProductModel(
      {this.id,
      this.name,
      this.detail,
      this.price,
      this.quantity,
      this.category,
      this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    detail = json['detail'];
    price = json['price'];
    quantity = json['quantity'];
    category = json['category'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['images'] = this.images;
    return data;
  }
}
