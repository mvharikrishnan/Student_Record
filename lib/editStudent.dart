import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_student_record/db/functions/boxes.dart';

import 'package:sample_student_record/db/functions/db_functions.dart';
import 'package:sample_student_record/db/model/data_model.dart';
// ignore_for_file: prefer_const_constructors

class edit_student extends StatefulWidget {
  edit_student(
      {Key? key,
      required this.editName,
      required this.editAge,
      required this.editBatch,
      required this.editYear,
      required this.id,
      required this.index,
      required this.editProfile,
      required this.listKey})
      : super(key: key);
  var editName;
  var editAge;
  var editBatch;
  var editYear;
  var id;
  var index;
  var listKey;
  String editProfile;

  @override
  State<edit_student> createState() => _edit_studentState();
}

class _edit_studentState extends State<edit_student> {
   final _formkey = GlobalKey<FormState>();
  // controller
  //final _nameController = TextEditingController();

  //final _ageController = TextEditingController();

  //final _batchController = TextEditingController();

  //final _yearController = TextEditingController();
  TextEditingController? _nameController;
  TextEditingController? _ageController;
  TextEditingController? _batchController;
  TextEditingController? _yearController;

  String? _ImageFile;

  // File file = File(_ImageFile.path)
  String? updatedImage;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.editName);
    _ageController = TextEditingController(text: widget.editAge);
    _batchController = TextEditingController(text: widget.editBatch);
    _yearController = TextEditingController(text: widget.editYear);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
      ),
      body: ListView(
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
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'EDIT STUDENTS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    imageProfieGet(context, widget.editProfile),
              
                    SizedBox(
                      height: 20,
                    ),
                    // textformFieldFunction(
                    //     _nameController,TextInputType.name),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // textformFieldFunction(
                    //     _ageController,TextInputType.number),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // textformFieldFunction(
                    //     _batchController,TextInputType.name),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // textformFieldFunction(
                    //     _yearController,TextInputType.number),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        
                        ),
                        prefix: Text('NAME:')
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                            return 'Please enter your Name';
                          }
                          
                          return null;
                      },
                    ),
              
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefix: Text('AGE:')
                      ),
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
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _batchController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Batch',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefix: Text('BATCH:')
                      ),
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                            return 'Please enter your Batch';
                          }
                    
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _yearController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Year',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefix: Text('YEAR:')
                      ),
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
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onEditStudentButtonClick();
                        }
                      },
                      icon: Icon(Icons.person_add_alt_1_sharp),
                      label: Text('SAVE CHANGES'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onEditStudentButtonClick() async {
    final box = Boxes.getAll();
    List<StudentModel> gg = box.values.toList() as List<StudentModel>;
    final data = gg[widget.index];

    var _name = _nameController!.text;
    var _age = _ageController!.text;
    var _batch = _batchController!.text;
    var _year = _yearController!.text;

    String _profile =data.profile_image;

    //print(data.batch);

    if (_name != null) {
     // _name = data.name;
    } else {
      _name = _nameController!.text;
    }
    if (_ageController != null) {
     // _age = data.age;
    } else {
      _age = _ageController!.text;
    }
    if (_batchController != null) {
      //_batch = data.batch;
    } else {
      _batch = _batchController!.text;
    }
    if (_yearController != null) {
     // _year = data.year;
    } else {
      _year = _yearController!.text;
    }
    if (updatedImage != null) {
      return;
    } else {
      updatedImage =widget.editProfile;
    }

    // print('$_name,$_age,$_batch,$_year');
    
    final _student = StudentModel(
        name: _name,
        age: _age,
        batch: _batch,
        year: _year,
        profile_image: updatedImage!);
        
    EditStudent(_student, widget.id);
    
    EditSnackBAr(context);
    Navigator.pop(context);
  }

  //Function for Text Form Field
  Widget textformFieldFunction(
      TextEditingController controller, TextInputType type ) {
    return TextFormField(
      
      controller: TextEditingController(text: controller.text),
      keyboardType: type,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        // hintText: labelText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  //Function for Text Form Field End
  imageProfieGet(BuildContext context, String image) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: FileImage(File(image))
         
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
      updatedImage = getimage!.path;
    });
    // _ImageFile = getimage;
  }

  EditSnackBAr(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Sucessfully Edited Record',
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

 
  
}
