import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:littleprince/sections.dart';
import 'package:littleprince/splash_screen.dart';
import 'package:littleprince/story_details.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(255, 179, 186, .1),
  100: Color.fromRGBO(255, 179, 186, .2),
  200: Color.fromRGBO(255, 179, 186, .3),
  300: Color.fromRGBO(255, 179, 186, .4),
  400: Color.fromRGBO(255, 179, 186, .5),
  500: Color.fromRGBO(255, 179, 186, .6),
  600: Color.fromRGBO(255, 179, 186, .7),
  700: Color.fromRGBO(255, 179, 186, .8),
  800: Color.fromRGBO(255, 179, 186, .9),
  900: Color.fromRGBO(255, 179, 186, 1),
};
Map<int, Color> colorBlue = {
  50: Color.fromRGBO(135, 196, 251, .1),
  100: Color.fromRGBO(135, 196, 251, .2),
  200: Color.fromRGBO(135, 196, 251, .3),
  300: Color.fromRGBO(135, 196, 251, .4),
  400: Color.fromRGBO(135, 196, 251, .5),
  500: Color.fromRGBO(135, 196, 251, .6),
  600: Color.fromRGBO(135, 196, 251, .7),
  700: Color.fromRGBO(135, 196, 251, .8),
  800: Color.fromRGBO(135, 196, 251, .9),
  900: Color.fromRGBO(135, 196, 251, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFffb3ba, color);
MaterialColor colorBluee = MaterialColor(0xFF87c4fb, color);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      title: 'شازده کوچولو',
      theme: ThemeData(
          primarySwatch: colorCustom,
          //accentColor: Colors.lightBlueAccent,
          fontFamily: 'Sans')
      ,
      home: SplashScreen(),
    );
  }
}
