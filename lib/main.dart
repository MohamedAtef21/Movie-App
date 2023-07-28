import 'package:flutter/material.dart';
import 'package:movie/screens/core/logic/helper_method.dart';
import 'package:movie/screens/splachscreen/view.dart';

void main() {
  runApp( const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: getMaterialColor(const Color(0xff051A2D)),
      ),
      home: PageView(
        children: const [
          SplachScreenView(),
        ],
      ),
    );
  }
}
