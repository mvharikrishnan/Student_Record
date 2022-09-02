import 'package:flutter/material.dart';

import 'package:sample_student_record/add_student.dart';
//import 'package:sample_student_record/db/functions/db_functions.dart';
import 'package:sample_student_record/login.dart';
import 'package:sample_student_record/profileuser.dart';
import 'package:sample_student_record/view_student.dart';
// ignore_for_file: prefer_const_constructors

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // title: Center(
        //   child: Text(
        //     'STUDENT RECORD',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.black,
      ),

      //DRAWER START
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[900],
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => userProfile(),
                  ),
                );
              },
              child: Text(
                'ADON JACOB',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                'HOD-BCA Dept',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Text(
                      'Version 3.0.1',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text('Do you want to Log Out'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  gotoLogin(ctx);
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.logout_outlined),
                  label: Text('LOGOUT'),
                ),
              ],
            ),
          ],
        ),
      ),
      //DRAWER END

      // BODY START
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.fill)),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'STUDENT RECORD',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Add_student(),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 9,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: add_studetns_image(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => View_studens(),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 9,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: view_students_image(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //BODY END
    );
  }

  //user Profile
  // userprofile(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => userprofile(ctx),
  //     ),
  //   );
  // }
  gotoLogin(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => LoginScreen(),
      ),
    );
  }

  view_students_image() {
    return AssetImage('assets/images/VIEW STUDENTS.png');
  }

  add_studetns_image() {
    return AssetImage('assets/images/ADD STUDENTS.png');
  }
}
