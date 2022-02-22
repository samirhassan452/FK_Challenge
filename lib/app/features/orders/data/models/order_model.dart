import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show OrderEntity;

class OrderModel extends OrderEntity {
  const OrderModel({
    required String id,
    required bool isActive,
    required String price,
    required String company,
    required String picture,
    required String buyer,
    required List<String> tags,
    required String status,
    required String registered,
  }) : super(
          id: id,
          isActive: isActive,
          price: price,
          company: company,
          picture: picture,
          buyer: buyer,
          tags: tags,
          status: status,
          registered: registered,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        isActive: json["isActive"],
        price: json["price"],
        company: json["company"],
        picture: json["picture"],
        buyer: json["buyer"],
        tags: List<String>.from(json["tags"].map((tag) => tag)),
        status: json["status"],
        registered: json["registered"],
      );

  static List<OrderModel> getListOfOrders(List<dynamic> list) =>
      list.map((json) => OrderModel.fromJson(json)).toList();
}
