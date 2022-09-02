import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_student_record/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Welcome to MGU'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                logoforlogin(),
              
                SizedBox(
                  height: 30,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Column(
                //     children: [
                //       TextFormField(
                //         controller: _usernameController,
                //         decoration: InputDecoration(
                //             filled: true,
                //             fillColor: Colors.grey[100],
                //             border: OutlineInputBorder(),

                //             // labelText: 'Username',
                //             hintText: 'Username'),
                //         validator: ((value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please Enter Username';
                //           }
                //         }),
                //       ),
                //       SizedBox(
                //         height: 30,
                //       ),
                //       TextFormField(
                //         controller: _passwordController,
                //         obscureText: true,
                //         decoration: InputDecoration(
                //             filled: true,
                //             fillColor: Colors.grey[100],
                //             border: OutlineInputBorder(),

                //             // labelText: 'Username',
                //             hintText: 'Password'),
                //         validator: ((value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please Enter Password';
                //           } else {
                //             return null;
                //           }
                //         }),
                //       ),
                //       SizedBox(
                //         height: 30,
                //       ),
                //       Row(
                //         children: [
                //           Visibility(
                //             child: Text(
                //               'Username and Password Doesnot Match',
                //               style: TextStyle(
                //                 color: Colors.red,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 30,
                //       ),
                //       ElevatedButton.icon(
                //         onPressed: () {
                //           Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder: (ctx) => home_screen(),
                //             ),
                //           );
                //         },
                //         icon: Icon(Icons.login_rounded),
                //         label: Text('LOGIN'),
                //       ),
                //     ],
                //   ),
                // ),
                ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => home_screen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.login_rounded),
                        label: Text('GET IN'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//checklogin

  void checklogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == 'user' && _password == 'user') {
      //gotohome
      final _sharedprefs = SharedPreferences.getInstance();
     
    } else {
      return null;
    }
  }

// Login Page Logo
   logoforlogin() {
    return const Image(
      image: AssetImage('assets/images/mg-logo.png',
      
    ),
    );
  }
// end of logologin
}
