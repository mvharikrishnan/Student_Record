import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_student_record/db/model/data_model.dart';

class StudentProfile_view extends StatelessWidget {
  StudentProfile_view({Key? key, required this.dataListScren})
      : super(key: key);
  StudentModel dataListScren;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      //backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(dataListScren.profile_image),),
                  ),
                  color: Colors.grey,
                  height: 200,
                  width: 200,
                  //create a child for image
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              dataListScren.name,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('BATCH: ${dataListScren.batch}')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('AGE: ${dataListScren.age}')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('YEAR: ${dataListScren.year}')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
