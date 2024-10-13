/// id : 27
/// name : "Horror"

class GenresDetailsEntity {
  GenresDetailsEntity({
      this.id, 
      this.name,});

  GenresDetailsEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}