import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_student_record/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier =ValueNotifier ([]);

//  Box<StudentModel> studentDB= Hive.box('Student_db'); 
void addStudent(StudentModel value)async{
 


final studentDB = await Hive.openBox<StudentModel>('Student_db');
  final _id = await studentDB.add(value);
  value.id = _id; 
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  // print(value.toString());
}
void EditStudent(StudentModel value,var id )async{
  

final studentDB = await Hive.openBox<StudentModel>('Student_db');
  await studentDB.put(id,value);
  // studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
   getAllStudents();
  // print(value.toString());
}

Future<void>getAllStudents()async{
  final studentDB = await Hive.openBox<StudentModel>('Student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners(); 
}
Future<void>deleteStudent(int id)async{
  final studentDB = await Hive.openBox<StudentModel>('Student_db');
  await studentDB.deleteAt(id);
  getAllStudents();
  //studentDB.delete(key);
}

// Future<void>editStudetList(StudentModel edit ,String Ename, String age ,int batch , int year)async{
// edit.name = Ename;
// edit.age = age;
// edit.batch = batch;
// edit.year = year;


// }
 