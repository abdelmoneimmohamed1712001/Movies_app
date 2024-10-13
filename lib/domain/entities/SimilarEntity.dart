/// adult : false
/// genre_ids : [27]
/// id : 265018
/// original_title : "Indigenous"
/// overview : "A group of five American friends on the cusp of adulthood travel to Panama to relax and reconnect. They befriend a local woman in their hotel bar—and despite some ominous whispers—she goes against the specific instructions of her brother and brings the Americans on a daytrip into the pristine falls at the nearby jungle. What begins as an innocent outing to a picturesque waterfall quickly turns terrifying after she suddenly goes missing. As night closes in, the friends realize too late the truth behind the rumors—the legendary, blood-sucking Chupacabra is now stalking them."
/// poster_path : "/m4ZzYr8gmjJl56b7v4LxA3tVcc8.jpg"
/// release_date : "2014-04-16"
/// title : "Indigenous"
/// vote_average : 5.9

class SimilarEntity {
  SimilarEntity({
      this.adult, 
      this.genreIds, 
      this.id, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.voteAverage,});

  SimilarEntity.fromJson(dynamic json) {
    adult = json['adult'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
  bool? adult;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }

}