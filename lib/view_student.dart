import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sample_student_record/db/functions/db_functions.dart';
import 'package:sample_student_record/db/model/data_model.dart';
import 'package:sample_student_record/editStudent.dart';
import 'package:sample_student_record/searchuser.dart';
import 'package:sample_student_record/studentProfile.dart';

class View_studens extends StatelessWidget {
  const View_studens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder(
        builder:
            (BuildContext ctx, List<StudentModel> StudentModel, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = StudentModel[index];
                  return Card(
                    color: Colors.blueGrey[50],
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StudentProfile_view(
                            dataListScren: data,
                          ),
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.profile_image)),
                      ),
                      title: Text(data.name),
                      subtitle: Text('Batch: ${data.batch}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => edit_student(
                                      editName: data.name,
                                      editAge: data.age,
                                      editBatch: data.batch,
                                      editYear: data.year,
                                      id: data.key,
                                      index: index,
                                      editProfile: data.profile_image,
                                      listKey: data.key),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            onPressed: () {
                              // if(data.id != null){
                              //   deleteStudent(index);
                              // }else{
                              //   print('Student ID Is NUll');
                              // }
                              deleteStudent(index);
                              // AlertDialog(
                              //   title: Text(
                              //     'DO YOU WANT TO DELETE?',
                              //     style: TextStyle(color: Colors.red),
                              //   ),
                              //   content: Text(
                              //       'This Will delete the Data Permenatly'),
                              //   actions: [
                              //     TextButton(
                              //       onPressed: () {

                              //       },
                              //       child: Text('Continue'),
                              //     ),
                              //   ],
                              // );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: StudentModel.length),
          );
        },
        valueListenable: studentListNotifier,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Search_Screen(),
          ),
        );
      },
      child: const Icon(Icons.search),
      ),
    );
  }
}
