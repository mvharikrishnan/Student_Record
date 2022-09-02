import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';
@HiveType(typeId: 1)
class StudentModel extends HiveObject {

  @HiveField(0)
    var name;

  @HiveField(1)
  var age;

  @HiveField(2)
  var batch;

  @HiveField(3)
  var year;

  @HiveField(4)
  String profile_image;

  @HiveField(5)
  int? id;

  StudentModel(
      {
      this.id,
      required this.profile_image,
      required this.name,
      required this.age,
      required this.batch, 
      required this.year
      });
}
