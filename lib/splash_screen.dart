import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littleprince/contact_us.dart';
import 'package:littleprince/sections.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkSession().then((status) {
      if (status) {
        _navigateToSection();
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ContactUs()));
      }
    });
  }

  Future<bool> _checkSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }

  void _navigateToSection() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Sections()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 52, 120, 1),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/splash.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(top: 60,
              child: Shimmer.fromColors(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'آنتوان دوسنت اگزوپری',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w200
                      ),
                    ),
                  ),
                  baseColor: Colors.grey[100],
                  highlightColor: Colors.grey[400]),
            ),
            Positioned(
              top: 200,
              child: Shimmer.fromColors(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'شازده کوچولو',
                      style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  baseColor: Colors.grey[100],
                  highlightColor: Color.fromRGBO(255, 230, 103, 1)),
            ),
//            Positioned(top: 140,
//              child: Shimmer.fromColors(
//                  child: Container(
//                    padding: EdgeInsets.all(16),
//                    child: Text(
//                      'احمد شاملو',
//                      style: TextStyle(
//                        fontSize: 26,
//                        fontFamily: 'Sans',
//                        fontWeight: FontWeight.bold
//                      ),
//                    ),
//                  ),
//                  baseColor: Colors.grey[100],
//                  highlightColor: Colors.grey[400]),
//            )
          ],
        ),
      ),
    );
  }
}
