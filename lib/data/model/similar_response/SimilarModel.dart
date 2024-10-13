import 'package:movies_app/domain/entities/SimilarEntity.dart';

/// adult : false
/// backdrop_path : "/cXU6IyG3hd85VaHe11P8M7ZXqcl.jpg"
/// genre_ids : [27]
/// id : 265018
/// original_language : "en"
/// original_title : "Indigenous"
/// overview : "A group of five American friends on the cusp of adulthood travel to Panama to relax and reconnect. They befriend a local woman in their hotel bar—and despite some ominous whispers—she goes against the specific instructions of her brother and brings the Americans on a daytrip into the pristine falls at the nearby jungle. What begins as an innocent outing to a picturesque waterfall quickly turns terrifying after she suddenly goes missing. As night closes in, the friends realize too late the truth behind the rumors—the legendary, blood-sucking Chupacabra is now stalking them."
/// popularity : 13.933
/// poster_path : "/m4ZzYr8gmjJl56b7v4LxA3tVcc8.jpg"
/// release_date : "2014-04-16"
/// title : "Indigenous"
/// video : false
/// vote_average : 5.9
/// vote_count : 175

class SimilarModel {
  SimilarModel({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  SimilarModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
  SimilarEntity toSimilarEntity(){
   return SimilarEntity(
     id: id,
     title: title,
     posterPath: posterPath,
     voteAverage: voteAverage,
     releaseDate: releaseDate
   );
  }

}