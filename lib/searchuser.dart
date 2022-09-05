//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_student_record/db/model/data_model.dart';
import 'package:sample_student_record/studentProfile.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  final _searchController = TextEditingController();

  final List<StudentModel> studentBoxList =
      Hive.box<StudentModel>('Student_db').values.toList();

  late List<StudentModel> displayStudent =
      List<StudentModel>.from(studentBoxList);

  void searchStudentList(String value) {
    setState(() {
      displayStudent = studentBoxList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Students'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                return;
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Students',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                searchStudentList(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: (displayStudent.length != 0)
                  ? ListView.separated(
                    
                      itemBuilder: (context, index) {
                         final data = displayStudent[index];
                        File imageFile =
                            File(displayStudent[index].profile_image);

                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(imageFile),
                              //radius: 50,
                            ),
                            title: Text(
                              displayStudent[index].name,
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(displayStudent[index].age),
                            trailing: Text('BATCH: ${displayStudent[index].batch}'),
                            onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StudentProfile_view(
                            dataListScren: data,
                          ),
                        ),
                      ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: displayStudent.length,
                    )
                  : Center(
                      child: Container(
                        color: Colors.white,
                        height: 30,
                        width: 200,
                        
                        child: Center(child: Text("Student Not Found!"),),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
