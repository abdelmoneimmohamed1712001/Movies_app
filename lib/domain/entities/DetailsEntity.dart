import 'GenresDetailsEntity.dart';

/// backdrop_path : "/sjC29cgm4qZAnpOJQbYKCxDCcra.jpg"
/// budget : 12000000
/// genres : [{"id":27,"name":"Horror"},{"id":878,"name":"Science Fiction"},{"id":53,"name":"Thriller"}]
/// homepage : "https://afraid.movie"
/// id : 1062215
/// original_title : "Afraid"
/// overview : "Curtis Pike and his family are selected to test a new home device: a digital assistant called AIA. AIA observes the family's behaviors and begins to anticipate their needs. And she can – and will – make sure nothing – and no one – gets in her family's way."
/// poster_path : "/gUREuXCnJLVHsvKXDH9fgIcfM6e.jpg"
/// release_date : "2024-08-28"
/// tagline : "Be careful what you let in."
/// title : "Afraid"
/// vote_average : 6.282

class DetailsEntity {
  DetailsEntity({
      this.backdropPath, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.tagline, 
      this.title, 
      this.voteAverage,});

  DetailsEntity.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresDetailsEntity.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  String? backdropPath;
  int? budget;
  List<GenresDetailsEntity>? genres;
  String? homepage;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? tagline;
  String? title;
  double? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['tagline'] = tagline;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }

}