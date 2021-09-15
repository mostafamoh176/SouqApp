import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/provider/theme_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/welcomescreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create:  (context) =>ThemeProvider(),
        builder: (context,_){
          final themeProvider=Provider.of<ThemeProvider>(context);
          return MaterialApp(
            theme: MyTheme.lighTheme,
            darkTheme:MyTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HomePage();
                } else {
                  return WelcomeScreen();
                }
              },
            ),
          );
        },

      ),
    );
  }
}
