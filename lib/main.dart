import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:habit_hub/db/models/default/defaulthabitmodel.dart';
import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:habit_hub/notifications/notifications.dart';
import 'package:habit_hub/screens/register&splash/splash/splashscreen.dart';
import 'package:habit_hub/styles/thememodes/theme.dart';
import 'package:habit_hub/styles/thememodes/themeservices.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timezone/data/latest_all.dart' as tz;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  tz.initializeTimeZones();
  await LocalNotification.notificationInitialization();
  Hive.registerAdapter(UserRegisterModelAdapter());
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(DefaultItemsAdapter());
  await Hive.openBox<UserRegisterModel>('UserRegister');
  await Hive.openBox<HabitModel>('userhabits');
  await Hive.openBox<HabitModel>('userfavourites');
  await Hive.openBox<DefaultItems>('defaulthabits');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
