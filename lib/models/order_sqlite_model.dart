import 'dart:convert';

class OrderSQLiteModel {
  final int? id;
  final String? nameproduct;
  final String? price;
  final String? amount;
  final String? sum;
  OrderSQLiteModel({
    this.id,
    this.nameproduct,
    this.price,
    this.amount,
    this.sum,
  });

  OrderSQLiteModel copyWith({
    int? id,
    String? nameproduct,
    String? price,
    String? amount,
    String? sum,
  }) {
    return OrderSQLiteModel(
      id: id ?? this.id,
      nameproduct: nameproduct ?? this.nameproduct,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameproduct': nameproduct,
      'price': price,
      'amount': amount,
      'sum': sum,
    };
  }

  factory OrderSQLiteModel.fromMap(Map<String, dynamic> map) {
    return OrderSQLiteModel(
      id: map['id'],
      nameproduct: map['nameproduct'],
      price: map['price'],
      amount: map['amount'],
      sum: map['sum'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderSQLiteModel.fromJson(String source) => OrderSQLiteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderSQLiteModel(id: $id, nameproduct: $nameproduct, price: $price, amount: $amount, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderSQLiteModel &&
      other.id == id &&
      other.nameproduct == nameproduct &&
      other.price == price &&
      other.amount == amount &&
      other.sum == sum;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameproduct.hashCode ^
      price.hashCode ^
      amount.hashCode ^
      sum.hashCode;
  }
}
