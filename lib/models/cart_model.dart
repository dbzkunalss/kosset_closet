
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class Item {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int quantity;

  @HiveField(3)
  final List<int> numbers;

  Item(this.name, this.quantity, this.numbers);
}