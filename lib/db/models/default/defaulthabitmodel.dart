import 'package:hive/hive.dart';
part 'defaulthabitmodel.g.dart';

@HiveType(typeId: 4)
class DefaultItems {
  @HiveField(0)
  final String habitsname;

  @HiveField(1)
  final String images;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> keyResults;

  DefaultItems({
    required this.habitsname,
    required this.images,
    required this.description,
    required this.keyResults,
  });
}
