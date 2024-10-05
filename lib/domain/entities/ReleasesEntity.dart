/// backdrop_path : "/reNf6GBzOe48l9WEnFOxXgW56Vg.jpg"
/// genre_ids : [18,80,53]
/// id : 889737
/// original_title : "Joker: Folie à Deux"
/// overview : "While struggling with his dual identity, Arthur Fleck not only stumbles upon true love, but also finds the music that's always been inside him."
/// poster_path : "/aciP8Km0waTLXEYf5ybFK5CSUxl.jpg"
/// release_date : "2024-10-01"
/// title : "Joker: Folie à Deux"
/// video : false
/// vote_average : 6.135

class ReleasesEntity {
  ReleasesEntity({
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage,});

  ReleasesEntity.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    return map;
  }

}