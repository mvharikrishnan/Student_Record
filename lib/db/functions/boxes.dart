import 'package:hive_flutter/adapters.dart';
import 'package:sample_student_record/db/model/data_model.dart';

class Boxes{
  static Box<StudentModel> getAll()=>Hive.box<StudentModel>('Student_db');
}