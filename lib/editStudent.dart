

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_student_record/db/functions/boxes.dart';

import 'package:sample_student_record/db/functions/db_functions.dart';
import 'package:sample_student_record/db/model/data_model.dart';
// ignore_for_file: prefer_const_constructors

class edit_student extends StatefulWidget {
  edit_student({Key? key,required this.editName,required this.editAge,required this.editBatch,required this.editYear,required this.id,required this.index, required this.editProfile}) : super(key: key);
  var editName;
  var editAge;
  var editBatch;
  var editYear;
  var id;
  var index;
  String editProfile;


  @override
  State<edit_student> createState() => _edit_studentState();
}

class _edit_studentState extends State<edit_student> {
  // controller
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _batchController = TextEditingController();

  final _yearController = TextEditingController();
  

  File? _ImageFile;
  // File file = File(_ImageFile.path)

  final ImagePicker picker = ImagePicker();

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
                  imageProfieGet(context,widget.editProfile),
                  SizedBox(
                    height: 20,
                  ),
                  textformFieldFunction(
                      _nameController, widget.editName, TextInputType.name),
                  SizedBox(
                    height: 20,
                  ),
                  textformFieldFunction(
                      _ageController, widget.editAge, TextInputType.number),
                  SizedBox(
                    height: 20,
                  ),
                  textformFieldFunction(
                      _batchController, widget.editBatch, TextInputType.name),
                  SizedBox(
                    height: 20,
                  ),
                  textformFieldFunction(
                      _yearController, widget.editYear, TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      onEditStudentButtonClick();
                    },
                    icon: Icon(Icons.person_add_alt_1_sharp),
                    label: Text('SAVE CHANGES'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onEditStudentButtonClick() async {
    final box=Boxes.getAll();
    List<StudentModel>gg=box.values.toList() as List<StudentModel>;
    final data =gg[widget.index];
    

    var _name= data.name;
    var _age= data.age;
    var _batch=data.batch;
    var _year=data.year;
    String _profile =data.profile_image;

    print(data.batch);

    if(_name==_nameController.text){
       
       _name = data.name;
    }
    else{
      _name = _nameController.text;
     
    }
    if(_ageController!=null){
        _age = _ageController.text;
        
    }
    else{
       _age = data.age;
    }
        if(_batchController!=data.batch){
          
       _batch = _batchController.text;
      
    }
    else{
      _batch = data.batch;
    }
        if(_yearController!=null){
           _year = _yearController.text;
    
    }
    else{
       _year = data.year;
      
    }

  
    // print('$_name,$_age,$_batch,$_year');
    final _student = StudentModel(name: _name, age: _age, batch: _batch, year: _year, profile_image: _profile);
    EditStudent(_student,widget.id);
     print("${data.name}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
     print("${_nameController.text}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
     data.save();
     
    Navigator.pop(context);
  }

  //Function for Text Form Field
  Widget textformFieldFunction(
      
      TextEditingController controller, String labelText, TextInputType type) {
    return TextFormField(
      controller: TextEditingController(text: labelText),
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
           backgroundImage: 
             FileImage(File(image),)
            
              //AssetImage('assets/images/user_icon.png'),
              
              
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
      _ImageFile =File( getimage!.path);
    });
   // _ImageFile = getimage;
  }
}
