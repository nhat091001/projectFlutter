import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'luutru2.g.dart';

@HiveType(typeId: 1)
class Pamin extends HiveObject {
  @HiveField(0)
  late int index;
  @HiveField(1)
  late String item1;
  @HiveField(2)
  late String item2;
  @HiveField(3)
  late bool remember;

  Pamin(this.index, this.item1, this.item2, this.remember);
}
