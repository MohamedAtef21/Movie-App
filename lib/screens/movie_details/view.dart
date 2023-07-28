import 'package:flutter/material.dart';
import 'package:movie/screens/movie_list/model.dart';



class MovieDetailsView extends StatefulWidget {
  final MovieModel model;
  const MovieDetailsView({Key? key,required this.model}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff758EB7),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.model.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.model.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      const Icon(Icons.star, color: Colors.orange,),
                      Text(widget.model.vote.toString(),style: const TextStyle(color: Colors.orange,fontWeight: FontWeight.w700,fontSize: 15),),
                      Text(widget.model.releaseDate),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(widget.model.overView,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Theme.of(context).hintColor),),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
