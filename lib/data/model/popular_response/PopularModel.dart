import 'package:movies_app/domain/entities/PopularEntity.dart';

/// adult : false
/// backdrop_path : "/dvBCdCohwWbsP5qAaglOXagDMtk.jpg"
/// genre_ids : [28,35,878]
/// id : 533535
/// original_language : "en"
/// original_title : "Deadpool & Wolverine"
/// overview : "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine."
/// popularity : 4402.238
/// poster_path : "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg"
/// release_date : "2024-07-24"
/// title : "Deadpool & Wolverine"
/// video : false
/// vote_average : 7.743
/// vote_count : 3510

class PopularModel {
  PopularModel({
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

  PopularModel.fromJson(dynamic json) {
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
PopularEntity toPopularEntity(){
return PopularEntity(
  id: id,
  title: title,
  backdropPath: backdropPath,
  posterPath: posterPath,
  releaseDate: releaseDate,
  overview: overview,
  voteAverage: voteAverage
);
}
}