import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanalira_example/provider/bankProvider.dart';
import 'package:sanalira_example/screens/registerPage.dart';
import 'package:provider/provider.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      )
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BankProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF66CC78),
        canvasColor: Color(0xFFF3F4F6),
        backgroundColor: Color(0xFF000000),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          selectedItemColor: Colors.green[400],
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
            fontSize: 20
          ),
          bodyText1: TextStyle(
            color: Colors.white
          ),
          bodyText2: TextStyle(
            color: Color(0xFFCFD4DE)
          ),
          labelMedium: TextStyle(
            color: Color(0xFF141C2D),
            fontSize: 12,
            fontWeight: FontWeight.w600
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white
          ),
        )
      ),
      home: RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}