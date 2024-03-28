import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CommodityHive {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? type;

  CommodityHive({this.name, required this.type});
}
