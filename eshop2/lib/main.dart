import 'package:eshop2/providers/items_provider.dart';
import 'package:eshop2/screens/login.dart';
import 'package:eshop2/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

String language = 'EN';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences.getInstance().then((instance) {
    language = instance.getString("language");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksProvider>(
        create: (context) => TasksProvider(ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.red,
              colorScheme: ColorScheme.light(),
              switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.white),
                trackColor: MaterialStateProperty.all(Colors.red),
              ),
            )),
        child: MaterialAppTheme());
  }
}

class MaterialAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final them = Provider.of<TasksProvider>(context);
    return MaterialApp(
      theme: them.getTheme(),
      title: 'So0oq E-Shop',
      debugShowCheckedModeBanner: false,
      home: splashScreen2(),
    );
  }
}
