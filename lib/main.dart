
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_student_record/db/model/data_model.dart';

import 'package:sample_student_record/splash.dart';
// ignore_for_file: prefer_const_constructors

const Save_key_name = 'UserloggedIn';
Future<void> main()async{
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
  Hive.registerAdapter(StudentModelAdapter());
   await Hive.openBox<StudentModel>('Student_db');
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
      
      ),
      home:splashScreen(),
      
    );
  }
}