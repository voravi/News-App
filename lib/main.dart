import 'package:provider/provider.dart';

import '/utils/appRoutes.dart';
import '/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'providers/app_theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder:(context,_) => MaterialApp(
        themeMode: (Provider.of<ThemeProvider>(context).obj.isDark) ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          highlightColor: Color(0XFFfafafa),
          primaryColorDark: Color(0xff18191b),
          primaryColor: Colors.white,
          splashColor: Color(0xffff5447),
        ),
        darkTheme: ThemeData(
          highlightColor: Color(0XFF242527),
          primaryColorDark: Colors.white,
          primaryColor: Color(0xff18191b),
          splashColor: Color(0xffff5447),
        ),
        debugShowCheckedModeBanner: false,
        title: "News App",
        //home: HomePage(),
        initialRoute: AppRoutes().homePage,
        routes: routes,
      ),
    );
  }
}
