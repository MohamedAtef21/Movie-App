import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/screens/core/logic/helper_method.dart';

import '../movie_list/view.dart';

class SplachScreenView extends StatefulWidget {
  const SplachScreenView({Key? key}) : super(key: key);

  @override
  State<SplachScreenView> createState() => _SplachScreenViewState();
}

class _SplachScreenViewState extends State<SplachScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() {navigateTo(context, MovieListView(),false);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/images/animation_lkfxqnz6.json")),
    );
  }
}
