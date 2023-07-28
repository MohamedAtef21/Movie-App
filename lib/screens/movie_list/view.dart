import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/screens/core/logic/helper_method.dart';

import '../movie_details/view.dart';
import 'model.dart';
part 'item.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {

  bool isLoading = false;
  bool isFailed = false;
  int page = 1;
  List<MovieModel> list = [];

  Future<void> getMyMovie() async {
    list.clear();
    setState(() {});
    isLoading = true;
    setState(() {});
    try{
      var response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page");
      var responeList = response.data["results"] as List;

      for(int i = 0; i<responeList.length; i++){
        var model = MovieModel.frompMap(responeList[i]);
        list.add(model);
      }
    } on DioException {
      isFailed = true;
    }

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getMyMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xff705F93),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed:page>1?() {
                page--;
                getMyMovie();
              }:null,
              icon: const Icon(Icons.navigate_before)),
          Text("$page"),
          IconButton(
            onPressed: page<500?() {
              page++;
              getMyMovie();
            }:null,
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Center(child: Text("Movies")),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(): isFailed? Center(
          child: Lottie.asset("assets/images/animation_lkeciepe.json"),
        ) :Padding(
              padding: const EdgeInsets.all(10),
              child: RefreshIndicator(
                onRefresh: ()async{
                  await Future.delayed(const Duration(seconds: 1));
                 await getMyMovie();
                },
                child: ListView.separated(
          itemBuilder: (context, index) =>  _Item(model: list[index],),
          separatorBuilder: (context, index) => const SizedBox(height: 16,),
          itemCount: list.length,
        ),
              ),
            ),
      ),
    );
  }
}


