import 'package:habit_hub/db/models/default/defaulthabitmodel.dart';
import 'package:hive/hive.dart';

class DefaulthabitServices {
  final Box <DefaultItems> defualtBox = Hive.box<DefaultItems>('defaulthabits');
}
