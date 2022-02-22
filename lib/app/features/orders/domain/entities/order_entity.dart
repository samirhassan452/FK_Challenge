import 'package:equatable/equatable.dart' show Equatable;

class OrderEntity extends Equatable {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final String registered;

  const OrderEntity({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  @override
  List<Object?> get props => [
        id,
        isActive,
        price,
        company,
        picture,
        buyer,
        tags,
        status,
        registered,
      ];
}
