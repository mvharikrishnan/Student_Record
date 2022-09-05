import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sample_student_record/db/functions/db_functions.dart';
import 'package:sample_student_record/db/model/data_model.dart';
// ignore_for_file: prefer_const_constructors

class Add_student extends StatefulWidget {
  Add_student({Key? key}) : super(key: key);

  @override
  State<Add_student> createState() => _Add_studentState();
}

class _Add_studentState extends State<Add_student> {
  final _formkey = GlobalKey<FormState>();
  // controller
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _batchController = TextEditingController();

  final _yearController = TextEditingController();

  //File? _ImageFile;
  String? _ImageFile;
  // File file = File(_ImageFile.path)

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              // width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.901,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'ADD STUDENTS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    imageProfieGet(context),
                    SizedBox(
                      height: 20,
                    ),
                    textformFieldFunction(
                      _nameController,
                      'Name',
                      TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Name';
                        }
                        // if (!RegExp(
                        //         r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid Name';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textformFieldFunction(
                      _ageController,
                      'Age',
                      TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid Age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textformFieldFunction(
                      _batchController,
                      'Batch',
                      TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Batch';
                        }
                        // if (!RegExp(
                        //         r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid Batch';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textformFieldFunction(
                      _yearController,
                      'Year',
                      TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your year';
                        }
                        if (!RegExp(r'^[0-3]+$').hasMatch(value)) {
                          return 'Please enter a valid Year';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onAddStudentButtonClick();
                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Sucessfully Added Record',),backgroundColor: Colors.blue,));
                          //ShowAddAlertBox();
                        }
                      },
                      icon: Icon(Icons.person_add_alt_1_sharp),
                      label: Text('ADD'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClick() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _batch = _batchController.text.trim();
    final _year = _yearController.text.trim();

    if (_name.isEmpty || _age.isEmpty || _batch.isEmpty || _year.isEmpty) {
      return print('The Forms is empty');
    }
    //print('$_name,$_age,$_batch,$_year,$_profile');
    final _student = StudentModel(
      name: _name,
      age: _age,
      batch: _batch,
      year: _year,
      profile_image: _ImageFile!,
    );
    addStudent(_student);
    //Navigator.pop(context);
    AddSnackBAr(context);
    clearText();

  }

  //Function for Text Form Field
  Widget textformFieldFunction(
      TextEditingController controller, String labelText, TextInputType type,
      {required String? Function(dynamic value) validator}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  //Function for Text Form Field End
  imageProfieGet(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: (_ImageFile != null)
              ? FileImage(File(_ImageFile!))
              : AssetImage('assets/images/user_icon.png') as ImageProvider,
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              //code for ontap method
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomsheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  //bottomsheet bar for asking the qustion for adding the image
  Widget bottomsheet() {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.photo_camera_rounded),
                label: Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final getimage = await picker.pickImage(
      source: source,
      //preferredCameraDevice: CameraDevice.front,
    );
    setState(() {
      _ImageFile = getimage!.path;
    });
    // _ImageFile = getimage;
  }

  // For Clearing Datas in the text form Field
  clearText() {
    _nameController.clear();
    _ageController.clear();
    _yearController.clear();
    _batchController.clear();
    setState(() {
      _ImageFile = null;
    });
  }

  AddSnackBAr(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Sucessfully Added Record',
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
