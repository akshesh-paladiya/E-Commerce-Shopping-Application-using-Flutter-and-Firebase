import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../functions/authFunctions.dart';
import '../views/home_screen/home.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);
  @override
  _Login_PageState createState() => _Login_PageState();
}
class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade100,
                    Colors.blue.shade100,
                    Colors.blue.shade300,
                  ]
              ),
            ),
            child: Form(
              key: _formKey,
              child:Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 120,),
                  Image(image: AssetImage('assets/images/cartify.png'),
                  ),
                  SizedBox(height: 70.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                    height: 345,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                          child: Text(
                            'Login to Your Account',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        login
                            ? Container( width: 250.0,)
                            : TextFormField(
                          key: ValueKey('fullname'),
                          decoration: InputDecoration(
                            hintText: 'Enter Full Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Full Name';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              fullname = value!;
                            });
                          },
                        ),
                        Container(

                          // width: 250.0,
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                         child: TextFormField(
                            key: ValueKey('email'),
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please Enter valid Email';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                          ),
                        ),

                        Container(
                          // width: 250,
                          child: TextFormField(
                            key: ValueKey('password'),
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                            ),
                            obscureText: true,

                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Please Enter Password of min length 6';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                          ),
                        ),


                        SizedBox(height: 20.0,),
                        Container(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(

                              onPressed: () async {
                                Route route = MaterialPageRoute(builder: (context) => Home());
                                Navigator.push(context, route);
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  login
                                      ? AuthServices.signinUser(email, password, context)
                                      : AuthServices.signupUser(
                                      email, password, fullname, context);
                                }
                              },
                              child: Text(login ? 'Login' : 'Signup')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {

                              setState(() {
                                login = !login;
                              });
                            },
                            child: Text(login
                                ? "Don't have an account? Signup"
                                : "Already have an account? Login"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}



