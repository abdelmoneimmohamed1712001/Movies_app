import 'package:movies_app/domain/entities/CategoriesEntity.dart';

/// id : 28
/// name : "Action"

class CategoriesModel {
  CategoriesModel({
      this.id, 
      this.name,});

  CategoriesModel.fromJson(dynamic json) {
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

  CategoriesEntity toCategoriesEntity(){
    return CategoriesEntity(
      id: id,
      name: name
    );
  }

}