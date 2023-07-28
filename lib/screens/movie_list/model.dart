class MovieData {
  late int page, totalResult, totalPages;
  late List<MovieModel> list;
}

class MovieModel {

  late String title, image, overView, poster,releaseDate;
  late num vote;

  MovieModel({required this.title, required this.image, required this.overView, required this.poster, required this.vote,required this.releaseDate});

  MovieModel.frompMap(Map<String,dynamic> map){
    // image = map["poster_path"] == null? "assets/images/animation_lkeciepe.json" : "http://image.tmdb.org/t/p/original";
    image= "http://image.tmdb.org/t/p/original" + map["backdrop_path"];
    title = map["original_title"];
    overView = map["overview"];
    vote = map["vote_average"];
    poster = "http://image.tmdb.org/t/p/original" + map["poster_path"];
    vote = map["vote_average"];
    releaseDate = map["release_date"];
  }


}


