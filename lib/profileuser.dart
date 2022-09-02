import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
class userProfile extends StatelessWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),
          
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Text(
                
                'ADON JACOB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  
                  
                ),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
